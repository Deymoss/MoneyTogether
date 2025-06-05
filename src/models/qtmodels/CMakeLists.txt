add_library(QtModels STATIC
    transaction-list-model.cpp
    transaction-list-model.h
)

target_include_directories(QtModels PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(QtModels PUBLIC
    Domain
    Qt6::Core
    Qt6::Gui   
)