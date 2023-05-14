# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build

# Include any dependencies generated for this target.
include CMakeFiles/getcwd.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/getcwd.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/getcwd.dir/flags.make

CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.o: CMakeFiles/getcwd.dir/flags.make
CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.o: ../src/oscomp/getcwd.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.o"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.o   -c /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/src/oscomp/getcwd.c

CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.i"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/src/oscomp/getcwd.c > CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.i

CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.s"
	riscv64-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/src/oscomp/getcwd.c -o CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.s

# Object files for target getcwd
getcwd_OBJECTS = \
"CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.o"

# External object files for target getcwd
getcwd_EXTERNAL_OBJECTS =

riscv64/getcwd: CMakeFiles/getcwd.dir/src/oscomp/getcwd.c.o
riscv64/getcwd: CMakeFiles/getcwd.dir/build.make
riscv64/getcwd: libulib.a
riscv64/getcwd: CMakeFiles/getcwd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable riscv64/getcwd"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/getcwd.dir/link.txt --verbose=$(VERBOSE)
	mkdir -p asm
	riscv64-unknown-elf-objdump -d -S /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/getcwd > asm/getcwd.asm
	mkdir -p bin
	riscv64-unknown-elf-objcopy -O binary /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/getcwd bin/getcwd.bin --set-section-flags .bss=alloc,load,contents

# Rule to build all files generated by this target.
CMakeFiles/getcwd.dir/build: riscv64/getcwd

.PHONY : CMakeFiles/getcwd.dir/build

CMakeFiles/getcwd.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/getcwd.dir/cmake_clean.cmake
.PHONY : CMakeFiles/getcwd.dir/clean

CMakeFiles/getcwd.dir/depend:
	cd /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build /home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/CMakeFiles/getcwd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/getcwd.dir/depend

