#!/usr/bin/env python

import sys

sys.path.append(
    'build/lib.linux-x86_64-%d.%d/' %
    (sys.version_info.major, sys.version_info.minor)
)

from PyQt5.QtWidgets import QApplication, QWidget, QGridLayout
from QHexEdit import QHexEdit

if __name__ == '__main__':
    app = QApplication(sys.argv)
    widget = QWidget()
    layout = QGridLayout()
    qhexedit = QHexEdit(widget)
    layout.addWidget(qhexedit, 0, 0)
    widget.setLayout(layout)
    widget.show()
    sys.exit(app.exec_())
