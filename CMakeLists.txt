cmake_minimum_required(VERSION 3.7)
project(vulkan VERSION 0.1.0)

set(CMAKE_CXX_FLAGS "-std=c++17 -Wall")
set(CMAKE_CXX_FLAGS_DEBUG "-g3 -O0 -pg")
set(CMAKE_CXX_FLAGS_RELEASE "-O2 -s -DNDEBUG -march=native")

find_package(Vulkan REQUIRED)
include_directories(${Vulkan_INCLUDE_DIRS})

find_package(glfw3 3.3 REQUIRED)

add_executable(VulkanExample src/main.cpp)
target_link_libraries(VulkanExample ${Vulkan_LIBRARIES} glfw)
