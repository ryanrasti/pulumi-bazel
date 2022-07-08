# pulumi-bazel
Pulumi integration with Bazel

Requirements:
1. `pulumi` installed

Usage:
1. Load the pulumi dependency and this workspace as an external workspace:
```
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
git_repository(
    name = "pulumi_bazel",
    remote = "https://github.com/ryanrasti/pulumi-bazel.git"
)

http_archive(
    name = "pulumi",
    sha256 = "2d7e0ce78520799b130e3525378f353a339981d53064883f794a670c9cc5d4e8",
    url = "https://github.com/pulumi/pulumi/releases/download/v3.35.3/pulumi-v3.35.3-linux-x64.tar.gz",
    build_file = "@pulumi_bazel//:pulumi.BUILD",
)
```
1. Use the rule `pulumi_python` in the directory with your pulumi project. See `test/project/BUILD` for an example.
1. Run using `bazel run //directory/to/pulumi/project:pulumi`. The `pulumi` target is created for you and should be used in place of the regular invocation to `pulumi`

Note: you will likely need `pip` dependencies via Bazel:
1. You should remove the `venv` configuration in your `Pulumi.yaml` file
1. You will need to declare `pip` dependencies in your `WORKSPACE` file. See `./WORKSPACE` for an example.

Note: since the likely use-case is that you will run pulumi commands via `bazel` and
want to keep the outputs (e.g., stack yaml files) in source control, the generated
`//...:pulumi` target is run in the actual source directory (rather than a generated one).

TODO: user should have an option to use a local pulumi install rather than use the hermetic one.
TODO: user shouldn't need to copy two dependencies -- pulumi dependency should be automatic.
