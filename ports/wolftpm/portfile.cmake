vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO elms/wolftpm
    REF vcpkg
    SHA512 dd00b5131102caedeed44901fe70c58bd0601c5f60e7c4725e6c59821f2679ce8e8ac5c937f2f087208c8dad7a5da447cece5e9d5806da63e7664b6381194b50
    HEAD_REF master
    )

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DWOLFTPM_EXAMPLES=no)

vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/wolftpm" RENAME copyright)

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/wolftpm)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
