import 'package:flutter/material.dart';
import 'package:yew_tec_interview_project/service/service.dart';

import '../model/order.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order> orders = [];
  final Service _service = Service();
  @override
  void initState() {
    super.initState();
    _service.getOrders().then((value) {
      setState(() {
        orders = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Order Page")),
      body: (orders.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: orders.length,
              itemBuilder: (context, index) => Container(
                width: size.width,
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.only(bottom: 8.0),
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
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
                          orders[index].Account_Name,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.deepOrange),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios))
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Order_No : ${orders[index].Bill_No}'),
                        Text('Total Amount : ${orders[index].Total_Amount}'),
                        Text('Date : ${orders[index].Bill_DateddMMyyyy}')
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
