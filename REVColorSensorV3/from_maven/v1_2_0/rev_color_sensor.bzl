"""
Auto-generated rules for rev_color_sensor
"""

load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_java_vendor_library", "wpilib_native_dependency")
load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def third_party_rev_color_sensor():
    __third_party_rev_color_sensor_native()
    return __third_party_rev_color_sensor_java()

def __third_party_rev_color_sensor_java():
    repository_url = "https://www.revrobotics.com/content/sw/color-sensor-v3/sdk/maven"

    deps = []
    deps.append(("rev_color_sensor-ColorSensorV3-java", "com.revrobotics.frc:ColorSensorV3-java:1.2.0", "dbd618cf9261ab87fabb6842e4abf9cd70cef7ca665213c742e75712ca94e5ca"))

    for name, artifact, sha in deps:
        jvm_maven_import_external(
            name = name,
            artifact = artifact,
            artifact_sha256 = sha,
            server_urls = [repository_url],
        )

    artifacts = []

    return artifacts, []

def __third_party_rev_color_sensor_native():
    wpilib_native_dependency(
        "ColorSensorV3-cpp",
        "1.2.0",
        "https://www.revrobotics.com/content/sw/color-sensor-v3/sdk/maven/com/revrobotics/frc",
        "bfa7bbfcb32017ed4e4c9b3138eea559f715b7c1fdf8666ed93938cd85787f70",
        [
            ("windowsx86-64", "432587b2ceda321a23ffb8949b7d1ea1807fa525d0965797ec2ad9cfb410f491"),
            ("linuxx86-64", "fcbcde37d8f27e579d3274ca1a28a7c93841855885f8a22026f5438c685a1d6c"),
            ("linuxathena", "a5a2fa49786450c0a1049bb8485d12f9355242049db8fefc9e38423e91dec33c"),
        ],
        static_only = True,
        prefix = "rev_color_sensor-",
    )

    wpilib_java_vendor_library(
        vendor_name = "rev_color_sensor-java-native",
        url = "https://www.revrobotics.com/content/sw/color-sensor-v3/sdk/maven",
        version = "1.2.0",
        java_deps = [],
        jni_deps = [
        ],
    )
