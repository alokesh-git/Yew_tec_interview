import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yew_tec_interview_project/model/order.dart';
import '../model/account.dart';
import '../model/items.dart';

class Service {
  Future<List<Item>> getItems() async {
    List<Item> items = [];
    try {
      http.Response res = await http.post(
          Uri.parse("http://genaccapp.yewtec.com/api/item/getitems"),
          body: {"yearid": "1", "compid": "11"});
      var data = await jsonDecode(res.body)["data"]["accountmaster"];
      for (var element in data) {
        items.add(Item.fromMap(element));
      }
      return items;
    } catch (e) {
      print(e.toString());
    }
    return items;
  }

  Future<List<Account>> getAccount() async {
    List<Account> items = [];
    try {
      http.Response res = await http.post(
          Uri.parse("http://genaccapp.yewtec.com/api/account/getaccounts"),
          body: {"yearid": "1", "compid": "11"});
      var data = await jsonDecode(res.body)["data"]["accountmaster"];
      for (var element in data) {
        items.add(Account.fromMap(element));
      }
      return items;
    } catch (e) {
      print(e.toString());
    }
    return items;
  }

  Future<String> postAccount(num id, num total) async {
    String items = "404";
    try {
      http.Response res = await http.post(
          Uri.parse("http://genaccapp.yewtec.com/api/order/addorder"),
          body: jsonEncode({
            "ordermaster": {
              "RowId": 1,
              "Account_Id": 1.00,
              "Total_Amount": 20.00,
              "NetAmount": 7250.00,
              "yearid": 1.0,
              "compid": 1.0,
              "ordertrans": [
                {
                  "Item_Id": 69,
                  "Qty": 10.0000,
                  "Rate": 50.000000,
                  "Amount": 500.00,
                  "Unit_Id": 30.0
                },
                {
                  "Item_Id": 273.00,
                  "Qty": 150.0000,
                  "Rate": 45.000000,
                  "Amount": 6750.00,
                  "Unit_Id": 30.0
                }
              ]
            }
          }));
      var data = await jsonDecode(res.body);
      if (data != null) {
        return data;
      }
    } catch (e) {
      print(e.toString());
    }
    return items;
  }

  Future<List<Order>> getOrders() async {
    List<Order> items = [];
    try {
      http.Response res = await http.post(
          Uri.parse("http://genaccapp.yewtec.com/api/order/getordermaster"),
          body: {"yearid": "1", "compid": "11"});
      var data = await jsonDecode(res.body)["data"]["ordermaster"];
      for (var element in data) {
        items.add(Order.fromMap(element));
      }
      return items;
    } catch (e) {
      print(e.toString());
    }
    return items;
  }
}
