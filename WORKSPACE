load("//bazel:http_archive.bzl", "get_http_archive")
#########################################################
get_http_archive("rules_foreign_cc")

new_local_repository(
    name = "opencv",
    path = "/opt/opencv",
    build_file = "//bazel/external:opencv.BUILD",
)

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
