add_library(Common STATIC
    enums.h
    logger.h
    logger.cpp
)

target_include_directories(Common PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(Common Qt6::Core)
