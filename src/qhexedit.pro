TARGET = qhexedit

TEMPLATE = lib

include(qhexedit_widget.pri)

headers.files += $$HEADERS

macx {
    CONFIG += lib_bundle
    # TODO: probably not needed
    QMAKE_LFLAGS += -F$${TOP}/$${APP_NAME}.app/Contents/Frameworks
    LIBS += -install_name \
        @executable_path/../Frameworks/$${TARGET}.framework/Versions/$${VER_MAJ}/$${TARGET}

    DESTDIR = $${DESTDIR}/$${APP_NAME}.app/Contents/Frameworks
}
else:unix {
    isEmpty( PREFIX ):INSTALL_PREFIX = /usr
    else:INSTALL_PREFIX = $${PREFIX}
    target.path = $${INSTALL_PREFIX}/lib$${LIB_SUFFIX}
    headers.path = $${INSTALL_PREFIX}/include/QHexEdit
    INSTALLS += target headers
}
else:win32 {
    DLLDESTDIR = $${DESTDIR}
}
