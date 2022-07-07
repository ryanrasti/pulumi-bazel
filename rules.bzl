def pulumi_python(name, data=[], deps=[], visibility=None):
  native.py_binary(
    name = "__main__",
    srcs = ["__main__.py"],
    deps = deps,
    data = data,
  )

  native.py_binary(
    name = "python",
    srcs = ["@pulumi_bazel//:python.py"],
    deps = [":__main__"]
  )
  
  native.sh_binary(
    name = name,
    srcs = ["@pulumi_bazel//:pulumi.sh"],
    env = {"PULUMI_PYTHON_CMD": "$(location :python)",
           "PULUMI_YAML": "$(location :Pulumi.yaml)"
    },
    data = [":python"] + ["Pulumi.yaml"] + native.glob(["Pulumi.*.yaml"]),
    visibility = visibility,
  )
