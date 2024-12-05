import 'package:flutter/material.dart';
import 'package:order_purchase/purchase_order/order_purchase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SidebarXExampleApp(),



    );
    
      
    
  }
}
