QHexEdit
========

Fork of the original QHexEdit widget (http://code.google.com/p/qhexedit2).

QHexEdit is a hex editor widget written in C++ for the Qt (Qt5) framework. It is a simple editor for binary data, just like QPlainTextEdit is for text data. There are sip configuration files included, so it is easy to create bindings for PyQt and you can use this widget also in python.

QHexEdit takes the data of a QByteArray (setData()) and shows it. You can use the mouse or the keyboard to navigate inside the widget. If you hit the keys (0..9, a..f) you will change the data. Changed data is highlighted and can be accessed via data().

Normaly QHexEdit works in the overwrite Mode. You can set overwriteMode(false) and insert data. In this case the size of data() increases. It is also possible to delete bytes (del or backspace), here the size of data decreases.

You can select data with keyboard hits or mouse movements. The copy-key will copy the selected data into the clipboard. The cut-key copies also but delets it afterwards. In overwrite mode, the paste function overwrites the content of the (does not change the length) data. In insert mode, clipboard data will be inserted. The clipboard content is expected in ASCII Hex notation. Unknown characters will be ignored.

QHexEdit comes with undo/redo functionality. All changes can be undone, by pressing the undo-key (usually ctr-z). They can also be redone afterwards. The undo/redo framework is cleared, when setData() sets up a new content for the editor. You can search data inside the content with indexOf() and lastIndexOf(). The replace() function is to change located subdata. This 'replaced' data can also be undone by the undo/redo framework.

This widget can only handle small amounts of data. The size has to be below 10 megabytes, otherwise the scroll sliders ard not shown and you can't scroll any more.
    
    
Demonstration
-------------

A simple demo of the widget is provided in `./demo`.

![Screenshot of QHexEdit Widget](https://raw.github.com/bwrsandman/QHexEdit/master/demo/screenshot.png)

Using it in a project
---------------------

Include `src/qhexedit_widget.pri` in the QMake project file. 

All the required files are in `./src`.

To preserve the git history, please use `git submodule` or `git filter-branch --subdirectory-filter`:
```bash
git submodule add git://github.com/bwrsandman/QHexEdit.git
```
or
```bash
git clone git://github.com/bwrsandman/QHexEdit.git
cd QHexEdit
git filter-branch --subdirectory-filter src -- --all
mkdir QHexEditWidget
git mv * QHexEditWidget
git commit
cd "${YourProject}"
git pull "${PathTo}"/QHexEdit
```

Installing as a Qt Designer/Creator Plugin
------------------------------------------

The sources for the designer plugin are in `./designer_plugin`.

Compile the library and install in `(Qt SDK)/(Qt Version)/(Toolchain)/plugins/designer`.
```bash
cd designer_plugin
qmake -Wall
make 
make install # sudo or through your package manager
```

Latest Version
--------------

The latest version of the sources can be found at the following location:

https://github.com/bwrsandman/QHexEdit
