#include "centralmodel.h"

#include <QModelIndex>

CentralModel::CentralModel(QObject *parent) :
    QStandardItemModel(parent)
{
    QStandardItemModel* model = this;
    model->setColumnCount(14);

    for (int i = 0; i < 5; ++i) {

    model->setItem(i, 0, new QStandardItem(QString("Terminal %1").arg(i)));
    model->setItem(i, 1, new QStandardItem("2"));
    model->setItem(i, 2, new QStandardItem("3"));
    model->setItem(i, 3, new QStandardItem("4"));
    model->setItem(i, 4, new QStandardItem("5"));
    model->setItem(i, 5, new QStandardItem("6"));
    model->setItem(i, 6, new QStandardItem("7"));
    model->setItem(i, 7, new QStandardItem("8"));
    model->setItem(i, 8, new QStandardItem("9"));
    model->setItem(i, 9, new QStandardItem("10"));
    model->setItem(i, 10, new QStandardItem("11"));
    model->setItem(i, 11, new QStandardItem("12"));
    model->setItem(i, 12, new QStandardItem("13"));
    model->setItem(i, 13, new QStandardItem("14"));
    }

    model->setHorizontalHeaderItem(0, new QStandardItem( "Terminal ID" ));
    model->setHorizontalHeaderItem(1, new QStandardItem( "Active" ));
    model->setHorizontalHeaderItem(2, new QStandardItem( "C" ));
    model->setHorizontalHeaderItem(3, new QStandardItem( "Terminal ID" ));
    model->setHorizontalHeaderItem(4, new QStandardItem( "Terminal ID" ));


      //%new QStandardItemModel(5, 2, parent);
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

}
