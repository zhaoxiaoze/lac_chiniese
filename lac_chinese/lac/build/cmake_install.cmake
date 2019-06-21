# Install script for directory: /home/zhaoze/PycharmProjects/lac

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/zhaoze/PycharmProjects/lac/output/lib/liblac.a")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/zhaoze/PycharmProjects/lac/output/lib" TYPE STATIC_LIBRARY FILES "/home/zhaoze/PycharmProjects/lac/build/liblac.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/zhaoze/PycharmProjects/lac/output/demo/lac_demo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/zhaoze/PycharmProjects/lac/output/demo/lac_demo")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/zhaoze/PycharmProjects/lac/output/demo/lac_demo"
         RPATH "/home/zhaoze/PycharmProjects/Paddle/fluid_install_dir/paddle/fluid/inference:/home/zhaoze/PycharmProjects/Paddle/fluid_install_dir/third_party/install/mklml/lib")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/zhaoze/PycharmProjects/lac/output/demo/lac_demo")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/zhaoze/PycharmProjects/lac/output/demo" TYPE EXECUTABLE FILES "/home/zhaoze/PycharmProjects/lac/build/lac_demo")
  if(EXISTS "$ENV{DESTDIR}/home/zhaoze/PycharmProjects/lac/output/demo/lac_demo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/zhaoze/PycharmProjects/lac/output/demo/lac_demo")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/zhaoze/PycharmProjects/lac/output/demo/lac_demo"
         OLD_RPATH "/home/zhaoze/PycharmProjects/Paddle/fluid_install_dir/paddle/fluid/inference:/home/zhaoze/PycharmProjects/Paddle/fluid_install_dir/third_party/install/mklml/lib:"
         NEW_RPATH "/home/zhaoze/PycharmProjects/Paddle/fluid_install_dir/paddle/fluid/inference:/home/zhaoze/PycharmProjects/Paddle/fluid_install_dir/third_party/install/mklml/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/zhaoze/PycharmProjects/lac/output/demo/lac_demo")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/zhaoze/PycharmProjects/lac/output/include/ilac.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/zhaoze/PycharmProjects/lac/output/include" TYPE FILE FILES "/home/zhaoze/PycharmProjects/lac/include/ilac.h")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/zhaoze/PycharmProjects/lac/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
