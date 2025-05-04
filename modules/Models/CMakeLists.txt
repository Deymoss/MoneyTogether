add_library(Models STATIC
    wallet-model.cpp
    wallet-model.h
    transaction-model.h transaction-model.cpp
    goal-model.h goal-model.cpp
    user-model.h user-model.cpp
)

target_include_directories(Models PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(Models Qt6::Core Core)
