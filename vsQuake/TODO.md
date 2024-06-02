# TODO

Some things to have a look at.

## Unity Build

Take a page out of Casey's book, and refactor this to compile a single translation unit.

It would be interesting to see how fast it can build.

## Resolve build warnings

There's still a few build warnings in the output. It'd be nice to get rid of them.

## Revisit Modifications

In the `MODIFICATIONS.md` file, I've noted all the tweaks I did to make the game build.

Many of these modifications have just been copying the approach from other projects, without really knowing why, or if this is even a good solution to the problem.

It may be worth to revisit this once I have a better understanding of the code and see if I can come up with better solutions

## Make it run on x64

The project only builds on x86 at the moment. It would be cool to make it build and run on x64.

## Figure out what all these god damn files are for...

There's a lot of crap here to be honest.

One thing is all the C code and header files, which I'll be reading through and try to understand.

Another is the `.s` files (assembly?) and whatnot.

It'd be cool to understand what all this stuff is.
