#!/usr/bin/env python

import sys

try:
    from PyQt5.QtWidgets import QApplication, QWidget, QGridLayout
    from qhexedit import QHexEdit
except (ImportError, RuntimeError):
    from PyQt4 import QtGui
    QApplication = QtGui.QApplication
    QWidget = QtGui.QWidget
    QGridLayout = QtGui.QGridLaout
    from qhexedit import QHexEdit


if __name__ == '__main__':
    app = QApplication(sys.argv)
    widget = QWidget()
    layout = QGridLayout()
    qhexedit = QHexEdit(widget)
    layout.addWidget(qhexedit, 0, 0)
    widget.setLayout(layout)
    widget.show()
    sys.exit(app.exec_())
