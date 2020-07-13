import 'package:flutter/material.dart';

import 'mytable.dart';

class DataTablePage extends StatefulWidget {
  DataTablePage({Key key}) : super(key: key);

  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
       body: getPaginatedDataTable(),
    );
  }

  //默认的行数
  int _defalutRowPageCount = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending=true;
  MyTable table = MyTable();

  //排序关联_sortColumnIndex,_sortAscending
  void _sort<T>(Comparable<T> getField(Shop s),int index,bool b){
    table.sort(getField, b);
    setState(() {
      this._sortColumnIndex=index;
      this._sortAscending=b;
    });
  }
  List<DataColumn> getColumn() {
    return [
      DataColumn(label: Text('商品名'),onSort: (i,b){_sort<String>((Shop p) =>p.name, i, b);}),
      DataColumn(label: Text('价格'),onSort: (i,b){_sort<num>((Shop p) =>p.price, i, b);}),
      DataColumn(label: Text('库存'),onSort: (i,b){_sort<num>((Shop p) =>p.number, i, b);}),
      DataColumn(label: Text('类型'),onSort: (i,b){_sort<String>((Shop p) =>p.type, i, b);}),
    ];
  }

Widget getPaginatedDataTable(){
  return SingleChildScrollView(
        child: PaginatedDataTable(
          rowsPerPage: _defalutRowPageCount,
          onRowsPerPageChanged: (value) {
            setState(() {
              _defalutRowPageCount = value;
            });
          },
          sortColumnIndex: _sortColumnIndex,
          initialFirstRowIndex: 0,
          sortAscending: _sortAscending,
          availableRowsPerPage: [
            5,10
          ],
          onPageChanged: (value){
            print('$value');
          },
          onSelectAll: table.selectAll,
          header: Text('商品库存'),
          columns: getColumn(),
          source: table,
        ),
      );
  }
}