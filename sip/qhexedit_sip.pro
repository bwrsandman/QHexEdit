QT       += core

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET   = QHexEdit
TEMPLATE = lib

CONFIG   += qt warn_on release

HEADERS  +=
SOURCES  +=
 
include(../src/qhexedit_widget.pri)
