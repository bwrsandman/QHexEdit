#include "qhexedit.h"
#include "qhexedit_plugin.h"

#include <QtPlugin>

QHexEditPlugin::QHexEditPlugin(QObject *parent)
    : QObject(parent)
{
    m_initialized = false;
}

void QHexEditPlugin::initialize(QDesignerFormEditorInterface * /* core */)
{
    if (m_initialized)
        return;

    // Add extension registrations, etc. here

    m_initialized = true;
}

bool QHexEditPlugin::isInitialized() const
{
    return m_initialized;
}

QWidget *QHexEditPlugin::createWidget(QWidget *parent)
{
    return new QHexEdit(parent);
}

QString QHexEditPlugin::name() const
{
    return QLatin1String("QHexEdit");
}

QString QHexEditPlugin::group() const
{
    return QLatin1String("Input Widgets");
}

QIcon QHexEditPlugin::icon() const
{
    return QIcon();
}

QString QHexEditPlugin::toolTip() const
{
    return QLatin1String("Binary Hex Editor");
}

QString QHexEditPlugin::whatsThis() const
{
    return QLatin1String("");
}

bool QHexEditPlugin::isContainer() const
{
    return false;
}

QString QHexEditPlugin::domXml() const
{
    return QLatin1String("<widget class=\"QHexEdit\" name=\"qHexEdit\">\n</widget>\n");
}

QString QHexEditPlugin::includeFile() const
{
    return QLatin1String("qhexedit.h");
}
#if QT_VERSION < 0x050000
Q_EXPORT_PLUGIN2(QHexEdit, QHexEditPlugin)
#endif // QT_VERSION < 0x050000
