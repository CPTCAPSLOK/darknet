load(":repository_locations.bzl", "REPOSITORY_LOCATIONS")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
# load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def get_http_archive(name, **kwargs):
    # `existing_rule_keys` contains the names of repositories that have already
    # been defined in the Bazel workspace. By skipping repos with existing keys,
    # users can override dependency versions by using standard Bazel repository
    # rules in their WORKSPACE files.
    existing_rule_keys = native.existing_rules().keys()
    if name in existing_rule_keys:
        # This repository has already been defined, probably because the user
        # wants to override the version. Do nothing.
        return
    location = REPOSITORY_LOCATIONS[name]

    # HTTP tarball at a given URL. Add a BUILD file if requested.
    http_archive(
        name = name,
        urls = location["urls"],
        sha256 = location["sha256"],
        strip_prefix = location.get("strip_prefix", ""),
        **kwargs
    )

def get_dependencies():
    # Setup rules_foreign_cc
    get_http_archive("rules_foreign_cc")
    get_http_archive("com_github_google_rules_install")
    native.new_local_repository(
        name = "zed_camera",
        path = "/usr/local/zed",
        build_file = "//bazel/external:zed_camera.BUILD",
    )

    native.new_local_repository(
        name = "cuda",
        path = "/usr/lib/cuda",
        build_file = "//bazel/external:cuda.BUILD",
    )

    native.new_local_repository(
        name = "cuda_cudnn",
        path = "/usr/lib/cuda",
        build_file = "//bazel/external:cuda_cudnn.BUILD",
    )
     

def build_cmake_targets(all_content):
    get_http_archive(
        name = "com_github_opencv_opencv",
        build_file_content = all_content
    )