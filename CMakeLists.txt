cmake_minimum_required(VERSION 3.16)

project(MoneyTogether VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(Qt6 REQUIRED COMPONENTS Gui Quick REQUIRED)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appMoneyTogether
    main.cpp
)

set(QT_QML_GENERATE_QMLLS_INI OFF)
qt_add_qml_module(appMoneyTogether
    URI MoneyTogether
    VERSION 1.0
    QML_FILES
    Main.qml
    Pages/HomePage.qml
)

add_subdirectory(Assets)
add_subdirectory(Components)

# set(QML_IMPORT_PATH "${CMAKE_SOURCE_DIR}/qml")
# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appMoneyTogether PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appMoneyTogether
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    QT_QML_IMPORT_PATH "${QML_IMPORT_PATH}"
)

target_link_libraries(appMoneyTogether
    PRIVATE Qt6::Gui Qt6::Quick AssetsLibplugin
)

install(TARGETS appMoneyTogether
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
