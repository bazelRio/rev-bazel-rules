"""
Loads the correct version of the REVColorSensorV3 repository
"""

def rev_color_sensor_version_conf_impl(repository_ctx):
    """
    Rule for loading the specified version of the REVColorSensorV3 libraries

    Args:
        repository_ctx:
    """

    version = repository_ctx.attr.version

    supported_versions = [
        "1.2.0",
    ]

    if version not in supported_versions:
        fail("Unsupported version " + version)

    flattened_version = "v" + version.replace(".", "_")

    build_file = Label("@rev_bazel_rules//REVColorSensorV3/from_maven/" + flattened_version + ":BUILD.bazel")
    repo_file = Label("@rev_bazel_rules//REVColorSensorV3/from_maven/" + flattened_version + ":rev_color_sensor.bzl")

    repository_ctx.symlink(repository_ctx.path(build_file), "BUILD.bazel")
    repository_ctx.symlink(repository_ctx.path(repo_file), "rev_color_sensor.bzl")

rev_color_sensor_version_conf = repository_rule(
    implementation = rev_color_sensor_version_conf_impl,
    configure = True,
    attrs = {
        "version": attr.string(mandatory = True),
    },
)

def load_rev_color_sensor_from_maven(version):
    rev_color_sensor_version_conf(name = "local_rev_color_sensor", version = version)
