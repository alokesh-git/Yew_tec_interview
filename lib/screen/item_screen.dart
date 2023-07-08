

import 'package:flutter/material.dart';
import 'package:yew_tec_interview_project/screen/cart_screen.dart';

import '../model/items.dart';

import '../service/service.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  TextEditingController quantity = TextEditingController();
  TextEditingController rate = TextEditingController();
  List<Item> items = [];
  final Service _service = Service();
  List<Map> addToCart = [];
  @override
  void initState() {
    super.initState();
    _service.getItems().then((value) {
      items = value;
      setState(() {});
    });
  }

 @override
  void dispose() {
    super.dispose();
    addToCart.clear();
    quantity.clear();
    rate.clear();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Item Page"), actions: [
        (addToCart.isEmpty)
            ? Icon(Icons.add_shopping_cart)
            : Badge(
                label: Text(addToCart.length.toString()),
                child: IconButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(cart: addToCart),));}, icon: Icon(Icons.add_shopping_cart)))
      ]),
      body: (items.isEmpty)
          ? Center(child: CircularProgressIndicator())
          : Flex(
              direction: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: "search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: Colors.black,
                                style: BorderStyle.solid))),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (context, index) => Container(
                    width: size.width,
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        offset: Offset(0.5, 0.5),
                        blurRadius: 2,
                        color: Colors.black54,
                      )
                    ]),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              items[index].Item_Name,
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  TextField(
                                                      controller: quantity,
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                          hintText: "Quantity",
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  style: BorderStyle
                                                                      .solid)))),
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  TextField(
                                                      controller: rate,
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                          hintText: "Rate",
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  style: BorderStyle
                                                                      .solid)))),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    addToCart.add({
                                                      "name": items[index].Item_Name,
                                                      "Item_Id": items[index].RowId,
                                                      "Qty": quantity.text,
                                                      "Rate": rate.text,
                                                      "Amount": num.parse(quantity.text) * num.parse(rate.text),
                                                      "Unit_Id": 30.0
                                                    });
                                                    setState(() {
                                                      quantity.clear();
                                                      rate.clear();
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Text("Add"))
                                            ],
                                          ));
                                },
                                icon: Icon(Icons.add))
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
    );
  }
}
