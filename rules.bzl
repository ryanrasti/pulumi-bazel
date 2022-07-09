def pulumi_python_project(data=[], deps=[], visibility=None):
  native.py_binary(
    name = "__main__",
    srcs = ["__main__.py"],
    deps = deps,
    data = data,
  )

  # We have a complicated genrule here because I can't find any other way
  # for the binary to know what the pulumi project directory is. This way
  # the `pulumi.py`
  native.genrule(
    name = "gen_pulumi",
    cmd = 'cat $(location @pulumi_bazel//:pulumi.py) > $(OUTS)',
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
    srcs = [":gen_pulumi"],
    data = [":python", "Pulumi.yaml",  "@pulumi//:binaries"] + native.glob(["Pulumi.*.yaml"]),
    deps = ["@rules_python//python/runfiles"],
    visibility = visibility,
  )
