// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final num RowId;
  final String Account_Name;
  const Account({
    required this.RowId,
    required this.Account_Name,
  });

  @override
  List<Object> get props => [RowId, Account_Name];

  Account copyWith({
    num? RowId,
    String? Account_Name,
  }) {
    return Account(
      RowId: RowId ?? this.RowId,
      Account_Name: Account_Name ?? this.Account_Name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'RowId': RowId,
      'Account_Name': Account_Name,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      RowId: map['RowId'] as num,
      Account_Name: map['Account_Name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) => Account.fromMap(json.decode(source) as Map<String, dynamic>);
}
