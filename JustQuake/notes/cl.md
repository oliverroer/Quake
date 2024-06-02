
linking libs
cl main.c /link user32.lib

debugging /Z7
cl main.c /Z7 /link user32.lib

turning off optimizations
cl main.c /Z7 /Od /link user32.lib

/Z7 and /Od work well together

/O1 smaller exe, slower code
/O2 bigger exe, faster code

/Od = Debug build
/O2 = Release Build

