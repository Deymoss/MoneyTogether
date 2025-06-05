add_library(Controllers STATIC
    transaction-controller.cpp
    transaction-controller.h
)

target_include_directories(Controllers PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(Controllers Qt6::Core)
