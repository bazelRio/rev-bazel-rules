"""
Auto-generated rules for rev
"""

load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_java_vendor_library", "wpilib_native_dependency")

def third_party_rev():
    __third_party_rev_native()
    return __third_party_rev_java()

def __third_party_rev_java():
    artifacts = [
        "com.revrobotics.frc:SparkMax-java:1.5.4",
    ]

    repositories = ["https://www.revrobotics.com/content/sw/max/sdk/maven"]

    return artifacts, repositories

def __third_party_rev_native():
    wpilib_native_dependency(
        "SparkMax-cpp",
        "1.5.4",
        "https://www.revrobotics.com/content/sw/max/sdk/maven/com/revrobotics/frc",
        "e5c5c8c3e72b399101ee1056279d72540554ffb149d9351036f8d977b36e3c1f",
        [
            ("windowsx86-64", "5f7b16af472c7eb334351206a8398c920458b782cbd77c0e6f8c0395b18534d6"),
            ("linuxx86-64", "a0b95a982975a258f9ea0e44b02b2e6429e0d5fa3ebdaea0192bf52259ae5724"),
            ("linuxathena", "02442954014ad8439cb277351bbb373deb5a898391777baa66f63bdf0f4e000d"),
            ("osxx86-64", "f02fe4702f9d548ed35fb44f352e0767044ce17808f5f8bda79d3c4eaf75220e"),
        ],
        static_only = True,
        prefix = "rev-",
        header_patches = [
            "@local_rev//:patch__SparkMax-cpp__header__00_invalid_deprecated.patch",
        ],
    )

    wpilib_native_dependency(
        "SparkMax-driver",
        "1.5.4",
        "https://www.revrobotics.com/content/sw/max/sdk/maven/com/revrobotics/frc",
        "c3984a9c073125bedb1a299c1e8e831b43e728b83dbc10d8e0032cb74186fed2",
        [
            ("windowsx86-64", "9817941c76fcb421bc8c052a2c92e4056207c2ab565bc0545be73d6f53d496d8"),
            ("linuxx86-64", "f880873a0e02984165f10549f0b3f05072648f22f800604a8fc9b8118191fbe1"),
            ("linuxathena", "43c6bb9c5ec30cc854397200f03b9833cca760eaf526513bd44250b38597ebe3"),
            ("osxx86-64", "13c0e148bfccea862476c6c32aad878d021fb907d723fc7093e816dc0ecf5c05"),
        ],
        static_only = True,
        prefix = "rev-",
    )

    wpilib_java_vendor_library(
        vendor_name = "rev-java-native",
        url = "https://www.revrobotics.com/content/sw/max/sdk/maven",
        version = "1.5.4",
        java_deps = [],
        jni_deps = [
            ("com.revrobotics.frc", "SparkMax-driver", "windowsx86-64", "4ca674c6e4fcb72410a96ec69d654b96c251244268e70892858badaeb1c831ac"),
            ("com.revrobotics.frc", "SparkMax-driver", "linuxx86-64", "5d074a8e3ea590bbf84d8010ce2dbfb5f960418955cbbb0fc66cd653c07d0084"),
            ("com.revrobotics.frc", "SparkMax-driver", "linuxathena", "85f430e7f14635e4556d5e9147d9dda7f0180f6b487f8959c96a635424b8f11a"),
            ("com.revrobotics.frc", "SparkMax-driver", "osxx86-64", "6e9d0902d2a6a36f6e58df763144fbdb211af25fe9c348848a8e13015cbb5990"),
        ],
    )
