load("@rules_cc//cc:defs.bzl", "cc_library", "cc_binary")
load("//bazel:process_settings.bzl", "process_settings")
load("@com_github_google_rules_install//installer:def.bzl", "installer")
###################################
CUDA = False
CUDNN = False
CUDNN_HALF = False
OPENCV = True
AVX = True
OPENMP = True
ZED_CAMERA = False
###################################
COPTS, LINKOPTS, DEPS, DEFINES = process_settings(CUDA=CUDA, CUDNN=CUDNN, CUDNN_HALF=CUDNN_HALF, OPENCV=OPENCV, AVX=AVX, OPENMP=OPENMP, ZED_CAMERA=ZED_CAMERA)


cc_library(
    name = "darknetlib",
    hdrs = glob([
        "include/**/*.h",
	    "3rdparty/stb/include/**/*.h",
	    "src/**/*.h",
        "include/**/*.hpp",
    ]),
    srcs = glob([
        "src/**/*.c",
        "src/**/*.cpp",
    ],
    exclude=[
        "src/yolo_console_dll.cpp",
    ],
    ),
    copts = COPTS + [
        "-fvisibility=hidden",
    ],
    linkopts = LINKOPTS,
    includes = [
        "include", 
        "3rdparty/stb/include",
    ],
    deps = DEPS,
    defines = DEFINES + [
        "LIB_EXPORTS",
    ],
    linkstatic = False
)

cc_binary(
    name = "uselib",
    srcs = [
        "src/yolo_console_dll.cpp",
        "include/yolo_v2_class.hpp",
    ],
    includes = [
        "include",
    ],
    deps = [
        ":darknetlib"
    ],
    linkstatic = False,
)

cc_binary(
    name = "darknet",
    srcs = glob([
        "include/**/*.h",
        "src/**/*.h",
        "src/**/*.c",
        "src/**/*.cpp",
        "3rdparty/stb/include/**/*.h",
    ],
    exclude=[
        "src/yolo_v2_class.cpp",
        "src/yolo_console_dll.cpp",
    ],),
    copts = COPTS,
    linkopts = LINKOPTS,
    includes = [
        "src",
        "include",
        "3rdparty/stb/include",
    ],
    deps = DEPS,
    defines = DEFINES,
    linkstatic = False,
)

installer(
    name = "install_darknet",
    data = [":darknet"],
)

installer(
    name = "install_uselib",
    data = [":uselib"],
    target_subdir = "lib"
)

installer(
    name = "install_lib",
    data = [":darknetlib"],
    target_subdir = "lib"
)