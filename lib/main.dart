import 'package:crm_app/data/customer_model/customer_model_hive.dart';
import 'package:crm_app/presentaion/home_page.dart';
import 'package:crm_app/presentaion/state/customer_state.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize hive
  await Hive.initFlutter();

  // Register the adapter
  Hive.registerAdapter(CustomerModelHiveAdapter());

//reference the hive box
  await Hive.openBox<CustomerModelHive>('customerBox');

  runApp(ChangeNotifierProvider(
      create: (context) => CustomerProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CRM App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
