"""
Loads the correct version of the REVRobotics repository
"""

def rev_version_conf_impl(repository_ctx):
    """
    Rule for loading the specified version of the REVRobotics libraries

    Args:
        repository_ctx:
    """

    version = repository_ctx.attr.version

    supported_versions = [
        "1.5.4",
    ]

    if version not in supported_versions:
        fail("Unsupported version " + version)

    flattened_version = "v" + version.replace(".", "_")

    build_file = Label("@rev_bazel_rules//REVRobotics/from_maven/" + flattened_version + ":BUILD.bazel")
    repo_file = Label("@rev_bazel_rules//REVRobotics/from_maven/" + flattened_version + ":rev.bzl")

    if version == "1.5.4":
        repository_ctx.symlink(repository_ctx.path(Label("@rev_bazel_rules//REVRobotics/from_maven/v1_5_4:patch__SparkMax-cpp__header__00_invalid_deprecated.patch")), "patch__SparkMax-cpp__header__00_invalid_deprecated.patch")

    repository_ctx.symlink(repository_ctx.path(build_file), "BUILD.bazel")
    repository_ctx.symlink(repository_ctx.path(repo_file), "rev.bzl")

rev_version_conf = repository_rule(
    implementation = rev_version_conf_impl,
    configure = True,
    attrs = {
        "version": attr.string(mandatory = True),
    },
)

def load_rev_from_maven(version):
    rev_version_conf(name = "local_rev", version = version)
