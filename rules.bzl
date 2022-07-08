def pulumi_python_project(data=[], deps=[], visibility=None):
  native.py_binary(
    name = "__main__",
    srcs = ["__main__.py"],
    deps = deps,
    data = data,
  )

  # We have a complicated genrule here because I can't find any other way
  # for the binary to know what the Pulumi project directory should
  # be. Specifying it in `env` will only work if the `:pulumi` target
  # is run via `bazel` and not if run stand-alone.
  native.genrule(
    name = "gen_pulumi",
    cmd = 'sed "s={{BASE_DIR}}=$$(dirname $(location :__main__))=" $(location @pulumi_bazel//:pulumi.py) > $(OUTS)',
    outs = ["pulumi.py"],
    tools = ["@pulumi_bazel//:pulumi.py", "__main__"]
  )

  native.py_binary(
    name = "python",
    srcs = ["@pulumi_bazel//:python.py"],
    deps = [":__main__"]
  )
  
  native.py_binary(
    name = "pulumi",
    srcs = [":pulumi.py"],
    data = [":python"] + ["Pulumi.yaml"] + native.glob(["Pulumi.*.yaml"]),
    deps = ["@rules_python//python/runfiles"],
    visibility = visibility,
  )
