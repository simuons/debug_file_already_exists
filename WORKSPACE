load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_jar")

# Loading rules_proto_grpc
rules_proto_sha = "e74bb982c8c1cb1d97b90fc1135335c92e32f763"

http_archive(
    name = "rules_proto_grpc",
    url = "https://github.com/amitz/rules_proto_grpc/archive/%s.tar.gz" % rules_proto_sha,
    sha256 = "d996b8b7683c9d606311a98e45dba4c377ea139f757472c4398092520b926940",
    strip_prefix = "rules_proto_grpc-%s" % rules_proto_sha
)

load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_toolchains", "rules_proto_grpc_repos")

rules_proto_grpc_toolchains()

rules_proto_grpc_repos()

# Java rules

load("@rules_proto_grpc//java:repositories.bzl", rules_proto_grpc_java_repos="java_repos")

rules_proto_grpc_java_repos()

# Initializaing rules_scala from within rules_proto_grpc

load("@rules_proto_grpc//scala:repositories.bzl", rules_proto_grpc_scala_repos="scala_repos")

rules_proto_grpc_scala_repos()

load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")

scala_repositories()

load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")

scala_register_toolchains()

# Bazel Deps setup
http_jar(
    name = "bazel_deps",
    url = "https://github.com/graknlabs/bazel-deps/releases/download/0.3/grakn-bazel-deps-0.3.jar",
    sha256 = "8ea739427526a1719afead62920d3520df60e7595366f357456d204cfd50507c"
)

load("//dependencies/maven:dependencies.bzl", "maven_dependencies")

maven_dependencies()
