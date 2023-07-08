// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yew_tec_interview_project/model/account.dart';

import '../service/service.dart';
import 'success_screen.dart';

class CartScreen extends StatefulWidget {
  final List<Map> cart;
  const CartScreen({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
   TextEditingController quantity = TextEditingController();
  TextEditingController rate = TextEditingController();
  String setected = '';
  List<Account> allAccout = [];
  List<Map> cartItem = [];
  num total = 0;
  Service _service = Service();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartItem = widget.cart;
    for (var element in cartItem) {
      total += element["Amount"];
    }
    _service.getAccount().then((value) {
      allAccout = value;
      setected = allAccout[0].Account_Name;
      setState(() {});
    });

  }
  void changeCredients(int index){
   cartItem[index]["Qty"] = quantity.text;
   cartItem[index]["Rate"] = rate.text;
   Navigator.pop(context);
   setState(() {
     
   });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Cart Page"), actions: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context,setStateB) {
                      return AlertDialog(
                        title: Container(
                          decoration:
                              const BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 2.0,
                              color: Colors.black54,
                            )
                          ]),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [Text(setected,style: const TextStyle(overflow: TextOverflow.fade,fontSize: 12.0),),IconButton(onPressed: (){
                              // ignore: prefer_const_constructors
                              showDialog(context: context, builder: (context) => AlertDialog(content: CircularProgressIndicator(),));
                              _service.postAccount(allAccout[allAccout.indexWhere((element) => element.Account_Name == setected)].RowId,total).then((value){Navigator.push(context, MaterialPageRoute(builder: (context) => SeccessScreen()));});
                            }, icon: const Icon(Icons.flag))]),
                          ),
                        ),
                      content: SingleChildScrollView(
                        child: Column(children: allAccout.map((e) => InkWell(onTap: (){setState(() {setected = e.Account_Name; });setStateB((){});},child: Container(padding: const EdgeInsets.all(5.0),color: (e.Account_Name == setected)? Colors.blue:Colors.white,margin: const EdgeInsets.all(5.0),child: Text(e.Account_Name),))).toList()),
                      ),
                      );
                    }
                  );
                },
              );
            },
            icon: const Icon(Icons.save))
      ]),
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView.builder(
            itemCount: cartItem.length,
            itemBuilder: (context, index) => Container(
                width: size.width,
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    offset: Offset(0.5, 0.5),
                    blurRadius: 2,
                    color: Colors.black54,
                  )
                ]),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          cartItem[index]["name"],
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        IconButton(onPressed: () {
                          quantity.text =  cartItem[index]["Qty"];
                          rate.text = cartItem[index]["Rate"];
                           showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Container(
                                              padding: const EdgeInsets.all(8.0),
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
                                                              borderSide: const BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  style: BorderStyle
                                                                      .solid)))),
                                                  const SizedBox(
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
                                                              borderSide: const BorderSide(
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
                                                   changeCredients(index);
                                                  },
                                                  child: const Text("Add"))
                                            ],
                                          )); 
                        }, icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              cartItem.remove(cartItem[index]);
                              setState(() {});
                            },
                            icon: const Icon(Icons.remove))
                      ]),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Quantity : ${cartItem[index]["Qty"]}'),
                      Text('Rate : ${cartItem[index]["Rate"]}'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Amount '),
                      Text(cartItem[index]["Amount"].toString()),
                    ],
                  ),
                ])),
          )),
                    bottomSheet: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,children: [const Text("Amount"),Text(total.toString())],),

    );
  }
}
