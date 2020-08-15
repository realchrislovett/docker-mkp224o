# docker-mkp224o

### Docker container with mkp244o configured with --enable-intfilter enabled

--enable-intfilter[=(32|64|128|native)] use integers of specific size (in bits) [default=64] for filtering. faster but limits filter length to: 6 for 32-bit, 12 for 64-bit, 24 for 128-bit. by default, if this option is not enabled, binary strings are used, which are slower, but not limited in length.

### To use, run:

`docker run --rm clovett/mkp224o`
