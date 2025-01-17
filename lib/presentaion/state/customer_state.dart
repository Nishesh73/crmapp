import 'package:crm_app/data/customer_model/customer_model_hive.dart';
import 'package:crm_app/data/customer_model/customer_model.dart';
import 'package:crm_app/data/remote_source.dart';
import 'package:crm_app/domain/customer_exception.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CustomerProvider extends ChangeNotifier {
  List<CustomerModel> _customers = [];

//getter for getting _customers list
  get customers => _customers;

  void fetchCustomers() async {
    try {
      // var box = await Hive.openBox("customerBox");
      var box = await Hive.openBox<CustomerModelHive>('customerBox');
      List<CustomerModelHive> custHive;

      if (box.isEmpty) {
        print("box is empty");
        List<CustomerModel>? customerData =
            await RemoteSource().fetchRemoteData();
        print("customers data is $customerData");

        custHive = customerData!.map((customerMode) {
          return CustomerModelHive.fromJson(customerMode);
        }).toList();

        for (var i in custHive) {
          await box.add(i);
        }

        print("box have values ${box.values.toList()}");

        _customers = customerData;
        notifyListeners();
      } else {
        print("box is not empty");
        List<CustomerModelHive> hiveData =
            box.values.cast<CustomerModelHive>().toList();

        _customers = hiveData.map((hived) {
          return CustomerModel(
              gender: hived.gender,
              fullName: hived.fullName,
              email: hived.email,
              profilePicture: hived.profilePicture);
        }).toList();
        notifyListeners();
      }
    } catch (e) {
      throw CustomerException(e.toString());
      // print("error is occured: $e");
    }
  }

//method to add new customer in inside list variable _customers and save it in Hive database
  void addCustomer(CustomerModel customerModel) async {
    var box = await Hive.openBox<CustomerModelHive>('customerBox');
    await box.add(CustomerModelHive.fromJson(customerModel));

    _customers.add(customerModel);
    notifyListeners();
  }

//method to update new customer in inside list variable _customers and update it in Hive database
  void updateCustomer(CustomerModel newCustomer, int index) async {
    var box = await Hive.openBox<CustomerModelHive>('customerBox');
    await box.putAt(index, CustomerModelHive.fromJson(newCustomer));

    _customers[index] = newCustomer;
    notifyListeners();
  }

//method to delete new customer in inside list variable _customers and delete it  Hive database
  void deleteCustomer(int index) async {
    var box = await Hive.openBox<CustomerModelHive>('customerBox');
    await box.deleteAt(index);

    _customers.removeAt(index);
    notifyListeners();
  }
}
