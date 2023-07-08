// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final num RowId;
  final String Item_Name;
  final num VATTAX;
  final num VATADDTAX; 
  final num Sales_Rate;
  const Item({
    required this.RowId,
    required this.Item_Name,
    required this.VATTAX,
    required this.VATADDTAX,
    required this.Sales_Rate,
  });

  @override
  List<Object> get props {
    return [
      RowId,
      Item_Name,
      VATTAX,
      VATADDTAX,
      Sales_Rate,
    ];
  }

  Item copyWith({
    num? RowId,
    String? Item_Name,
    String? HSNNO,
    num? VATTAX,
    num? VATADDTAX,
    num? Sales_Rate,
  }) {
    return Item(
      RowId: RowId ?? this.RowId,
      Item_Name: Item_Name ?? this.Item_Name,
      VATTAX: VATTAX ?? this.VATTAX,
      VATADDTAX: VATADDTAX ?? this.VATADDTAX,
      Sales_Rate: Sales_Rate ?? this.Sales_Rate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'RowId': RowId,
      'Item_Name': Item_Name,
      'VATTAX': VATTAX,
      'VATADDTAX': VATADDTAX,
      'Sales_Rate': Sales_Rate,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      RowId: map['RowId'] as num,
      Item_Name: map['Item_Name'] as String,
      VATTAX: map['VATTAX'] as num,
      VATADDTAX: map['VATADDTAX'] as num,
      Sales_Rate: map['Sales_Rate'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
