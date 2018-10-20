: Set working directory to location of this file
cd %dp0

: Set working directory to root of project
cd ..

: Create build_msvc2015_cuda directory (and delete old one if it exists)
rmdir /S /Q build_msvc2015_cuda
mkdir build_msvc2015_cuda
cd build_msvc2015_cuda

: Generate Visual Studio solution
cmake .. -G "Visual Studio 14 2015 Win64" -DCUDA_TRACER=TRUE

: Run create_symlinks.bat script
call create_symlinks.bat

cd ..