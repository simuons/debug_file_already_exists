##############################################################################
# Common                                                                     #
##############################################################################
load("@rules_proto//proto:defs.bzl", "proto_library")

proto_library(
    name = "pill_proto",
    srcs = ["pill.proto"],
    strip_import_prefix = "/legacy",
    visibility = ["//visibility:public"],
)

filegroup(
    name = "package-srcs",
    srcs = glob(["**/*.proto"]),
    visibility = ["//visibility:public"],
)

##############################################################################
# Java                                                                       #
##############################################################################
load("@rules_proto_grpc//java:defs.bzl", "java_proto_compile")

java_proto_compile(
    name = "pill_java_proto",
    deps = [":pill_proto"],
)

java_library(
    name = "pill_java",
    srcs = [":pill_java_proto"],
    resource_strip_prefix = "legacy",
    resources = [
        "//legacy/kit/protobuf:package-srcs",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//dependencies/maven/artifacts/com/thesamet/scalapb:scalapb-runtime-grpc-2-12",
        "//dependencies/maven/artifacts/io/grpc:grpc-protobuf",
        "//dependencies/maven/artifacts/io/grpc:grpc-stub",
    ],
)

###############################################################################
# Scala                                                                       #
###############################################################################
load("@rules_proto_grpc//scala:defs.bzl", "scala_proto_compile")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library")

scala_proto_compile(
    name = "pill_scala_proto",
    deps = [":pill_proto"],
)

scala_library(
    name = "pill_scala",
    srcs = [":pill_scala_proto"],
    resource_strip_prefix = "legacy",
    resources = [
        "//legacy/kit/protobuf:package-srcs",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":pill_java",
        "//dependencies/maven/artifacts/com/thesamet/scalapb:scalapb-runtime-grpc-2-12",
    ],
)
