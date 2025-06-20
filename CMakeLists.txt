cmake_minimum_required(VERSION 3.16)

project(MoneyTogether VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(QT_QML_GENERATE_QMLLS_INI ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Gui Quick Graphs REQUIRED)

qt_standard_project_setup(REQUIRES 6.9)

qt_add_executable(appMoneyTogether
    src/main.cpp
)

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR}/src PREFIX "Application" FILES src/main.cpp src/Main.qml)

# this isn't necessary with qt_standard_project_setup(REQUIRES 6.8) or higher which enables
# QTP0005 - adding the TARGET part to QML Module's DEPENDENCIES property.
set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# This isn't necessary either if you use DEPENDENCIES TARGETs
# set(QML_IMPORT_PATH "${CMAKE_SOURCE_DIR}")

# No need for this either
# set(QML_IMPORT_PATH
#     ${CMAKE_BINARY_DIR}/qml
#     CACHE STRING "" FORCE
# )

# Put the add_subdirectories first so their targets can be referred to
# These are under a sub-folder "modules" which isn't altogether necessary,
# but using DEPENDENCIES target will ensure that this doesn't matter.
add_subdirectory(qml)
add_subdirectory(src/controllers)
add_subdirectory(src/common)
add_subdirectory(src/models)
add_subdirectory(src/persistence)
add_subdirectory(src/services)

qt_add_qml_module(appMoneyTogether
    URI MoneyTogether
    VERSION 1.0
    DEPENDENCIES
        TARGET
        Assets
        Components
        Pages
    QML_FILES
        src/Main.qml
    RESOURCES
        res/images/ic_arrow_expand.png
        res/images/ic_edit.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appMoneyTogether PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appMoneyTogether
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    # No need for this
    # QT_QML_IMPORT_PATH "${QML_IMPORT_PATH}"
)

target_link_libraries(appMoneyTogether
    PRIVATE
        #Qt6::Gui
        Qt6::Quick
        Qt6::Core
        Qt6::Graphs
        Common
        Persistence
        Controllers
        Domain
        QtModels
        Services
        Assets
        Components
        Pages
)

install(TARGETS appMoneyTogether
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
