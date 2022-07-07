load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "rules_python",
    sha256 = "cdf6b84084aad8f10bf20b46b77cb48d83c319ebe6458a18e9d2cebf57807cdd",
    strip_prefix = "rules_python-0.8.1",
    url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.8.1.tar.gz",
)

load("@rules_python//python:repositories.bzl", "python_register_toolchains")

python_register_toolchains(
    name = "python3_9",
    python_version = "3.9",
)

load("@python3_9//:defs.bzl", "interpreter")

load("@rules_python//python:pip.bzl", "pip_install")

# Create a central external repo, @pip, that contains Bazel targets for all the
# third-party packages specified in the requirements.txt file.
pip_install(
   name = "pip_main",
   requirements = "//:requirements.txt",
   python_interpreter_target=interpreter
)

pip_install(
   name = "pip_test",
   requirements = "//test/project:requirements.txt",
   python_interpreter_target=interpreter
)
