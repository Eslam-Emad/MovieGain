# Load the http_archive rule to download and extract a zip archive
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Download and extract the Dart rules for Bazel
http_archive(
    name = "io_bazel_rules_dart",
    sha256 = "<sha256>",
    strip_prefix = "rules_dart-dart_rules_1_0_0",
    urls = ["https://github.com/bazelbuild/rules_dart/archive/dart_rules_1_0_0.zip"],
)

# Load the Dart dependencies for the project
load("@io_bazel_rules_dart//dart:repositories.bzl", "dart_repositories")

dart_repositories()

# Load the Flutter dependencies for the project
load("@io_bazel_rules_flutter//flutter:repositories.bzl", "flutter_repositories")

flutter_repositories()