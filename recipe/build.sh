#!/usr/bin/env bash

set -e

export CUB_SRC_DIR="${SRC_DIR}/cub-${PKG_VERSION}"
export CUB_BUILD_DIR=${CUB_BUILD_DIR:=${CUB_SRC_DIR}/build}
export BUILD_TESTS=OFF
export BUILD_EXAMPLES=OFF
export BUILD_TYPE=Release
export VERBOSE_FLAG="-v"

mkdir -p ${CUB_BUILD_DIR}
cd ${CUB_SRC_DIR}

cmake -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
      -DCMAKE_INSTALL_LIBDIR="${PREFIX}/lib" \
      -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
      -DCUB_ENABLE_HEADER_TESTING=${BUILD_TESTS} \
      -DCUB_ENABLE_TESTING=${BUILD_TESTS} \
      -DCUB_ENABLE_EXAMPLES=${BUILD_EXAMPLES} \
      -B "${CUB_BUILD_DIR}" \
      -S .

cmake --build "${CUB_BUILD_DIR}" --target install ${VERBOSE_FLAGS}
