#! /bin/bash

#stl
#ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ cpp_src 

#code 
find . -name "*.h" -o -name "*.cpp" > cscope.files
cscope -bkq -i cscope.files
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q dir
