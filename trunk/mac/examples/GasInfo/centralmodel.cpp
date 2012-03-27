#include "centralmodel.h"

#include <QModelIndex>

CentralModel::CentralModel(QObject *parent) :
    QStandardItemModel(parent)
{
        QStandardItemModel* model = this; //%new QStandardItemModel(5, 2, parent);
     /*  for( int r=0; r<5; r++ )
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
*/
    //   QStandardItem* item = new QStandardItem("Gas1");


     /*  QStandardItem item;
       item.setText("");
       for (int i = 0; i < 10; ++i)
       {
           QStandardItem item[7];
           QList<QStandardItem *> row;

           for (int j = 0; j < 7; ++j)
           {
               item[j].setText(QString("%1").arg(j));
               row.append(&(item[j]));
           }

           model->appendRow(row);
       }
       */
          QModelIndex p;
          for (int i = 0; i < 4; ++i) {
              p = model->index(0, 0, p);
              model->insertRows(0, 1, p);
              model->insertColumns(0, 1, p);
              QModelIndex index = model->index(0, 0, p);
              model->setData(index, i);
}
}
