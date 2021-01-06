load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "cuda_cudnn",
    srcs = glob([
        "lib/libcuda.so*",
        "lib/libcudart.so*",
        "lib/libcublas.so*",
        "lib/libcurand.so*",
        "lib/libcudnn.so*",
    ]),
    hdrs = glob([
        "include/**/*.hpp",
        "include/**/*.h",
        "include/cuda/**"
    ]),
    includes = ["include"],
    visibility = ["//visibility:public"],
)
