#include "centralmodel.h"

CentralModel::CentralModel(QObject *parent) :
    QStandardItemModel(parent)
{
        QStandardItemModel* model = this; //%new QStandardItemModel(5, 2, parent);
       for( int r=0; r<5; r++ )
           for( int c=0; c<2; c++)  {
               QStandardItem* item = new QStandardItem(
                   QString("Row:%0, Column:%1").arg(r).arg(c) );
               if( c == 0 )
                   for( int i=0; i<3; i++ ) {
                       QStandardItem* child = new QStandardItem(
                           QString("Item %0").arg(i) );
                       item->appendRow( child );
                   }
               model->setItem(r, c, item);
           }
       model->setHorizontalHeaderItem( 0, new QStandardItem( "Name" ));
       model->setHorizontalHeaderItem( 1, new QStandardItem( "Value" ) );

    //   QStandardItem* item = new QStandardItem("Gas1");


       QStandardItem item;
       item.setText("");
       for (int i = 0; i < 10; ++i)
       {
           QStandardItem item[7];
           QList<QStandardItem *> row;
           item.append(QString("Gas %1").arg(i));
           model->appendRow();

           item[0].setText();

           std::queue<float> h2s;
           std::queue<float> so2;
           std::queue<float> fel;
       }
}

