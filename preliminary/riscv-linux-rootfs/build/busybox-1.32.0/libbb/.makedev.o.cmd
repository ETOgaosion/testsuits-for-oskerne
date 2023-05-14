cmd_libbb/makedev.o := riscv64-unknown-linux-gnu-gcc -Wp,-MD,libbb/.makedev.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBB_VER='"1.32.0"'  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -finline-limit=0 -fno-builtin-strlen -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os     -DKBUILD_BASENAME='"makedev"'  -DKBUILD_MODNAME='"makedev"' -c -o libbb/makedev.o libbb/makedev.c

deps_libbb/makedev.o := \
  libbb/makedev.c \
  /opt/riscv/sysroot/usr/include/stdc-predef.h \
  include/platform.h \
    $(wildcard include/config/werror.h) \
    $(wildcard include/config/big/endian.h) \
    $(wildcard include/config/little/endian.h) \
    $(wildcard include/config/nommu.h) \
  /opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/12.2.0/include-fixed/limits.h \
  /opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/12.2.0/include-fixed/syslimits.h \
  /opt/riscv/sysroot/usr/include/limits.h \
  /opt/riscv/sysroot/usr/include/bits/libc-header-start.h \
  /opt/riscv/sysroot/usr/include/features.h \
  /opt/riscv/sysroot/usr/include/features-time64.h \
  /opt/riscv/sysroot/usr/include/bits/wordsize.h \
  /opt/riscv/sysroot/usr/include/bits/timesize.h \
  /opt/riscv/sysroot/usr/include/sys/cdefs.h \
  /opt/riscv/sysroot/usr/include/bits/long-double.h \
  /opt/riscv/sysroot/usr/include/gnu/stubs.h \
  /opt/riscv/sysroot/usr/include/gnu/stubs-lp64d.h \
  /opt/riscv/sysroot/usr/include/bits/posix1_lim.h \
  /opt/riscv/sysroot/usr/include/bits/local_lim.h \
  /opt/riscv/sysroot/usr/include/linux/limits.h \
  /opt/riscv/sysroot/usr/include/bits/pthread_stack_min-dynamic.h \
  /opt/riscv/sysroot/usr/include/bits/posix2_lim.h \
  /opt/riscv/sysroot/usr/include/bits/xopen_lim.h \
  /opt/riscv/sysroot/usr/include/bits/uio_lim.h \
  /opt/riscv/sysroot/usr/include/byteswap.h \
  /opt/riscv/sysroot/usr/include/bits/byteswap.h \
  /opt/riscv/sysroot/usr/include/bits/types.h \
  /opt/riscv/sysroot/usr/include/bits/typesizes.h \
  /opt/riscv/sysroot/usr/include/bits/time64.h \
  /opt/riscv/sysroot/usr/include/endian.h \
  /opt/riscv/sysroot/usr/include/bits/endian.h \
  /opt/riscv/sysroot/usr/include/bits/endianness.h \
  /opt/riscv/sysroot/usr/include/bits/uintn-identity.h \
  /opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/12.2.0/include/stdint.h \
  /opt/riscv/sysroot/usr/include/stdint.h \
  /opt/riscv/sysroot/usr/include/bits/wchar.h \
  /opt/riscv/sysroot/usr/include/bits/stdint-intn.h \
  /opt/riscv/sysroot/usr/include/bits/stdint-uintn.h \
  /opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/12.2.0/include/stdbool.h \
  /opt/riscv/sysroot/usr/include/unistd.h \
  /opt/riscv/sysroot/usr/include/bits/posix_opt.h \
  /opt/riscv/sysroot/usr/include/bits/environments.h \
  /opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/12.2.0/include/stddef.h \
  /opt/riscv/sysroot/usr/include/bits/confname.h \
  /opt/riscv/sysroot/usr/include/bits/getopt_posix.h \
  /opt/riscv/sysroot/usr/include/bits/getopt_core.h \
  /opt/riscv/sysroot/usr/include/bits/unistd_ext.h \
  /opt/riscv/sysroot/usr/include/linux/close_range.h \
  /opt/riscv/sysroot/usr/include/sys/sysmacros.h \
  /opt/riscv/sysroot/usr/include/bits/sysmacros.h \

libbb/makedev.o: $(deps_libbb/makedev.o)

$(deps_libbb/makedev.o):
