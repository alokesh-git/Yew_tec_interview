// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String Account_Name;
  final int Bill_No;
  final num Total_Amount;
  final String Bill_DateddMMyyyy;
  const Order({
    required this.Account_Name,
    required this.Bill_No,
    required this.Total_Amount,
    required this.Bill_DateddMMyyyy,
  });

  Order copyWith({
    String? Account_Name,
    int? Bill_No,
    num? Total_Amount,
    String? Bill_DateddMMyyyy,
  }) {
    return Order(
      Account_Name: Account_Name ?? this.Account_Name,
      Bill_No: Bill_No ?? this.Bill_No,
      Total_Amount: Total_Amount ?? this.Total_Amount,
      Bill_DateddMMyyyy: Bill_DateddMMyyyy ?? this.Bill_DateddMMyyyy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Account_Name': Account_Name,
      'Bill_No': Bill_No,
      'Total_Amount': Total_Amount,
      'Bill_DateddMMyyyy': Bill_DateddMMyyyy,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      Account_Name: map['Account_Name'] as String,
      Bill_No: map['Bill_No'] as int,
      Total_Amount: map['Total_Amount'] as num,
      Bill_DateddMMyyyy: map['Bill_DateddMMyyyy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [Account_Name, Bill_No, Total_Amount, Bill_DateddMMyyyy];
}
