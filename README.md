# pulumi-bazel
Pulumi integration with Bazel

Requirements:
1. `pulumi` installed

Usage:
1. Load this workspace as an external workspace:
```
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
git_repository(
    name = "pulumi_bazel",
    remote = "https://github.com/ryanrasti/pulumi-bazel"
)
```
1. Use the rule `pulumi_python` in the directory with your pulumi project. See `test/project/BUILD` for an example.
1. Run using `bazel run //directory/to/pulumi/project:pulumi`. The `pulumi` target is created for you and should be used in place of the regular invocation to `pulumi`
