: Set working directory to location of this file
cd %dp0

: Set working directory to root of project
cd ..

: Create build_msvc2015 directory (and delete old one if it exists)
rmdir /S /Q build_msvc2015
mkdir build_msvc2015
cd build_msvc2015

: Generate Visual Studio solution
cmake .. -G "Visual Studio 14 2015 Win64"

: Run create_symlinks.bat script
call create_symlinks.bat

cd ..
