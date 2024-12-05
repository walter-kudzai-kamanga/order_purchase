import 'package:flutter/material.dart';
import 'dart:math';

import 'package:dynamic_table/dynamic_table.dart';
import 'package:order_purchase/dummy%20data/dummy.dart';

import 'package:order_purchase/purchase_order/orders.dart';

class MyAp extends StatefulWidget {
  const MyAp({
    super.key,
  });

  @override
  State<MyAp> createState() => _MyAppState();
}

class _MyAppState extends State<MyAp> {
  var tableKey = GlobalKey<DynamicTableState>();
  var myData = dummyData.toList();
  TextEditingController field2Controller = TextEditingController();
  DateTime? selectedDate;

 

  void clearTable() {
    setState(() {
      myData.clear();
    });
  }

  void showCustomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController field1Controller = TextEditingController();
        TextEditingController field2Controller = TextEditingController();
        TextEditingController field3Controller = TextEditingController();
        TextEditingController field4Controller = TextEditingController();
        TextEditingController field5Controller = TextEditingController();
        return AlertDialog(
          title: const Text(
            'Proceed by filling the Purchase Order form below',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: field1Controller,
                decoration: const InputDecoration(
                  labelText: 'Batch*',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Status*',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Received',
                    child: Text('Received'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Not Received',
                    child: Text('Not Received'),
                  ),
                 
                ],
                onChanged: (value) {
                 
                  field2Controller.text = value!;
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: field3Controller,
                decoration: const InputDecoration(
                  labelText: 'Delivery Date',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Payment Method*',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Cash',
                    child: Text('Cash'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Ecocash',
                    child: Text('Ecocash'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Cheque',
                    child: Text('Cheque'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Bank',
                    child: Text('Bank'),
                  ),
               
                ],
                onChanged: (value) {
                 
                  field4Controller.text = value!;
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: field5Controller,
                decoration: const InputDecoration(
                  labelText: 'Notes*',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                field1Controller.clear();
                field2Controller.clear();
                field3Controller.clear();
                field4Controller.clear();
                field5Controller.clear();

                Navigator.pop(context);
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh),
                  SizedBox(width: 8),
                  Text('Reset'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showCustoDialog();
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.credit_card),
                  SizedBox(width: 8),
                  Text('Proceed To Payment'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void showCustoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController field6Controller = TextEditingController();
        TextEditingController field7Controller = TextEditingController();

        return AlertDialog(
          title: const Text(
            'Supplier Payments',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Select Supplier',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Casper Moyo',
                    child: Text('Casper Moyo'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Bruce Mawere',
                    child: Text('Bruce Mawere'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Walter Kamanga',
                    child: Text('Walter Kamanga'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Katlego',
                    child: Text('Kamanga'),
                  ),
                
                ],
                onChanged: (value) {
                 
                  field6Controller.text = value!;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Select Currency',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem<String>(
                    value: 'USD',
                    child: Text('USD'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'ZWG',
                    child: Text('ZWG'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Rand',
                    child: Text('Rand'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Pound',
                    child: Text('Pound'),
                  ),
                  // ... other items
                ],
                onChanged: (value) {
                  // Handle the selected value
                  field7Controller.text = value!;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Select Payment Option',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Debit Card',
                    child: Text('Debit Card'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Cash',
                    child: Text('Cash'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Digital Wallet',
                    child: Text('Digital Wallet'),
                  ),

                  // ... other items
                ],
                onChanged: (value) {
                  // Handle the selected value
                  field7Controller.text = value!;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.save),
                  SizedBox(width: 8),
                  Text('Save'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

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
                  header: const Text(
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
                  showActions: false,
                  showAddRowButton: false,
                  showDeleteAction: false,
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
                  onRowsPerPageChanged: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Rows Per Page Changed to $value"),
                      ),
                    );
                  },
                  actions: const [],
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
                        label: const Text("#"),
                        onSort: (columnIndex, ascending) {},
                        isEditable: false,
                        dynamicTableInputType: DynamicTableInputType.text()),
                    DynamicTableDataColumn(
                        label: Container(
                            color: Colors.white, child: const Text("Product")),
                        onSort: (columnIndex, ascending) {},
                        dynamicTableInputType: DynamicTableInputType.text()),
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
                      label: const Text("Supplier Price"),
                      onSort: (columnIndex, ascending) {},
                      dynamicTableInputType: DynamicTableInputType.text(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 100,
                      ),
                    ),
                    DynamicTableDataColumn(
                      label: const Text("Total Supplier Price"),
                      onSort: (columnIndex, ascending) {},
                      dynamicTableInputType: DynamicTableInputType.text(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 100,
                      ),
                    ),
                    DynamicTableDataColumn(
                      label: const Text("Total Product Expense"),
                      onSort: (columnIndex, ascending) {},
                      dynamicTableInputType: DynamicTableInputType.text(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 100,
                      ),
                    ),
                    DynamicTableDataColumn(
                        label: const Text("Unit Product Expense"),
                        isEditable: false,
                        dynamicTableInputType: DynamicTableInputType.text()),
                    DynamicTableDataColumn(
                        label: const Text("Purchase Price + Expense"),
                        isEditable: false,
                        dynamicTableInputType: DynamicTableInputType.text()),
                    DynamicTableDataColumn(
                        label: const Text("Total Purchase Price"),
                        isEditable: false,
                        dynamicTableInputType: DynamicTableInputType.text()),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Align buttons to the right
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyAppp()),
                      );
                    },
                    child: const Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showCustomDialog();
                    },
                    child: const Text('Confirm'),
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
