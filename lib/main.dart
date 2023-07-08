import 'package:flutter/material.dart';
import 'package:yew_tec_interview_project/screen/item_screen.dart';
import 'package:yew_tec_interview_project/screen/order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.cyan),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 10, 91, 116)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ItemScreen()));
                },
                child: Container(
                  width: 150,
                  padding: EdgeInsets.all(50),
                  color: Colors.cyan,
                  child: Center(
                      child:
                          Column(children: [Icon(Icons.menu), Text("Item")])),
                )),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderScreen()));
                },
                child: Container(
                    width: 150,
                    padding: EdgeInsets.all(50),
                    color: Colors.cyan,
                    child: Center(
                        child: Column(children: [
                      Icon(Icons.shopping_bag),
                      Text("order")
                    ]))))
          ]),
    );
  }
}
