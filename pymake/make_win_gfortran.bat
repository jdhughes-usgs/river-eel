rem set PATH=%PATH%;Z:\Users\langevin\langevin\temp\gcc-5-win64\bin
set PATH=%PATH%;Z:\Users\langevin\langevin\software\gfortran\mingw64\bin
gfortran --version
python makebin.py -fc gfortran -sd -mc ../src mf6.exe
pause
