FROM ubuntu:22.04

# https://docs.bazel.build/versions/main/install-ubuntu.html#install-on-ubuntu
# Note that we also need Python for the shebang added to python targets!
RUN apt-get update && apt-get install -y apt-transport-https curl gnupg python3
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
RUN mv bazel.gpg /etc/apt/trusted.gpg.d/
RUN echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN apt-get update && apt-get install -y bazel

RUN mkdir /src
WORKDIR /src
