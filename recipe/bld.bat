mkdir build
cd build

set "CXXFLAGS="

cmake ^
    -G "%CMAKE_GENERATOR%" ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DBUILD_BENCHMARKS=no ^
    -DINTEGER_CLASS=gmp ^
    -DWITH_MPC=yes ^
    -DWITH_LLVM=yes ^
    -DWITH_SYMENGINE_THREAD_SAFE=yes ^
    -DBUILD_FOR_DISTRIBUTION=yes ^
    -DBUILD_SHARED_LIBS=yes ^
    -DMSVC_USE_MT=no ^
    ..

cmake --build . --config Release
cmake --build . --config Release --target install

ctest
