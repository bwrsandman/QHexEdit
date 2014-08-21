%Module(name=qhexedit, version=1)

%Import QtCore/QtCoremod.sip
%Import QtGui/QtGuimod.sip
%Import QtWidgets/QtWidgetsmod.sip

class QHexEdit : QScrollArea
{
%TypeHeaderCode
#include <QHexEdit>
%End

public:
    explicit QHexEdit(QWidget *parent /TransferThis/ = 0);
    virtual ~QHexEdit();

    void setData(const QByteArray &);
    QByteArray data();
    void setAddressOffset(int);
    int addressOffset();
    void setAddressAreaColor(const QColor &);
    QColor addressAreaColor();
    void setCursorPosition(int);
    int cursorPosition();
    int selectionStart();
    int selectionEnd();
    int selectionSize();
    void setSelection(int, int);
    void setHighlightingColor(const QColor &);
    QColor highlightingColor();
    void setSelectionColor(const QColor &);
    void setHighlightedRange(int, int);
    QColor selectionColor();
    void setOverwriteMode(bool);
    bool overwriteMode();
    void setReadOnly(bool);
    bool isReadOnly();
    void setFont(const QFont &);
    const QFont &font() const;

    int indexOf(QByteArray &, int) const;
    void insert(int, QByteArray &);
    void insert(int, char);
    int lastIndexOf(QByteArray &, int) const;
    void remove(int, int);
    void replace(int, int, const QByteArray &);
    QString toReadableString();
    QString selectionToReadableString();
    void resizeEvent(QResizeEvent *);

public slots:
    void redo();
    void setAddressWidth(int);
    void setAddressArea(bool);
    void setAsciiArea(bool);
    void setHighlighting(bool);
    void undo();

signals:
    void currentAddressChanged(int);
    void currentSizeChanged(int);
    void dataChanged();
    void overwriteModeChanged(bool);
};
