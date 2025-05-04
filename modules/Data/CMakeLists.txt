add_library(Data STATIC
    database-manager.cpp
    database-manager.h
    transaction-repository.h transaction-repository.cpp
    wallet-repository.h wallet-repository.cpp
    remote-api-client.h remote-api-client.cpp
    data-mapper.h data-mapper.cpp
)

target_include_directories(Data PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(Data Qt6::Core Core)
