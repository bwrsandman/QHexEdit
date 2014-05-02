
INCLUDEPATH += $$PWD

HEADERS += \
    $$PWD/qhexedit.h \
    $$PWD/qhexedit_p.h \
    $$PWD/commands.h \
    $$PWD/xbytearray.h \
    $$PWD/QHexEdit

SOURCES += \
    $$PWD/qhexedit.cpp \
    $$PWD/qhexedit_p.cpp \
    $$PWD/commands.cpp \
    $$PWD/xbytearray.cpp

CONFIG += qt
QT += widgets
