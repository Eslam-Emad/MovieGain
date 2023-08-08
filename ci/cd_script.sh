# This script is used to run the Bazel build and tests in the CI/CD pipeline

# Run the Bazel build
bazel build //...

# Run the Bazel tests
bazel test //...