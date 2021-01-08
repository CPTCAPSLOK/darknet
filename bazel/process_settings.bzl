def process_settings(CUDA, CUDNN, CUDNN_HALF, OPENCV, AVX, OPENMP, ZED_CAMERA):

    COPTS = [
        "-Wl,-rpath,./_solib_k8/_U_S_Sbazel_Sexternal_ScmakeTargets_Copencv___Ubazel_Sexternal_ScmakeTargets_Sopencv_Slib"
    ]
    DEPS = []
    DEFINES = []
    LINKOPTS = [
        "-lpthread",
        "-lm",
        "-Wl,-rpath,./_solib_k8/_U_S_Sbazel_Sexternal_ScmakeTargets_Copencv___Ubazel_Sexternal_ScmakeTargets_Sopencv_Slib",
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
        DEPS.append("@opencv")
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
