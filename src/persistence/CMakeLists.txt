add_library(Persistence STATIC
    database-manager.cpp
    database-manager.h
    transaction-repository.cpp
    transaction-repository.h
)

target_include_directories(Persistence PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(Persistence Qt6::Core)
