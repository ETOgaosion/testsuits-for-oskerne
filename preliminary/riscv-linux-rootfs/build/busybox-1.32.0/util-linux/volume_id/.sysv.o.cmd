cmd_util-linux/volume_id/sysv.o := riscv64-unknown-linux-gnu-gcc -Wp,-MD,util-linux/volume_id/.sysv.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBB_VER='"1.32.0"'  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -finline-limit=0 -fno-builtin-strlen -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os     -DKBUILD_BASENAME='"sysv"'  -DKBUILD_MODNAME='"sysv"' -c -o util-linux/volume_id/sysv.o util-linux/volume_id/sysv.c

deps_util-linux/volume_id/sysv.o := \
  util-linux/volume_id/sysv.c \
    $(wildcard include/config/feature/volumeid/sysv.h) \
    $(wildcard include/config/feature/blkid/type.h) \
  /opt/riscv/sysroot/usr/include/stdc-predef.h \
  util-linux/volume_id/volume_id_internal.h \
  include/libbb.h \
    $(wildcard include/config/feature/shadowpasswds.h) \
    $(wildcard include/config/use/bb/shadow.h) \
    $(wildcard include/config/selinux.h) \
    $(wildcard include/config/feature/utmp.h) \
    $(wildcard include/config/locale/support.h) \
    $(wildcard include/config/use/bb/pwd/grp.h) \
    $(wildcard include/config/lfs.h) \
    $(wildcard include/config/feature/buffers/go/on/stack.h) \
    $(wildcard include/config/feature/buffers/go/in/bss.h) \
    $(wildcard include/config/feature/verbose.h) \
    $(wildcard include/config/feature/etc/services.h) \
    $(wildcard include/config/feature/ipv6.h) \
    $(wildcard include/config/feature/seamless/xz.h) \
    $(wildcard include/config/feature/seamless/lzma.h) \
    $(wildcard include/config/feature/seamless/bz2.h) \
    $(wildcard include/config/feature/seamless/gz.h) \
    $(wildcard include/config/feature/seamless/z.h) \
    $(wildcard include/config/float/duration.h) \
    $(wildcard include/config/feature/check/names.h) \
    $(wildcard include/config/feature/prefer/applets.h) \
    $(wildcard include/config/long/opts.h) \
    $(wildcard include/config/feature/pidfile.h) \
    $(wildcard include/config/feature/syslog.h) \
    $(wildcard include/config/feature/syslog/info.h) \
    $(wildcard include/config/warn/simple/msg.h) \
    $(wildcard include/config/feature/individual.h) \
    $(wildcard include/config/ash.h) \
    $(wildcard include/config/sh/is/ash.h) \
    $(wildcard include/config/bash/is/ash.h) \
    $(wildcard include/config/hush.h) \
    $(wildcard include/config/sh/is/hush.h) \
    $(wildcard include/config/bash/is/hush.h) \
    $(wildcard include/config/echo.h) \
    $(wildcard include/config/printf.h) \
    $(wildcard include/config/test.h) \
    $(wildcard include/config/test1.h) \
    $(wildcard include/config/test2.h) \
    $(wildcard include/config/kill.h) \
    $(wildcard include/config/killall.h) \
    $(wildcard include/config/killall5.h) \
    $(wildcard include/config/chown.h) \
    $(wildcard include/config/ls.h) \
    $(wildcard include/config/xxx.h) \
    $(wildcard include/config/route.h) \
    $(wildcard include/config/feature/hwib.h) \
    $(wildcard include/config/desktop.h) \
    $(wildcard include/config/feature/crond/d.h) \
    $(wildcard include/config/feature/setpriv/capabilities.h) \
    $(wildcard include/config/run/init.h) \
    $(wildcard include/config/feature/securetty.h) \
    $(wildcard include/config/pam.h) \
    $(wildcard include/config/use/bb/crypt.h) \
    $(wildcard include/config/feature/adduser/to/group.h) \
    $(wildcard include/config/feature/del/user/from/group.h) \
    $(wildcard include/config/ioctl/hex2str/error.h) \
    $(wildcard include/config/feature/editing.h) \
    $(wildcard include/config/feature/editing/history.h) \
    $(wildcard include/config/feature/tab/completion.h) \
    $(wildcard include/config/feature/editing/savehistory.h) \
    $(wildcard include/config/feature/username/completion.h) \
    $(wildcard include/config/feature/editing/vi.h) \
    $(wildcard include/config/feature/editing/save/on/exit.h) \
    $(wildcard include/config/pmap.h) \
    $(wildcard include/config/feature/show/threads.h) \
    $(wildcard include/config/feature/ps/additional/columns.h) \
    $(wildcard include/config/feature/topmem.h) \
    $(wildcard include/config/feature/top/smp/process.h) \
    $(wildcard include/config/pgrep.h) \
    $(wildcard include/config/pkill.h) \
    $(wildcard include/config/pidof.h) \
    $(wildcard include/config/sestatus.h) \
    $(wildcard include/config/unicode/support.h) \
    $(wildcard include/config/feature/mtab/support.h) \
    $(wildcard include/config/feature/clean/up.h) \
    $(wildcard include/config/feature/devfs.h) \
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
  /opt/riscv/sysroot/usr/include/ctype.h \
  /opt/riscv/sysroot/usr/include/bits/types/locale_t.h \
  /opt/riscv/sysroot/usr/include/bits/types/__locale_t.h \
  /opt/riscv/sysroot/usr/include/dirent.h \
  /opt/riscv/sysroot/usr/include/bits/dirent.h \
  /opt/riscv/sysroot/usr/include/bits/dirent_ext.h \
  /opt/riscv/sysroot/usr/include/errno.h \
  /opt/riscv/sysroot/usr/include/bits/errno.h \
  /opt/riscv/sysroot/usr/include/linux/errno.h \
  /opt/riscv/sysroot/usr/include/asm/errno.h \
  /opt/riscv/sysroot/usr/include/asm-generic/errno.h \
  /opt/riscv/sysroot/usr/include/asm-generic/errno-base.h \
  /opt/riscv/sysroot/usr/include/bits/types/error_t.h \
  /opt/riscv/sysroot/usr/include/fcntl.h \
  /opt/riscv/sysroot/usr/include/bits/fcntl.h \
  /opt/riscv/sysroot/usr/include/bits/fcntl-linux.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct_iovec.h \
  /opt/riscv/sysroot/usr/include/linux/falloc.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct_timespec.h \
  /opt/riscv/sysroot/usr/include/bits/types/time_t.h \
  /opt/riscv/sysroot/usr/include/bits/stat.h \
  /opt/riscv/sysroot/usr/include/bits/struct_stat.h \
  /opt/riscv/sysroot/usr/include/inttypes.h \
  /opt/riscv/sysroot/usr/include/netdb.h \
  /opt/riscv/sysroot/usr/include/netinet/in.h \
  /opt/riscv/sysroot/usr/include/sys/socket.h \
  /opt/riscv/sysroot/usr/include/bits/socket.h \
  /opt/riscv/sysroot/usr/include/sys/types.h \
  /opt/riscv/sysroot/usr/include/bits/types/clock_t.h \
  /opt/riscv/sysroot/usr/include/bits/types/clockid_t.h \
  /opt/riscv/sysroot/usr/include/bits/types/timer_t.h \
  /opt/riscv/sysroot/usr/include/sys/select.h \
  /opt/riscv/sysroot/usr/include/bits/select.h \
  /opt/riscv/sysroot/usr/include/bits/types/sigset_t.h \
  /opt/riscv/sysroot/usr/include/bits/types/__sigset_t.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct_timeval.h \
  /opt/riscv/sysroot/usr/include/bits/pthreadtypes.h \
  /opt/riscv/sysroot/usr/include/bits/thread-shared-types.h \
  /opt/riscv/sysroot/usr/include/bits/pthreadtypes-arch.h \
  /opt/riscv/sysroot/usr/include/bits/atomic_wide_counter.h \
  /opt/riscv/sysroot/usr/include/bits/struct_mutex.h \
  /opt/riscv/sysroot/usr/include/bits/struct_rwlock.h \
  /opt/riscv/sysroot/usr/include/bits/socket_type.h \
  /opt/riscv/sysroot/usr/include/bits/sockaddr.h \
  /opt/riscv/sysroot/usr/include/asm/socket.h \
  /opt/riscv/sysroot/usr/include/asm-generic/socket.h \
  /opt/riscv/sysroot/usr/include/linux/posix_types.h \
  /opt/riscv/sysroot/usr/include/linux/stddef.h \
  /opt/riscv/sysroot/usr/include/asm/posix_types.h \
  /opt/riscv/sysroot/usr/include/asm-generic/posix_types.h \
  /opt/riscv/sysroot/usr/include/asm/bitsperlong.h \
  /opt/riscv/sysroot/usr/include/asm-generic/bitsperlong.h \
    $(wildcard include/config/64bit.h) \
  /opt/riscv/sysroot/usr/include/asm/sockios.h \
  /opt/riscv/sysroot/usr/include/asm-generic/sockios.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct_osockaddr.h \
  /opt/riscv/sysroot/usr/include/bits/in.h \
  /opt/riscv/sysroot/usr/include/rpc/netdb.h \
  /opt/riscv/sysroot/usr/include/bits/types/sigevent_t.h \
  /opt/riscv/sysroot/usr/include/bits/types/__sigval_t.h \
  /opt/riscv/sysroot/usr/include/bits/netdb.h \
  /opt/riscv/sysroot/usr/include/setjmp.h \
  /opt/riscv/sysroot/usr/include/bits/setjmp.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct___jmp_buf_tag.h \
  /opt/riscv/sysroot/usr/include/signal.h \
  /opt/riscv/sysroot/usr/include/bits/signum-generic.h \
  /opt/riscv/sysroot/usr/include/bits/signum-arch.h \
  /opt/riscv/sysroot/usr/include/bits/types/sig_atomic_t.h \
  /opt/riscv/sysroot/usr/include/bits/types/siginfo_t.h \
  /opt/riscv/sysroot/usr/include/bits/siginfo-arch.h \
  /opt/riscv/sysroot/usr/include/bits/siginfo-consts.h \
  /opt/riscv/sysroot/usr/include/bits/siginfo-consts-arch.h \
  /opt/riscv/sysroot/usr/include/bits/types/sigval_t.h \
  /opt/riscv/sysroot/usr/include/bits/sigevent-consts.h \
  /opt/riscv/sysroot/usr/include/bits/sigaction.h \
  /opt/riscv/sysroot/usr/include/bits/sigcontext.h \
  /opt/riscv/sysroot/usr/include/bits/types/stack_t.h \
  /opt/riscv/sysroot/usr/include/sys/ucontext.h \
  /opt/riscv/sysroot/usr/include/bits/sigstack.h \
  /opt/riscv/sysroot/usr/include/bits/sigstksz.h \
  /opt/riscv/sysroot/usr/include/bits/ss_flags.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct_sigstack.h \
  /opt/riscv/sysroot/usr/include/bits/sigthread.h \
  /opt/riscv/sysroot/usr/include/bits/signal_ext.h \
  /opt/riscv/sysroot/usr/include/paths.h \
  /opt/riscv/sysroot/usr/include/stdio.h \
  /opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/12.2.0/include/stdarg.h \
  /opt/riscv/sysroot/usr/include/bits/types/__fpos_t.h \
  /opt/riscv/sysroot/usr/include/bits/types/__mbstate_t.h \
  /opt/riscv/sysroot/usr/include/bits/types/__fpos64_t.h \
  /opt/riscv/sysroot/usr/include/bits/types/__FILE.h \
  /opt/riscv/sysroot/usr/include/bits/types/FILE.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct_FILE.h \
  /opt/riscv/sysroot/usr/include/bits/types/cookie_io_functions_t.h \
  /opt/riscv/sysroot/usr/include/bits/stdio_lim.h \
  /opt/riscv/sysroot/usr/include/bits/floatn.h \
  /opt/riscv/sysroot/usr/include/bits/floatn-common.h \
  /opt/riscv/sysroot/usr/include/stdlib.h \
  /opt/riscv/sysroot/usr/include/bits/waitflags.h \
  /opt/riscv/sysroot/usr/include/bits/waitstatus.h \
  /opt/riscv/sysroot/usr/include/alloca.h \
  /opt/riscv/sysroot/usr/include/bits/stdlib-float.h \
  /opt/riscv/sysroot/usr/include/string.h \
  /opt/riscv/sysroot/usr/include/strings.h \
  /opt/riscv/sysroot/usr/include/libgen.h \
  /opt/riscv/sysroot/usr/include/poll.h \
  /opt/riscv/sysroot/usr/include/sys/poll.h \
  /opt/riscv/sysroot/usr/include/bits/poll.h \
  /opt/riscv/sysroot/usr/include/sys/ioctl.h \
  /opt/riscv/sysroot/usr/include/bits/ioctls.h \
  /opt/riscv/sysroot/usr/include/asm/ioctls.h \
  /opt/riscv/sysroot/usr/include/asm-generic/ioctls.h \
  /opt/riscv/sysroot/usr/include/linux/ioctl.h \
  /opt/riscv/sysroot/usr/include/asm/ioctl.h \
  /opt/riscv/sysroot/usr/include/asm-generic/ioctl.h \
  /opt/riscv/sysroot/usr/include/bits/ioctl-types.h \
  /opt/riscv/sysroot/usr/include/sys/ttydefaults.h \
  /opt/riscv/sysroot/usr/include/sys/mman.h \
  /opt/riscv/sysroot/usr/include/bits/mman.h \
  /opt/riscv/sysroot/usr/include/bits/mman-map-flags-generic.h \
  /opt/riscv/sysroot/usr/include/bits/mman-linux.h \
  /opt/riscv/sysroot/usr/include/bits/mman-shared.h \
  /opt/riscv/sysroot/usr/include/bits/mman_ext.h \
  /opt/riscv/sysroot/usr/include/sys/resource.h \
  /opt/riscv/sysroot/usr/include/bits/resource.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct_rusage.h \
  /opt/riscv/sysroot/usr/include/sys/stat.h \
  /opt/riscv/sysroot/usr/include/bits/statx.h \
  /opt/riscv/sysroot/usr/include/linux/stat.h \
  /opt/riscv/sysroot/usr/include/linux/types.h \
  /opt/riscv/sysroot/usr/include/asm/types.h \
  /opt/riscv/sysroot/usr/include/asm-generic/types.h \
  /opt/riscv/sysroot/usr/include/asm-generic/int-ll64.h \
  /opt/riscv/sysroot/usr/include/bits/statx-generic.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct_statx_timestamp.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct_statx.h \
  /opt/riscv/sysroot/usr/include/sys/time.h \
  /opt/riscv/sysroot/usr/include/sys/sysmacros.h \
  /opt/riscv/sysroot/usr/include/bits/sysmacros.h \
  /opt/riscv/sysroot/usr/include/sys/wait.h \
  /opt/riscv/sysroot/usr/include/bits/types/idtype_t.h \
  /opt/riscv/sysroot/usr/include/termios.h \
  /opt/riscv/sysroot/usr/include/bits/termios.h \
  /opt/riscv/sysroot/usr/include/bits/termios-struct.h \
  /opt/riscv/sysroot/usr/include/bits/termios-c_cc.h \
  /opt/riscv/sysroot/usr/include/bits/termios-c_iflag.h \
  /opt/riscv/sysroot/usr/include/bits/termios-c_oflag.h \
  /opt/riscv/sysroot/usr/include/bits/termios-baud.h \
  /opt/riscv/sysroot/usr/include/bits/termios-c_cflag.h \
  /opt/riscv/sysroot/usr/include/bits/termios-c_lflag.h \
  /opt/riscv/sysroot/usr/include/bits/termios-tcflow.h \
  /opt/riscv/sysroot/usr/include/bits/termios-misc.h \
  /opt/riscv/sysroot/usr/include/time.h \
  /opt/riscv/sysroot/usr/include/bits/time.h \
  /opt/riscv/sysroot/usr/include/bits/timex.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct_tm.h \
  /opt/riscv/sysroot/usr/include/bits/types/struct_itimerspec.h \
  /opt/riscv/sysroot/usr/include/sys/param.h \
  /opt/riscv/sysroot/usr/include/bits/param.h \
  /opt/riscv/sysroot/usr/include/linux/param.h \
  /opt/riscv/sysroot/usr/include/asm/param.h \
  /opt/riscv/sysroot/usr/include/asm-generic/param.h \
  /opt/riscv/sysroot/usr/include/pwd.h \
  /opt/riscv/sysroot/usr/include/grp.h \
  /opt/riscv/sysroot/usr/include/mntent.h \
  /opt/riscv/sysroot/usr/include/sys/statfs.h \
  /opt/riscv/sysroot/usr/include/bits/statfs.h \
  /opt/riscv/sysroot/usr/include/utmp.h \
  /opt/riscv/sysroot/usr/include/bits/utmp.h \
  /opt/riscv/sysroot/usr/include/utmpx.h \
  /opt/riscv/sysroot/usr/include/bits/utmpx.h \
  /opt/riscv/sysroot/usr/include/arpa/inet.h \
  include/pwd_.h \
  include/grp_.h \
  include/shadow_.h \
  include/xatonum.h \
  include/volume_id.h \

util-linux/volume_id/sysv.o: $(deps_util-linux/volume_id/sysv.o)

$(deps_util-linux/volume_id/sysv.o):
