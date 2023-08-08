load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_dart",
    sha256 = "<sha256>",
    strip_prefix = "rules_dart-dart_rules_1_0_0",
    urls = ["https://github.com/bazelbuild/rules_dart/archive/dart_rules_1_0_0.zip"],
)

load("@io_bazel_rules_dart//dart:repositories.bzl", "dart_repositories")

dart_repositories()

load("@io_bazel_rules_flutter//flutter:repositories.bzl", "flutter_repositories")

flutter_repositories()