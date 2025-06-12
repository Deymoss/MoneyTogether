set_source_files_properties(Strings.qml Style/Style.qml PROPERTIES
    QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(Assets
    URI UI.Assets
    VERSION 1.0
    QML_FILES
        Strings.qml
        Style/Style.qml
	Style/StyleBase.qml
	Style/StyleDark.qml
	Style/StyleLight.qml
)
