#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QHexEdit>

#include "optionsdialog.h"
#include "searchdialog.h"

QT_BEGIN_NAMESPACE
class QAction;
class QMenu;
class QUndoStack;
class QLabel;
namespace Ui {
    class MainWindow;
}
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(const char* const fileName="");
    ~MainWindow();
    Ui::MainWindow *ui;

protected:
    void closeEvent(QCloseEvent *event);

private slots:
    void about();
    void open();
    void optionsAccepted();
    void findNext();
    bool save();
    bool saveAs();
    void saveSelectionToReadableFile();
    void saveToReadableFile();
    void setAddress(int address);
    void setOverwriteMode(bool mode);
    void setSize(int size);
    void showOptionsDialog();
    void showSearchDialog();

private:
    void init();
    void connectActions();
    void createStatusBar();
    void loadFile(const QString &fileName);
    void readSettings();
    bool saveFile(const QString &fileName);
    void setCurrentFile(const QString &fileName);
    QString strippedName(const QString &fullFileName);
    void writeSettings();

    QString curFile;
    bool isUntitled;

    OptionsDialog *optionsDialog;
    SearchDialog *searchDialog;
    QLabel *lbAddress, *lbAddressName;
    QLabel *lbOverwriteMode, *lbOverwriteModeName;
    QLabel *lbSize, *lbSizeName;
};

#endif
