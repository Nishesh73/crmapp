import 'package:crm_app/data/customer_model/customer_model.dart';
import 'package:crm_app/data/remote_source.dart';
import 'package:crm_app/presentaion/state/customer_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RemoteSource? remoteSource;

  @override
  void initState() {
    super.initState();
    // Fetch customers when the page loads
    Provider.of<CustomerProvider>(context, listen: false).fetchCustomers();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   remoteSource = RemoteSource();
  //   callFunction();
  // }

  // callFunction() async {
  //   try {
  //     List<CustomerModel>? data = await remoteSource?.fetchRemoteData();
  //   print("data is $data");

  //   } catch (e) {

  //   }

  // }

  @override
  Widget build(BuildContext context) {
    List<CustomerModel> customerList =
        Provider.of<CustomerProvider>(context).customers;

    print("customerlist data is $customerList");
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRM App"),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<CustomerProvider>(context, listen: false)
                    .addCustomer(CustomerModel(gender: "NewAd", fullName: "New name", email: "new Email",
                     profilePicture: 'https://randomuser.me/api/portraits/women/1.jpg'));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: customerList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: customerList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: 
                  NetworkImage(customerList[index].profilePicture),),
                  subtitle: Text(customerList[index].email),
                  title: Text(customerList[index].fullName),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Provider.of<CustomerProvider>(context,
                                    listen: false)
                                .updateCustomer(
                                    CustomerModel(
                                        gender: "Male",
                                        fullName: "Nishesh Gautam",
                                        email: "nishesh@gmail.com",
                                        profilePicture:
                                            'https://randomuser.me/api/portraits/men/1.jpg'),
                                    index);
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            Provider.of<CustomerProvider>(context,
                                    listen: false)
                                .deleteCustomer(index);
                          },
                          icon: const Icon(Icons.delete)),
                    ],
                  ),
                );
              }),
    );
  }
}
