vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO wolfssl/wolfssl
    REF v5.2.0-stable
    SHA512 ace828242dfb560068d3ad79d4f3b9548c57705384c1fa2dc3bd71bdc9dd2c5e39895d0525fae36e63469fad152ebcb3408f12d0b7d5265d871ac816cc813e3c
    HEAD_REF master
    )

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH} OPTIONS -DWOLFSSL_EXAMPLES=no -DWOLFSSL_CRYPT_TESTS=no -DWOLFSSL_OPENSSLEXTRA=yes -DWOLFSSL_TPM=yes -DWOLFSSL_TLSX=yes -DCMAKE_C_FLAGS_INIT="-DWOLFSSL_ALT_CERT_CHAINS")

vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/COPYING" DESTINATION "${CURRENT_PACKAGES_DIR}/share/wolfssl" RENAME copyright)

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/wolfssl)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")


if(EXISTS ${CURRENT_PACKAGES_DIR}/lib/wolfssl.dll)
    file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/bin)
    file(RENAME ${CURRENT_PACKAGES_DIR}/lib/wolfssl.dll ${CURRENT_PACKAGES_DIR}/bin/wolfssl.dll)
endif()
if(EXISTS ${CURRENT_PACKAGES_DIR}/debug/lib/wolfssl.dll)
    file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/debug/bin)
    file(RENAME ${CURRENT_PACKAGES_DIR}/debug/lib/wolfssl.dll ${CURRENT_PACKAGES_DIR}/debug/bin/wolfssl.dll)
endif()