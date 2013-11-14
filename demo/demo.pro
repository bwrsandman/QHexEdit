QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = QHexEditor
TEMPLATE = app

HEADERS += \
    mainwindow.h \
    optionsdialog.h \
    searchdialog.h


SOURCES += \
    main.cpp \
    mainwindow.cpp \
    optionsdialog.cpp \
    searchdialog.cpp

RESOURCES += \
    qhexedit.qrc

FORMS += \
    optionsdialog.ui \
    searchdialog.ui

TRANSLATIONS += \
    translations/qhexedit_cs.ts \
    translations/qhexedit_de.ts

include(../src/qhexedit_widget.pri)
