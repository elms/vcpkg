vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO elms/wolfmqtt
    REF vcpkg
    SHA512 7a904f85b22dce472f53991ec3441cd6640d2c7295dc736607f3c6ea5aacd7998572702760a2ffdb15492d2b05c97c857b9172f87e06b0c8c3249c21d3cf515b
    HEAD_REF master
    )

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DWOLFMQTT_EXAMPLES=no)

vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/wolfmqtt" RENAME copyright)

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/wolfmqtt)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
