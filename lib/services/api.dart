import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_food/services/json_data.dart';

class ApiProvider{

  Future<List<TableMenuList>> getData() async {
    var jsonResponse = await http.get(
      Uri.parse(
          'https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad'),
    );

    //List order = orderFromJson(jsonResponse.body);


    //final order = json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
    final order = orderFromJson(jsonResponse.body);
    //final order = json.decode(jsonResponse.body);
    print(order[0].tableMenuList);
    List tableList = order[0].tableMenuList;
    return tableList;
  }






//   Future<List<Order>> getData() async {
//
//     var jsonResponse = await http.get(
//       Uri.parse(
//           'https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad'),
//     );
//
//     //List order = orderFromJson(jsonResponse.body);
//
//
//     //final order = json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
//     final order = orderFromJson(jsonResponse.body);
//     //final order = json.decode(jsonResponse.body);
//     print(order);
//     return order;
//
//     //List orderList =  order.map<Order>((json) => Order.fromJson(json)).toList();
//     // print (orderList);
//     // return orderList;
//
//
//     final newData = json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
//    // final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//     return newData.map<Order>((json) => Order.fromJson(json)).toList();
//
//     // Order order = Order.fromJson(newData);
//     print(order.toString());
//     print(order);
//     return order;
//   }

}

