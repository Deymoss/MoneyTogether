qt_add_library(ComponentsLib STATIC)

set_target_properties(ComponentsLib PROPERTIES AUTOMOC ON)
target_link_libraries(ComponentsLib PRIVATE Qt6::Quick)

list(APPEND MODULE_QML_FILES
    MButton.qml MImageButton.qml MSlider.qml)

qt_add_qml_module(ComponentsLib
    URI Basic
    VERSION 1.0
    QML_FILES
        ${MODULE_QML_FILES}
)