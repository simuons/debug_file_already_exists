java_library(
    name = "lenses-2-12",
    exports = [
        "//dependencies/maven/artifacts/org/scala-lang:scala-library",
        "//external:jar/com/thesamet/scalapb/lenses-2-12"
    ],
    visibility = [
        "//dependencies/maven/artifacts:__subpackages__"
    ]
)



java_library(
    name = "scalapb-runtime-2-12",
    exports = [
        "//dependencies/maven/artifacts/com/google/protobuf:protobuf-java",
        "//dependencies/maven/artifacts/com/lihaoyi:fastparse-2-12",
        "//dependencies/maven/artifacts/org/scala-lang:scala-library",
        "//external:jar/com/thesamet/scalapb/scalapb-runtime-2-12",
        ":lenses-2-12"
    ],
    visibility = [
        "//dependencies/maven/artifacts:__subpackages__"
    ]
)



java_library(
    name = "scalapb-runtime-grpc-2-12",
    exports = [
        "//dependencies/maven/artifacts/io/grpc:grpc-protobuf",
        "//dependencies/maven/artifacts/io/grpc:grpc-stub",
        "//dependencies/maven/artifacts/org/scala-lang:scala-library",
        "//external:jar/com/thesamet/scalapb/scalapb-runtime-grpc-2-12",
        ":scalapb-runtime-2-12"
    ],
    visibility = [
        "//visibility:public"
    ]
)


