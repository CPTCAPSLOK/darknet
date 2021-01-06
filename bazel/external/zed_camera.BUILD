load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "zed_camera",
    srcs = glob(["lib/*.so*"]),
    hdrs = glob(["include/**/*.hpp"]),
    includes = ["include"],
    visibility = ["//visibility:public"], 
    linkstatic = 1,
)
