add_library(Services STATIC
    transaction-service.cpp
    transaction-service.h
)

target_include_directories(Services PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(Services Qt6::Core)
