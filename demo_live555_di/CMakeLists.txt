#This should be the first line of the CMakeLists.txt
cmake_minimum_required(VERSION 3.2)

# Poor practice, but very common
project(live555 VERSION 4.7.2)

#
add_subdirectory(liveMedia)
add_subdirectory(groupsock)
add_subdirectory(BasicUsageEnvironment)
add_subdirectory(UsageEnvironment)

file(GLOB USER_LIBS_FILE ./mediaServer/*.cpp)
add_executable(live555MediaServer
        ${USER_LIBS_FILE})   

add_definitions("-std=c++11 -O0 -DSOCKLEN_T=socklen_t -g -D_LARGEFILE_SOURCE=1 -D_FILE_OFFSET_BITS=64 -Wall -DBSD=1")
#add_compile_options(-std=c++11 -O -DSOCKLEN_T=socklen_t -g -D_LARGEFILE_SOURCE=1 -D_FILE_OFFSET_BITS=64 -Wall -DBSD=1)

target_link_libraries(live555MediaServer
        PRIVATE liveMedia
        PRIVATE groupsock
        PRIVATE BasicUsageEnvironment
        PRIVATE UsageEnvironment
      )

target_include_directories(live555MediaServer 
        PUBLIC .
        PUBLIC include
        PUBLIC UsageEnvironment/include
        PUBLIC groupsock/include
        PUBLIC liveMedia/include
        PUBLIC BasicUsageEnvironment/include)

add_executable(testRTSPClient testProgs/testRTSPClient.cpp)  
target_link_libraries(testRTSPClient
        PUBLIC ssl
        PUBLIC crypto
        PRIVATE liveMedia
        PRIVATE groupsock
        PRIVATE BasicUsageEnvironment
        PRIVATE UsageEnvironment
        )
target_include_directories(testRTSPClient 
        PUBLIC .
        PUBLIC include
        PUBLIC UsageEnvironment/include
        PUBLIC groupsock/include
        PUBLIC liveMedia/include
        PUBLIC BasicUsageEnvironment/include)

