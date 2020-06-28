# Do not edit. bazel-deps autogenerates this file from dependencies/maven/dependencies.yaml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output=ctx.path("jar/%s" % jar_name),
        url=ctx.attr.urls,
        sha256=ctx.attr.sha256,
        executable=False
    )
    src_name="%s-sources.jar" % ctx.name
    srcjar_attr=""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output=ctx.path("jar/%s" % src_name),
            url=ctx.attr.src_urls,
            sha256=ctx.attr.src_sha256,
            executable=False
        )
        srcjar_attr ='\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "com.google.api.grpc:proto-google-common-protos:1.12.0", "lang": "java", "sha1": "1140cc74df039deb044ed0e320035e674dc13062", "sha256": "bd60cd7a423b00fb824c27bdd0293aaf4781be1daba6ed256311103fb4b84108", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/api/grpc/proto-google-common-protos/1.12.0/proto-google-common-protos-1.12.0.jar", "source": {"sha1": "af18069b1d8368ffc8dce50a919df75f039cf507", "sha256": "936fdc055855a956ef82afb1b408bd0bd5ea5d040fe6f6fc25c4955879db649a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/api/grpc/proto-google-common-protos/1.12.0/proto-google-common-protos-1.12.0-sources.jar"} , "name": "com-google-api-grpc-proto-google-common-protos", "actual": "@com-google-api-grpc-proto-google-common-protos//jar", "bind": "jar/com/google/api/grpc/proto-google-common-protos"},
    {"artifact": "com.google.code.findbugs:jsr305:3.0.2", "lang": "java", "sha1": "25ea2e8b0c338a877313bd4672d3fe056ea78f0d", "sha256": "766ad2a0783f2687962c8ad74ceecc38a28b9f72a2d085ee438b7813e928d0c7", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar", "source": {"sha1": "b19b5927c2c25b6c70f093767041e641ae0b1b35", "sha256": "1c9e85e272d0708c6a591dc74828c71603053b48cc75ae83cce56912a2aa063b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2-sources.jar"} , "name": "com-google-code-findbugs-jsr305", "actual": "@com-google-code-findbugs-jsr305//jar", "bind": "jar/com/google/code/findbugs/jsr305"},
    {"artifact": "com.google.errorprone:error_prone_annotations:2.3.3", "lang": "java", "sha1": "42aa5155a54a87d70af32d4b0d06bf43779de0e2", "sha256": "ec59f1b702d9afc09e8c3929f5c42777dec623a6ea2731ac694332c7d7680f5a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.3.3/error_prone_annotations-2.3.3.jar", "source": {"sha1": "78f8f9d4d26ac14cda32564e07a40c3a0c4c5760", "sha256": "f58446b80b5f1e98bcb74dae5c0710ed8e52baafe5a4bb315f769f306d85634a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/errorprone/error_prone_annotations/2.3.3/error_prone_annotations-2.3.3-sources.jar"} , "name": "com-google-errorprone-error_prone_annotations", "actual": "@com-google-errorprone-error_prone_annotations//jar", "bind": "jar/com/google/errorprone/error-prone-annotations"},
    {"artifact": "com.google.guava:failureaccess:1.0.1", "lang": "java", "sha1": "1dcf1de382a0bf95a3d8b0849546c88bac1292c9", "sha256": "a171ee4c734dd2da837e4b16be9df4661afab72a41adaf31eb84dfdaf936ca26", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar", "source": {"sha1": "1d064e61aad6c51cc77f9b59dc2cccc78e792f5a", "sha256": "092346eebbb1657b51aa7485a246bf602bb464cc0b0e2e1c7e7201fadce1e98f", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1-sources.jar"} , "name": "com-google-guava-failureaccess", "actual": "@com-google-guava-failureaccess//jar", "bind": "jar/com/google/guava/failureaccess"},
    {"artifact": "com.google.guava:guava:28.1-android", "lang": "java", "sha1": "c2526f8fad32a65a6d7032dd8e9524eb276b108b", "sha256": "e112ce92c0f0733965eede73d94589c59a72128b06b08bba5ebe2f9ea672ef60", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/guava/28.1-android/guava-28.1-android.jar", "source": {"sha1": "9ac9044706a470997a815d740a2f21c06dc7274b", "sha256": "7048029c5488142e8697eab2f7cd6ddcd1c5098843d6a6818e9c58db86b5549d", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/guava/28.1-android/guava-28.1-android-sources.jar"} , "name": "com-google-guava-guava", "actual": "@com-google-guava-guava//jar", "bind": "jar/com/google/guava/guava"},
    {"artifact": "com.google.guava:listenablefuture:9999.0-empty-to-avoid-conflict-with-guava", "lang": "java", "sha1": "b421526c5f297295adef1c886e5246c39d4ac629", "sha256": "b372a037d4230aa57fbeffdef30fd6123f9c0c2db85d0aced00c91b974f33f99", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar", "name": "com-google-guava-listenablefuture", "actual": "@com-google-guava-listenablefuture//jar", "bind": "jar/com/google/guava/listenablefuture"},
    {"artifact": "com.google.j2objc:j2objc-annotations:1.3", "lang": "java", "sha1": "ba035118bc8bac37d7eff77700720999acd9986d", "sha256": "21af30c92267bd6122c0e0b4d20cccb6641a37eaf956c6540ec471d584e64a7b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.3/j2objc-annotations-1.3.jar", "source": {"sha1": "d26c56180205cbb50447c3eca98ecb617cf9f58b", "sha256": "ba4df669fec153fa4cd0ef8d02c6d3ef0702b7ac4cabe080facf3b6e490bb972", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/j2objc/j2objc-annotations/1.3/j2objc-annotations-1.3-sources.jar"} , "name": "com-google-j2objc-j2objc-annotations", "actual": "@com-google-j2objc-j2objc-annotations//jar", "bind": "jar/com/google/j2objc/j2objc-annotations"},
# duplicates in com.google.protobuf:protobuf-java promoted to 3.10.0
# - com.thesamet.scalapb:scalapb-runtime_2.12:0.9.0 wanted version 3.7.1
# - io.grpc:grpc-protobuf:1.25.0 wanted version 3.10.0
    {"artifact": "com.google.protobuf:protobuf-java:3.10.0", "lang": "java", "sha1": "410b61dd0088aab4caa05739558d43df248958c9", "sha256": "161d7d61a8cb3970891c299578702fd079646e032329d6c2cabf998d191437c9", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/protobuf/protobuf-java/3.10.0/protobuf-java-3.10.0.jar", "source": {"sha1": "3ee94b1a2c1a74d9a27196e39c4bcf8dd0101e70", "sha256": "47012b36fcd7c4325e07a3a3b43c72e1b2d7a7d79d8e2605f2327b1e81348133", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/google/protobuf/protobuf-java/3.10.0/protobuf-java-3.10.0-sources.jar"} , "name": "com-google-protobuf-protobuf-java", "actual": "@com-google-protobuf-protobuf-java//jar", "bind": "jar/com/google/protobuf/protobuf-java"},
    {"artifact": "com.lihaoyi:fastparse_2.12:2.1.3", "lang": "java", "sha1": "ed89a5550958bc33b876430ff3ef1e82a17a5ae7", "sha256": "e8b831a843c0eb5105d42e4b6febfc772b3aed3a853a899e6c8196e9ecc057df", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/lihaoyi/fastparse_2.12/2.1.3/fastparse_2.12-2.1.3.jar", "source": {"sha1": "dd9fe31c697f187c0e0b03cc7ebc319350aab02b", "sha256": "d7d33157d9dc83d3dd2cec6b4835bede4ce7b7d5e0bef6a08ff6c9e0efe78dd9", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/lihaoyi/fastparse_2.12/2.1.3/fastparse_2.12-2.1.3-sources.jar"} , "name": "com-lihaoyi-fastparse_2-12", "actual": "@com-lihaoyi-fastparse_2-12//jar", "bind": "jar/com/lihaoyi/fastparse-2-12"},
    {"artifact": "com.lihaoyi:sourcecode_2.12:0.1.7", "lang": "java", "sha1": "09e8529b7b8771acea441a2c8478824cd63c7e84", "sha256": "f07d79f0751ac275cc09b92caf3618f0118d153da7868b8f0c9397ce93c5f926", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/lihaoyi/sourcecode_2.12/0.1.7/sourcecode_2.12-0.1.7.jar", "source": {"sha1": "70db822028f2c93c3a730219d62b2b51ff18889e", "sha256": "7d0bb8c2de326485ffb02da7fca2fedd814b1ece6a86e1325594d593e5eaba63", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/lihaoyi/sourcecode_2.12/0.1.7/sourcecode_2.12-0.1.7-sources.jar"} , "name": "com-lihaoyi-sourcecode_2-12", "actual": "@com-lihaoyi-sourcecode_2-12//jar", "bind": "jar/com/lihaoyi/sourcecode-2-12"},
    {"artifact": "com.thesamet.scalapb:lenses_2.12:0.9.0", "lang": "java", "sha1": "61ac72d89569c42583a085f05cdef2651b1c1bb4", "sha256": "0a2fff4de17d270cea561618090c21d50bc891d82c6f9dfccdc20568f18d0260", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/thesamet/scalapb/lenses_2.12/0.9.0/lenses_2.12-0.9.0.jar", "source": {"sha1": "ae30d950c7f5152ab42c6b0d083e5825b48c55c5", "sha256": "107cb837f35186db75d4a1e343fcd809591daaf08459d6d328f0ad47f4ec968e", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/thesamet/scalapb/lenses_2.12/0.9.0/lenses_2.12-0.9.0-sources.jar"} , "name": "com-thesamet-scalapb-lenses_2-12", "actual": "@com-thesamet-scalapb-lenses_2-12//jar", "bind": "jar/com/thesamet/scalapb/lenses-2-12"},
    {"artifact": "com.thesamet.scalapb:scalapb-runtime-grpc_2.12:0.9.0", "lang": "java", "sha1": "6d45077312700500cd0c532da4f4509e672fe99b", "sha256": "925d8d86050991da6e024138fc21a1f2ff4f8aa49c1c5f76c71b330dbaec18d1", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/thesamet/scalapb/scalapb-runtime-grpc_2.12/0.9.0/scalapb-runtime-grpc_2.12-0.9.0.jar", "source": {"sha1": "4eeb0418c84b51f959240b3303b37a2992574c91", "sha256": "2aeb221edcd64b059587ba8462ff45ca3e45e46f35465bc6015c0f8b1d3b9cb0", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/thesamet/scalapb/scalapb-runtime-grpc_2.12/0.9.0/scalapb-runtime-grpc_2.12-0.9.0-sources.jar"} , "name": "com-thesamet-scalapb-scalapb-runtime-grpc_2-12", "actual": "@com-thesamet-scalapb-scalapb-runtime-grpc_2-12//jar", "bind": "jar/com/thesamet/scalapb/scalapb-runtime-grpc-2-12"},
    {"artifact": "com.thesamet.scalapb:scalapb-runtime_2.12:0.9.0", "lang": "java", "sha1": "c4d5deb1b89297942bb02982fc1d79bb56185cd1", "sha256": "b905fa66b3fd0fabf3114105cd73ae2bdddbb6e13188a6538a92ae695e7ad6ed", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/thesamet/scalapb/scalapb-runtime_2.12/0.9.0/scalapb-runtime_2.12-0.9.0.jar", "source": {"sha1": "aac9d1f2bb8cce82ca604f19dc87ffb96705ba43", "sha256": "2e1c8072c7b536e3599afabe6c60cd29ac3918640436c177224b3102e7ba007b", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/thesamet/scalapb/scalapb-runtime_2.12/0.9.0/scalapb-runtime_2.12-0.9.0-sources.jar"} , "name": "com-thesamet-scalapb-scalapb-runtime_2-12", "actual": "@com-thesamet-scalapb-scalapb-runtime_2-12//jar", "bind": "jar/com/thesamet/scalapb/scalapb-runtime-2-12"},
    {"artifact": "io.grpc:grpc-api:1.25.0", "lang": "java", "sha1": "414be0ed1690f3594fa2659d1ffedfc16d4b83ab", "sha256": "a269094009588213ab5386a6fb92426b8056a130b2653d3b4e59e971f2f1ef08", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/io/grpc/grpc-api/1.25.0/grpc-api-1.25.0.jar", "source": {"sha1": "6ed94fdfe3e066e1610f2c9a3030fd791e223d37", "sha256": "874baf0df28c81c923cef23dd9eba5a0ed975a7a375ae76308b51ac9b865dd7e", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/io/grpc/grpc-api/1.25.0/grpc-api-1.25.0-sources.jar"} , "name": "io-grpc-grpc-api", "actual": "@io-grpc-grpc-api//jar", "bind": "jar/io/grpc/grpc-api"},
    {"artifact": "io.grpc:grpc-context:1.25.0", "lang": "java", "sha1": "eebabd88cab3bb27ecd309eb244faa143385efc0", "sha256": "f4c8f878c320f6fb56c1c14692618f6df8253314b556176e32727afbc5921a73", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/io/grpc/grpc-context/1.25.0/grpc-context-1.25.0.jar", "source": {"sha1": "b21abf7f772a9b99635b710a82826b8ac15bbb22", "sha256": "f33582d91cb14195bc63f2088e389c543967aaa7a122095b05ec3ddf18236d75", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/io/grpc/grpc-context/1.25.0/grpc-context-1.25.0-sources.jar"} , "name": "io-grpc-grpc-context", "actual": "@io-grpc-grpc-context//jar", "bind": "jar/io/grpc/grpc-context"},
    {"artifact": "io.grpc:grpc-protobuf-lite:1.25.0", "lang": "java", "sha1": "6d010a8561443bcdb7ee26528440b8b8562ff1b3", "sha256": "9ba9aaa3e6997a04c707793c25e3ec88c6bad86f8d6f6b8b7a1a0c33ea2429d8", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/io/grpc/grpc-protobuf-lite/1.25.0/grpc-protobuf-lite-1.25.0.jar", "source": {"sha1": "3a163ca71515f803cf9886843d020a8d79e8c198", "sha256": "543ed22b35fea2dc65e6fa7e0b83b95d7c5808341c3ade9c6b5ea7ada410d9c0", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/io/grpc/grpc-protobuf-lite/1.25.0/grpc-protobuf-lite-1.25.0-sources.jar"} , "name": "io-grpc-grpc-protobuf-lite", "actual": "@io-grpc-grpc-protobuf-lite//jar", "bind": "jar/io/grpc/grpc-protobuf-lite"},
    {"artifact": "io.grpc:grpc-protobuf:1.25.0", "lang": "java", "sha1": "43ef1166fd0025025fb19135b602db9837a3d1d0", "sha256": "454dae7e246dac25526ed5b795d97a5dafedd3cc2042cfc810f02051d7d3e3cb", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/io/grpc/grpc-protobuf/1.25.0/grpc-protobuf-1.25.0.jar", "source": {"sha1": "3fb6ca0ef15300f8fcabbd88fd88a1785f14dd62", "sha256": "fcc1992e99679d262fcf9be1501a511f3515f74f7ac6a1b4e52af6c55dc6f3f6", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/io/grpc/grpc-protobuf/1.25.0/grpc-protobuf-1.25.0-sources.jar"} , "name": "io-grpc-grpc-protobuf", "actual": "@io-grpc-grpc-protobuf//jar", "bind": "jar/io/grpc/grpc-protobuf"},
    {"artifact": "io.grpc:grpc-stub:1.25.0", "lang": "java", "sha1": "083685dceca042f2ca1d50f17f7eb280e751ecc4", "sha256": "1532e291c0e9fd8230a6416c8ebbd902d99c7e2760241ae638ea761aa3dd5f43", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/io/grpc/grpc-stub/1.25.0/grpc-stub-1.25.0.jar", "source": {"sha1": "a603a774db885f54e27f3734a26cb5206dda64c2", "sha256": "3ebc649b8125ed0d4ecbb868f7424263a5ccf420fc7967f920a062045373cb40", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/io/grpc/grpc-stub/1.25.0/grpc-stub-1.25.0-sources.jar"} , "name": "io-grpc-grpc-stub", "actual": "@io-grpc-grpc-stub//jar", "bind": "jar/io/grpc/grpc-stub"},
    {"artifact": "org.checkerframework:checker-compat-qual:2.5.5", "lang": "java", "sha1": "435dc33e3019c9f019e15f01aa111de9d6b2b79c", "sha256": "11d134b245e9cacc474514d2d66b5b8618f8039a1465cdc55bbc0b34e0008b7a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/checkerframework/checker-compat-qual/2.5.5/checker-compat-qual-2.5.5.jar", "source": {"sha1": "54d4253d4d8723096a95b7551bd5639e7e2affba", "sha256": "7c63a4a46b2ef903f941aeac63da87dd345be3243b472796aa945fa715bf3ca9", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/checkerframework/checker-compat-qual/2.5.5/checker-compat-qual-2.5.5-sources.jar"} , "name": "org-checkerframework-checker-compat-qual", "actual": "@org-checkerframework-checker-compat-qual//jar", "bind": "jar/org/checkerframework/checker-compat-qual"},
    {"artifact": "org.codehaus.mojo:animal-sniffer-annotations:1.17", "lang": "java", "sha1": "f97ce6decaea32b36101e37979f8b647f00681fb", "sha256": "92654f493ecfec52082e76354f0ebf87648dc3d5cec2e3c3cdb947c016747a53", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.17/animal-sniffer-annotations-1.17.jar", "source": {"sha1": "8fb5b5ad9c9723951b9fccaba5bb657fa6064868", "sha256": "2571474a676f775a8cdd15fb9b1da20c4c121ed7f42a5d93fca0e7b6e2015b40", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/codehaus/mojo/animal-sniffer-annotations/1.17/animal-sniffer-annotations-1.17-sources.jar"} , "name": "org-codehaus-mojo-animal-sniffer-annotations", "actual": "@org-codehaus-mojo-animal-sniffer-annotations//jar", "bind": "jar/org/codehaus/mojo/animal-sniffer-annotations"},
    {"artifact": "org.scala-lang:scala-library:2.12.8", "lang": "java", "sha1": "36b234834d8f842cdde963c8591efae6cf413e3f", "sha256": "321fb55685635c931eba4bc0d7668349da3f2c09aee2de93a70566066ff25c28", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.12.8/scala-library-2.12.8.jar", "source": {"sha1": "45ccb865e040cbef5d5620571527831441392f24", "sha256": "11482bcb49b2e47baee89c3b1ae10c6a40b89e2fbb0da2a423e062f444e13492", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.12.8/scala-library-2.12.8-sources.jar"} , "name": "org-scala-lang-scala-library", "actual": "@org-scala-lang-scala-library//jar", "bind": "jar/org/scala-lang/scala-library"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)
