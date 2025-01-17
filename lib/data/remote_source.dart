import 'dart:convert';
import 'package:crm_app/data/customer_model/customer_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RemoteSource {
  // CustomerModel? customerModel;

  Future<List<CustomerModel>?> fetchRemoteData() async {
    try {
      Response response =
          await http.get(Uri.parse("https://randomuser.me/api/?results=10"));

      List<CustomerModel> customerData = [];
      if (response.statusCode == 200) {
        var mapData = jsonDecode(response.body);
        List<dynamic> listData = mapData["results"];

        // print("listData is $listData");

        customerData = listData.map((data) {
          return CustomerModel.fromJson(data);
        }).toList();
      }

      // print("customerdata is $customerData");

      return customerData;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
