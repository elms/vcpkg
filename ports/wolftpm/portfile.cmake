vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO elms/wolftpm
    REF vcpkg
    SHA512 3d04c2934c56da8317f7c2079cc1e11b5421fbc4e70b33cbb913d9a054af1a1b7ef287c828da7e89fed3fc2fbe889fccce8b7e85ce27cfca099806caf2ec29cc
    HEAD_REF master
    )

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DWOLFTPM_EXAMPLES=no)

vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/wolftpm" RENAME copyright)

#vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/wolftpm)


file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
