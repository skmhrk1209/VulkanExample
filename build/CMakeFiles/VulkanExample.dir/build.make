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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.16.5/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.16.5/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/sakuma/Documents/Vulkan/VulkanExample

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/sakuma/Documents/Vulkan/VulkanExample/build

# Include any dependencies generated for this target.
include CMakeFiles/VulkanExample.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/VulkanExample.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/VulkanExample.dir/flags.make

CMakeFiles/VulkanExample.dir/src/main.cpp.o: CMakeFiles/VulkanExample.dir/flags.make
CMakeFiles/VulkanExample.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/sakuma/Documents/Vulkan/VulkanExample/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/VulkanExample.dir/src/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/VulkanExample.dir/src/main.cpp.o -c /Users/sakuma/Documents/Vulkan/VulkanExample/src/main.cpp

CMakeFiles/VulkanExample.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/VulkanExample.dir/src/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sakuma/Documents/Vulkan/VulkanExample/src/main.cpp > CMakeFiles/VulkanExample.dir/src/main.cpp.i

CMakeFiles/VulkanExample.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/VulkanExample.dir/src/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sakuma/Documents/Vulkan/VulkanExample/src/main.cpp -o CMakeFiles/VulkanExample.dir/src/main.cpp.s

# Object files for target VulkanExample
VulkanExample_OBJECTS = \
"CMakeFiles/VulkanExample.dir/src/main.cpp.o"

# External object files for target VulkanExample
VulkanExample_EXTERNAL_OBJECTS =

VulkanExample: CMakeFiles/VulkanExample.dir/src/main.cpp.o
VulkanExample: CMakeFiles/VulkanExample.dir/build.make
VulkanExample: /usr/local/lib/libvulkan.dylib
VulkanExample: /usr/local/lib/libglfw.3.3.dylib
VulkanExample: CMakeFiles/VulkanExample.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/sakuma/Documents/Vulkan/VulkanExample/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable VulkanExample"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/VulkanExample.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/VulkanExample.dir/build: VulkanExample

.PHONY : CMakeFiles/VulkanExample.dir/build

CMakeFiles/VulkanExample.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/VulkanExample.dir/cmake_clean.cmake
.PHONY : CMakeFiles/VulkanExample.dir/clean

CMakeFiles/VulkanExample.dir/depend:
	cd /Users/sakuma/Documents/Vulkan/VulkanExample/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sakuma/Documents/Vulkan/VulkanExample /Users/sakuma/Documents/Vulkan/VulkanExample /Users/sakuma/Documents/Vulkan/VulkanExample/build /Users/sakuma/Documents/Vulkan/VulkanExample/build /Users/sakuma/Documents/Vulkan/VulkanExample/build/CMakeFiles/VulkanExample.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/VulkanExample.dir/depend
