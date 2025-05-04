add_library(Sync STATIC
    sync-manager.cpp
    sync-manager.h
    change-tracker.h change-tracker.cpp
    conflict-resolver.h conflict-resolver.cpp
    network-monitor.h network-monitor.cpp
)

target_include_directories(Sync PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(Sync Qt6::Core Core Data)
