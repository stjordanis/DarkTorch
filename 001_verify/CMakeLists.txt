cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(001_verify VERSION 1.2.3.4 LANGUAGES CXX)
set(PROJECT_NAME 001_verify)
set(CMAKE_BUILD_TYPE Release)

if (NOT DEFINED CMAKE_CXX_STANDARD)
    SET(CMAKE_CXX_STANDARD 11)
    SET(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_VERBOSE_MAKEFILE ON)
endif ()
if (CMAKE_CXX_STANDARD LESS 11)
    message(FATAL_ERROR "CMAKE_CXX_STANDARD is less than 11.")
endif ()


set(CXX_RELEASE_FLAGS = -O3 -march=native)

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    message(STATUS "*** Have SIZEOF void * = 8, so 64-bit")
    set(IS_64_BIT 1)
else ()
    message(STATUS "*** SIZEOF void * != 8, so not 64-bit")
endif ()

find_package(CUDA REQUIRED)
if (CUDA_FOUND)
    # There is some bug in CMake (FindCUDA.cmake) that causes it to mess up the -std=c++11 option
    # if you let it propagate it to nvcc in some cases.
    if (NOT MSVC)
        set(CUDA_PROPAGATE_HOST_FLAGS OFF)
        list(APPEND CUDA_NVCC_FLAGS -std=c++11)
    endif ()
endif ()


FIND_PACKAGE(OpenCV REQUIRED)
IF (OpenCV_FOUND)
    message([message] OpenCV_VER:${OpenCV_VERSION})
    include_directories(${OpenCV_INCLUDE_DIRS})
    link_directories(${OpenCV_LIBRARY_DIRS})
    add_definitions(${OpenCV_DEFINITIONS})
    #    target_link_libraries(test_project ${OpenCV_LIBS})
ENDIF ()

set(Torch_DIR /root/libtorch/share/cmake/Torch/)

FIND_PACKAGE(Torch REQUIRED)

message(STATUS "Pytorch status:")
message(STATUS "    libraries: ${TORCH_LIBRARIES}")

message(STATUS "OpenCV library status:")
message(STATUS "    version: ${OpenCV_VERSION}")
message(STATUS "    libraries: ${OpenCV_LIBS}")
message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")


SET(PROJ_NAME ${PROJECT_NAME})
SET(PROJ_SOURCES_DIR src)
SET(PROJ_SOURCES ${PROJ_SOURCES_DIR}/001_verify.cpp)

SET(PROJ_INCLUDES ../include ../include/termcolor)
SET( PROJ_HEADERS ${PROJ_INCLUDES} ${PROJ_INCLUDES}/termcolor.hpp)

SET(PROJ_INCLUDES ../include ../include/tqdm)
SET( PROJ_HEADERS ${PROJ_INCLUDES} ${PROJ_INCLUDES}/tqdm.h)


set(PROJECT_INCLUDE_DIR ${PROJ_INCLUDES})
SET(PROJECT_SOURCE_DIR ${PROJ_SOURCES})
add_executable(${PROJ_NAME} ${PROJ_SOURCES} ${PROJ_HEADERS} ${PROJECT_INCLUDE_DIR})
target_link_libraries(${PROJ_NAME} ${OpenCV_LIBRARIES})
target_link_libraries(${PROJ_NAME} ${TORCH_LIBRARIES})

# .exe and .dll
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)



## Copy DLL files to output directory
#add_custom_command(TARGET ${PROJ_NAME} POST_BUILD
#        COMMAND ${CMAKE_COMMAND} -E copy_if_different
#        "f:/exec_dll/torch.dll"
#        C"${CMAKE_BINARY_DIR}/")
#
#ADD_CUSTOM_COMMAND( TARGET ${PROJ_NAME} POST_BUILD
#        COMMAND copy "${DLL_3RD}/*.dll"
#        "${CMAKE_BINARY_DIR}/"
#        )

message(STATUS "----------------- INSTALL LOCATIONS -----------------")
message(STATUS "CMAKE_INSTALL_PREFIX          = ${CMAKE_INSTALL_PREFIX}")
message(STATUS "CMAKE_BINARY_DIR              = ${CMAKE_BINARY_DIR}")
message(STATUS "CMAKE_INSTALL_LIBDIR          = ${CMAKE_INSTALL_LIBDIR}")
message(STATUS "INSTALL_CMAKE_DIR             = ${INSTALL_CMAKE_DIR}")
message(STATUS "CMAKE_INSTALL_INCLUDEDIR      = ${CMAKE_INSTALL_INCLUDEDIR}")
message(STATUS "-----------------------------------------------------")
