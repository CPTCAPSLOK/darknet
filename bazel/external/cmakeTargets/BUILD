load("@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external")
licenses(["notice"])
package(default_visibility = ["//visibility:public"])

cmake_external(
    name = "opencv",
    cmake_options = [
#        "-DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules",
        "-DBUILD_LIST=core,highgui,imgcodecs,imgproc,video,videoio",
        "-DCMAKE_BUILD_TYPE=RELEASE",
        "-DBUILD_TESTS=OFF",
        "-DBUILD_PERF_TESTS=OFF",
        "-DBUILD_opencv_apps=OFF",
        "-DBUILD_opencv_world=ON",
        "-DBUILD_opencv_python3=OFF",
        "-DBUILD_opencv_python=OFF",
        "-DBUILD_APPS=OFF",
        "-DBUILD_EXAMPLES=OFF",
        "-DOPENCV_ENABLE_NONFREE=OFF",
        "-DWITH_IPP=ON",
        "-DWITH_OPENMP=ON",
        "-DWITH_TBB=ON",
        "-DENABLE_FAST_MATH=1",
        ### CUDA
        "-DWITH_CUDA=0",
        "-DWITH_CUDNN=0",
        "-DWITH_CUBLAS=0",
        "-DCUDA_FAST_MATH=0",
        "-DOPENCV_DNN_CUDA=0",
        ###
        "-DBUILD_SHARED_LIBS=1",
    ],
    lib_source = "@com_github_opencv_opencv//:all",
    make_commands = [
        "make -j$(nproc)",
        "make install",
    ],
    out_include_dir = "include/opencv4",
    shared_libraries = [
        "libopencv_world.so.4.5"
    ],
    visibility = ["//visibility:public"],
)
