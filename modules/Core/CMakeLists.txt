add_library(Core STATIC


    logger.h logger.cpp
    settings-manager.h settings-manager.cpp
    servicelocator.h servicelocator.cpp
    enums.h

)

target_include_directories(Core PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(Core Qt6::Core)
