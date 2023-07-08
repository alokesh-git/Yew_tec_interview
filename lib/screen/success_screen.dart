// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yew_tec_interview_project/screen/order_screen.dart';

class SeccessScreen extends StatefulWidget {
  const SeccessScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SeccessScreen> createState() => _SeccessScreenState();
}

class _SeccessScreenState extends State<SeccessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderScreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Text("Wait for 3 Second ,Successfully",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),)),
    );
  }
}
