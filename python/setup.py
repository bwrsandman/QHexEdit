#!/usr/bin/env python

try:
    from PyQt5.QtCore import PYQT_CONFIGURATION, PYQT_VERSION
except ImportError:
    from PyQt4.QtCore import PYQT_CONFIGURATION, PYQT_VERSION
from distutils.core import setup, Extension
from distutils import log

import os
import subprocess
import sipdistutils
import sipconfig


cfg = sipconfig.Configuration()
pyqt_sip_dir = cfg.default_sip_dir
PYQT_MAJOR_VERSION = PYQT_VERSION >> 16


include_dirs = ['../src']


class build_pyqt_ext(sipdistutils.build_ext):
    description = "Build a qhexedit PyQt extension."

    user_options = sipdistutils.build_ext.user_options + [(
        "required",
        None,
        "qhexedit is required (failure to build will raise an error)"
    )]

    boolean_options = sipdistutils.build_ext.boolean_options + ["required"]

    def initialize_options(self):
        sipdistutils.build_ext.initialize_options(self)
        self.required = False

    def finalize_options(self):
        sipdistutils.build_ext.finalize_options(self)
        self.sip_opts = self.sip_opts + PYQT_CONFIGURATION['sip_flags'].split()
        # FIXME: un-hardcode this
        self.sip_opts.append('-I/usr/share/sip/PyQt%d' % PYQT_MAJOR_VERSION)
        self.library_dirs.append(self.build_temp)
        if self.required is not None:
            self.required = True

    def build_extension(self, ext):
        cppsources = (s for s in ext.sources if s.endswith(".cpp"))
        if not os.path.exists(self.build_temp):
            os.makedirs(self.build_temp)
        for source in cppsources:
            header = source.replace(".cpp", ".h")
            if os.path.exists(header):
                moc_file = os.path.basename(header).replace(".h", ".moc")
                call_arg = [
                    "moc",
                    "-o",
                    os.path.join(self.build_temp, moc_file),
                    header
                ]
                log.info("Calling: " + " ".join(call_arg))
                try:
                    subprocess.call(call_arg)
                except OSError:
                    raise OSError(
                        "Could not locate 'moc' executable."
                    )
        cwd = os.getcwd()
        os.chdir(self.build_temp)
        call_arg = [  # FIXME: un-hardcode this
            "qmake-qt%d" % PYQT_MAJOR_VERSION,
            os.path.join(cwd, "../src/qhexedit.pro"),
        ]
        log.info("Calling: " + " ".join(call_arg) + " in " + os.getcwd())
        subprocess.call(call_arg)
        call_arg = [
            "make",
        ]
        log.info("Calling: " + " ".join(call_arg) + " in " + os.getcwd())
        call_arg = [
            "make",
            "install",
        ]
        log.info("Calling: " + " ".join(call_arg) + " in " + os.getcwd())
        subprocess.call(call_arg)
        os.chdir(cwd)
        sipdistutils.build_ext.build_extension(self, ext)

    def run(self):
        try:
            sipdistutils.build_ext.run(self)
        except Exception as ex:
            if self.required:
                raise
            else:
                log.info("Could not build qhexedit extension (%r)\n"
                         "Skipping." % ex)

    # For sipdistutils to find PyQt5's .sip files
    def _sip_sipfiles_dir(self):
        return pyqt_sip_dir


# Used Qt libs
qt_libs = ["QtCore", "QtGui"]
if PYQT_MAJOR_VERSION == 5:
    qt_libs.append("QtWidgets")

if cfg.qt_framework:
    for lib in qt_libs:
        include_dirs += [os.path.join(cfg.qt_lib_dir,
                                      lib + ".framework", "Headers")]
else:
    qt_inc_dir = '/usr/include/qt'  #FIXME: un-hardcode this
    if PYQT_MAJOR_VERSION == 4:
        qt_inc_dir += str(PYQT_MAJOR_VERSION)
    include_dirs.append(qt_inc_dir)
    include_dirs += [os.path.join(qt_inc_dir, lib) for lib in qt_libs]

if PYQT_MAJOR_VERSION == 5:
    libraries = ["Qt%d%s" % (PYQT_MAJOR_VERSION, lib[2:]) for lib in qt_libs]
else:
    libraries = qt_libs.copy()
libraries.append("qhexedit")

setup(
    name='qhexedit',
    version='1.0',
    ext_modules=[
        Extension(
            "qhexedit",
            sources=[
                "qhexedit.sip",
                "../src/qhexedit.cpp" ,
                "../src/qhexedit_p.cpp" ,
                "../src/xbytearray.cpp",
                "../src/commands.cpp",
            ],
            include_dirs=include_dirs,
            libraries = libraries,
        )
    ],
    cmdclass={"build_ext": build_pyqt_ext},
)
