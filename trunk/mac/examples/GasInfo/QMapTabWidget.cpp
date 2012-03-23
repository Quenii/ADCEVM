#include <QtGui>
#include "QMapTabWidget.h"

#define max(a, b) (((a) > (b)) ? (a) : (b))
QMapTabWidget::QMapTabWidget(QWidget* parent /* = 0 */, Qt::WindowFlags f /* = 0 */)
: QWidget(parent, f)
{
    ui.setupUi(this);
    maxX = 0.0f;
    maxY = 0.0f;

 }

void QMapTabWidget::updateGraphic(QList<GpsInfo>& list)
{
    if (list[0].valid == false)
        return;
    for(int i=1; i<17; ++i)
    {
        if (list[i].valid)
        {
            maxX = max(maxX, abs(list[i].deltaX));
            maxY = max(maxY, abs(list[i].deltaY));
        }
    }
    posList.clear();
    posList.append(list);
}

void QMapTabWidget::paintEvent(QPaintEvent *)
{
    QPainter painter(this);
    painter.translate(width()/2, height()/2);
    painter.setPen(QPen(QColor(0, 127, 127, 100), 8));
    painter.drawEllipse(-5, -5, 10, 10);

    float k = (float)(height()-10) / max(maxY, maxX) / 2;

    float h = height();

    if (posList.size() < 17)
        return;

    for(int i=1; i<17; ++i)
    {
        if (posList[i].valid)
        {
            int x = posList.at(i).deltaX * k;
            int y = posList.at(i).deltaY * k;
            painter.setPen(QPen(QColor(127, 127, 0, 100), 8));
            painter.drawEllipse(x, y, 10, 10);
            painter.setPen(QPen(QColor(0, 0, 0, 100), 8));
            painter.drawText(x+3, y+8, QString("%1").arg(i-1));

        }
    }

}

//void QLogTabWidget::setData(QString zigbee, QString gps)
//{
//    ui.plainTextEditZigbee->moveCursor(QTextCursor::End);
//    ui.plainTextEditZigbee->insertPlainText(zigbee);

//    ui.plainTextEditGps->moveCursor(QTextCursor::End);
//    ui.plainTextEditGps->insertPlainText(gps);
//}
