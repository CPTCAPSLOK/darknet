load("//bazel:repositories.bzl", "get_dependencies", "build_cmake_targets")
get_dependencies()
load("@com_github_google_rules_install//:deps.bzl", "install_rules_dependencies")
install_rules_dependencies()
load("@com_github_google_rules_install//:setup.bzl", "install_rules_setup")
install_rules_setup()
load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")
rules_foreign_cc_dependencies()
all_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""
build_cmake_targets(all_content)
