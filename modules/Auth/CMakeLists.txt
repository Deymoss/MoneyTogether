add_library(Auth STATIC
    auth-manager.cpp
    auth-manager.h
    token-storage.h token-storage.cpp
)

target_include_directories(Auth PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(Auth Qt6::Core Core Data)
