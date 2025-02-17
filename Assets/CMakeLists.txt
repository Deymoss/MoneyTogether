qt_add_library(AssetsLib STATIC)

set_target_properties(AssetsLib PROPERTIES AUTOMOC ON)
target_link_libraries(AssetsLib PRIVATE Qt6::Quick)

list(APPEND MODULE_QML_FILES Strings.qml Style.qml)

set_source_files_properties(${MODULE_QML_FILES} PROPERTIES
    QT_QML_SINGLETON_TYPE  TRUE
)

qt_add_qml_module(AssetsLib
    URI Assets
    VERSION 1.0
    QML_FILES
        ${MODULE_QML_FILES}
)