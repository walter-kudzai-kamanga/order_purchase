import 'package:flutter/material.dart';
import 'dart:math';

import 'package:dynamic_table/dynamic_table.dart';
import 'package:order_purchase/dummy%20data/dummy.dart';
import 'package:order_purchase/purchase_order/payment_page.dart';

class MyAppp extends StatefulWidget {
  const MyAppp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAppp> createState() => _MyAppState();
}

class _MyAppState extends State<MyAppp> {
  var tableKey = GlobalKey<DynamicTableState>();
  var myData = dummyData.toList();

  void clearTable() {
    setState(() {
      myData.clear();
    });
  }
List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Create Purchase Order"),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DynamicTable(
                  key: tableKey,
                  header: Text(
                    "Purchase Order Items",
                  ),
                  onRowEdit: (index, row) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Row Edited index:$index row:$row"),
                      ),
                    );
                    myData[index] = row as String;
                    return true;
                  },
                  onRowDelete: (index, row) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Row Deleted index:$index row:$row"),
                      ),
                    );
                    myData.removeAt(index);
                    return true;
                  },
                  onRowSave: (index, old, newValue) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Row Saved index:$index old:$old new:$newValue"),
                      ),
                    );
                    if (newValue[0] == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Name cannot be null"),
                        ),
                      );
                      return null;
                    }

                    if (newValue[0].toString().length < 3) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Name must be atleast 3 characters long"),
                        ),
                      );
                      return null;
                    }
                    if (newValue[0].toString().length > 20) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Name must be less than 20 characters long"),
                        ),
                      );
                      return null;
                    }
                    if (newValue[1] == null) {
                      //If newly added row then add unique ID
                      newValue[1] = Random()
                          .nextInt(500)
                          .toString(); // to add Unique ID because it is not editable
                    }
                    myData[index] = newValue as String; // Update data
                    if (newValue[0] == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Name cannot be null"),
                        ),
                      );
                      return null;
                    }
                    return newValue;
                  },
                  showActions: true,
                  showAddRowButton: true,
                  showDeleteAction: true,
                  rowsPerPage: 5,
                  showFirstLastButtons: true,
                  availableRowsPerPage: const [
                    5,
                    10,
                    15,
                    20,
                  ],
                  dataRowMinHeight: 60,
                  dataRowMaxHeight: 60,
                  columnSpacing: 60,
                  actionColumnTitle: "My Action Title",
                  showCheckboxColumn: true,
                  onSelectAll: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: value ?? false
                            ? const Text("All Rows Selected")
                            : const Text("All Rows Unselected"),
                      ),
                    );
                  },
                  onRowsPerPageChanged: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Rows Per Page Changed to $value"),
                      ),
                    );
                  },
                  actions: [],
                  rows: List.generate(
                    myData.length,
                    (index) => DynamicTableDataRow(
                      onSelectChanged: (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: value ?? false
                                ? Text("Row Selected index:$index")
                                : Text("Row Unselected index:$index"),
                          ),
                        );
                      },
                      index: index,
                      cells: List.generate(
                        myData[index].length,
                        (cellIndex) => DynamicTableDataCell(
                          value: myData[index][cellIndex],
                        ),
                      ),
                    ),
                  ),
                  columns: [
                    DynamicTableDataColumn(
                        label: const Text("Unique ID"),
                        onSort: (columnIndex, ascending) {},
                        isEditable: false,
                        dynamicTableInputType: DynamicTableInputType.text()),
                    DynamicTableDataColumn(
                        label: Container(
                            color: Colors.white, child: const Text("Name")),
                        onSort: (columnIndex, ascending) {},
                        dynamicTableInputType: DynamicTableInputType.text()),
                    DynamicTableDataColumn(
                      label: const Text("Product"),
                      onSort: (columnIndex, ascending) {},
                      dynamicTableInputType: DynamicTableInputType.text(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 100,
                      ),
                    ),
                    DynamicTableDataColumn(
                      label: const Text("Supplier"),
                      onSort: (columnIndex, ascending) {},
                      dynamicTableInputType: DynamicTableInputType.text(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 100,
                      ),
                    ),
                    DynamicTableDataColumn(
                      label: const Text("Quantity"),
                      onSort: (columnIndex, ascending) {},
                      dynamicTableInputType: DynamicTableInputType.text(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 100,
                      ),
                    ),
                    DynamicTableDataColumn(
                      label: const Text("Unit Price"),
                      onSort: (columnIndex, ascending) {},
                      dynamicTableInputType: DynamicTableInputType.text(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 100,
                      ),
                    ),
                    DynamicTableDataColumn(
                        label: const Text("Total Price"),
                        isEditable: false,
                        dynamicTableInputType: DynamicTableInputType.text()),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, 
                children: [
                  ElevatedButton(
                    onPressed: clearTable,
                    child: const Text('Clear'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyAp()),
                      );
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
