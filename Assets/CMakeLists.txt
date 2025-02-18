qt_add_library(Assets STATIC)

set_target_properties(Assets PROPERTIES AUTOMOC ON)
target_link_libraries(Assets PRIVATE Qt6::Quick)

list(APPEND MODULE_QML_FILES Strings.qml Style/Style.qml)


set_source_files_properties(${MODULE_QML_FILES} PROPERTIES
    QT_QML_SINGLETON_TYPE  TRUE
)

qt_add_qml_module(Assets
    URI Assets
    VERSION 1.0
    QML_FILES
        ${MODULE_QML_FILES}
        QML_FILES Style/StyleBase.qml
        QML_FILES Style/StyleDark.qml
        QML_FILES Style/StyleLight.qml
)
