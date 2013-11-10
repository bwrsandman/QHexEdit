HEADERS += qhexedit.h \
    qhexedit_p.h \
    commands.h \
    xbytearray.h \
    QHexEdit

SOURCES += qhexedit.cpp \
    qhexedit_p.cpp \
    commands.cpp \
    xbytearray.cpp

headers.files += $$HEADERS
headers.path += $$[QT_INSTALL_HEADERS]/QtWidgets
INSTALLS += headers
