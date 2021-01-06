def process_settings(CUDA, CUDNN, CUDNN_HALF, OPENCV, AVX, OPENMP, ZED_CAMERA):

    COPTS = []
    DEPS = []
    DEFINES = []
    LINKOPTS = [
        "-lpthread",
        "-lm",
    ]

    if CUDA and not CUDNN:
        DEPS.append("@cuda")
        DEFINES.append("GPU")

    if CUDNN and CUDA:
        DEPS.append("@cuda_cudnn")
        DEFINES.append("GPU")
    
    if CUDNN_HALF and CUDNN:
        DEFINES.append("CUDNN_HALF")

    if OPENCV:
        DEPS.append("//bazel/external/cmakeTargets:opencv")
        DEFINES.append("OPENCV")

    if AVX:
        AVX_COPTS = [
            "-ffp-contract=fast",
            "-mavx",
            "-mavx2", 
            "-msse3",
            "-msse4.1",
            "-msse4.2",
            "-msse4a"
        ]
        COPTS += AVX_COPTS

    if OPENMP:
        COPTS.append("-fopenmp")
        LINKOPTS.append("-lgomp")

    if ZED_CAMERA:
        
        DEPS.append("@zed_camera")
        DEFINES.append("ZED_STEREO")

    return COPTS, LINKOPTS, DEPS, DEFINES
