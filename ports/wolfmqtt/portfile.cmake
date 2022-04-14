vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO elms/wolfmqtt
    REF vcpkg
    SHA512 06daa27f0c814982a73137a83885a9b5c0701f0b7be36219c3da8b6f7aa3ab9fb61bfb938ada685e6ef43b53fefce1e9653c86857153f340889b7e2be11d6a2e
    HEAD_REF master
    )

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DWOLFMQTT_EXAMPLES=no)

vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/wolfmqtt" RENAME copyright)

#vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/wolfmqtt)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
