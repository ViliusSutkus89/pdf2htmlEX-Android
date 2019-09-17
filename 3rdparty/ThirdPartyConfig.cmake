# File include from two places:
# Main CMakeLists.txt
# library builder 3rdparty/CMakeLists.txt

if (ANDROID)
  SET(THIRDPARTY_PREFIX ${CMAKE_CURRENT_LIST_DIR}/../build/3rdparty/${CMAKE_BUILD_TYPE}/${ANDROID_ABI})
else()
  SET(THIRDPARTY_PREFIX ${CMAKE_CURRENT_LIST_DIR}/../build/3rdparty/prefix)
  message(WARNING "Not really tested on NOT ANDROID... Comment this out and proceed with caution.")
endif()

SET(THIRDPARTY_PKG_CONFIG_LIBDIR ${THIRDPARTY_PREFIX}/lib/pkgconfig)
SET(THIRDPARTY_PKG_CONFIG_EXECUTABLE ${THIRDPARTY_PREFIX}/bin/pkg-config)
SET(PKG_CONFIG_EXECUTABLE ${THIRDPARTY_PKG_CONFIG_EXECUTABLE})

# LIST(PREPEND is unavailable in CMake 3.10)
LIST(REVERSE CMAKE_FIND_ROOT_PATH)
LIST(APPEND CMAKE_FIND_ROOT_PATH ${THIRDPARTY_PREFIX})
LIST(REVERSE CMAKE_FIND_ROOT_PATH)
