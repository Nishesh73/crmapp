import 'package:crm_app/data/customer_model/customer_model.dart';
import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class CustomerModelHive {
  @HiveField(0)
  final String gender;

  @HiveField(1)
  final String fullName;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String profilePicture;

  CustomerModelHive(
      {required this.gender,
      required this.fullName,
      required this.email,
      required this.profilePicture});

  static CustomerModelHive fromJson(CustomerModel customerModel) {
    return CustomerModelHive(
      gender: customerModel.gender,
      fullName: customerModel.fullName,
      email: customerModel.email,
      profilePicture: customerModel.profilePicture,
    );
  }
}
