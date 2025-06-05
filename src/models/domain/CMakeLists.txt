add_library(Domain STATIC
    transaction.cpp
    transaction.h
)

target_include_directories(Domain PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})