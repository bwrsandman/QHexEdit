CONFIG      += plugin debug_and_release
TARGET      = $$qtLibraryTarget(QHexEdit)
TEMPLATE    = lib

HEADERS     = qhexedit_plugin.h
SOURCES     = qhexedit_plugin.cpp
RESOURCES   = icons.qrc
LIBS        += -L. 

greaterThan(QT_MAJOR_VERSION, 4) {
    QT += designer
} else {
    CONFIG += designer
}

include(../src/qhexedit_widget.pri)

target.path = $$[QT_INSTALL_PLUGINS]/designer
INSTALLS    += target
