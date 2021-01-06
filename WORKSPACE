load("//bazel:http_archive.bzl", "get_http_archive")
#########################################################
get_http_archive("rules_foreign_cc")
load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")
rules_foreign_cc_dependencies()


all_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""
get_http_archive(
    name = "opencv",
    build_file_content = all_content,
)

#########################################################
new_local_repository(
    name = "zed_camera",
    path = "/usr/local/zed",
    build_file = "//bazel/external:zed_camera.BUILD",
)

new_local_repository(
    name = "cuda",
    path = "/usr/lib/cuda",
    build_file = "//bazel/external:cuda.BUILD",
)

new_local_repository(
    name = "cuda_cudnn",
    path = "/usr/lib/cuda",
    build_file = "//bazel/external:cuda_cudnn.BUILD",
)
