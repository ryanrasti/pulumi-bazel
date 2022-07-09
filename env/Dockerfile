FROM ubuntu:22.04
RUN apt-get update && apt-get install -y ca-certificates
ADD https://github.com/bazelbuild/bazelisk/releases/download/v1.12.0/bazelisk-linux-amd64 /usr/bin/bazel
RUN chmod u+x /usr/bin/bazel
RUN bazel
RUN mkdir /src
WORKDIR /src
