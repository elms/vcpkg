vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO elms/wolftpm
    REF vcpkg
    SHA512  2d22f2d0d533661deba9c1e02d2df6fd7d99045e985c38f74c5a430cbdd0dab761e79cd135159f6adebe05b361eb0cebfbac3c15af36f0754e2e2966daa92f8b
    HEAD_REF master
    )

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DWOLFTPM_EXAMPLES=no)

vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/wolftpm" RENAME copyright)

#vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/wolftpm)


file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
