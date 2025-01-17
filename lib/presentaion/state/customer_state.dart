import 'package:crm_app/data/customer_model/custome_model_hive.dart';
import 'package:crm_app/data/customer_model/customer_model.dart';
import 'package:crm_app/data/remote_source.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CustomerProvider extends ChangeNotifier {
  List<CustomerModel> _customers = [];

//getter for getting _customers list
  get customers => _customers;

  fetchCustomers() async {
    try {
      var box = await Hive.openBox("customerBox");
      List<CustomerModelHive> custHive;

      if (box.isEmpty) {
        List<CustomerModel>? customerData =
            await RemoteSource().fetchRemoteData();
        print("customers data is $customerData");

        custHive = customerData!.map((customerMode) {
          return CustomerModelHive.fromJson(customerMode);
        }).toList();

        for (var i in custHive) {
          await box.add(i);
        }

        _customers = customerData;
      } else {
        List<CustomerModelHive> hiveData =
            box.values.cast<CustomerModelHive>().toList();

        _customers = hiveData.map((hived) {
          return CustomerModel(
              gender: hived.gender,
              fullName: hived.fullName,
              email: hived.email,
              profilePicture: hived.profilePicture);
        }).toList();
      }

      notifyListeners();
    } catch (e) {}
  }

//method to add new customer in inside list variable _customers and save it in Hive database
  addCustomer(CustomerModel customerModel) async {
    var box = await Hive.openBox("customerBox");
    await box.add(customerModel);

    _customers.add(customerModel);
    notifyListeners();
  }

//method to update new customer in inside list variable _customers and update it in Hive database
  updateCustomer(CustomerModel newCustomer, int index) async {
    var box = await Hive.openBox("customerBox");
    await box.putAt(index, CustomerModelHive.fromJson(newCustomer));

    _customers[index] = newCustomer;
    notifyListeners();
  }

//method to delete new customer in inside list variable _customers and delete it from Hive database
  deleteCustomer(int index) async {
    var box = await Hive.openBox("customerBox");
    await box.deleteAt(index);

    _customers.removeAt(index);
    notifyListeners();
  }
}
