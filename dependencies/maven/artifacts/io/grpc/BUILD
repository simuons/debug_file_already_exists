java_library(
    name = "grpc-api",
    exports = [
        "//dependencies/maven/artifacts/com/google/code/findbugs:jsr305",
        "//dependencies/maven/artifacts/com/google/errorprone:error-prone-annotations",
        "//dependencies/maven/artifacts/com/google/guava:guava",
        "//dependencies/maven/artifacts/org/codehaus/mojo:animal-sniffer-annotations",
        "//external:jar/io/grpc/grpc-api",
        ":grpc-context"
    ],
    visibility = [
        "//dependencies/maven/artifacts:__subpackages__"
    ]
)



java_library(
    name = "grpc-context",
    exports = [
        "//external:jar/io/grpc/grpc-context"
    ],
    visibility = [
        "//dependencies/maven/artifacts:__subpackages__"
    ]
)



java_library(
    name = "grpc-protobuf",
    exports = [
        "//dependencies/maven/artifacts/com/google/api/grpc:proto-google-common-protos",
        "//dependencies/maven/artifacts/com/google/guava:guava",
        "//dependencies/maven/artifacts/com/google/protobuf:protobuf-java",
        "//external:jar/io/grpc/grpc-protobuf",
        ":grpc-api",
        ":grpc-protobuf-lite"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "grpc-protobuf-lite",
    exports = [
        "//dependencies/maven/artifacts/com/google/guava:guava",
        "//external:jar/io/grpc/grpc-protobuf-lite",
        ":grpc-api"
    ],
    visibility = [
        "//dependencies/maven/artifacts:__subpackages__"
    ]
)



java_library(
    name = "grpc-stub",
    exports = [
        "//external:jar/io/grpc/grpc-stub",
        ":grpc-api"
    ],
    visibility = [
        "//visibility:public"
    ]
)


