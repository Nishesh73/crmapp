
class CustomerModel {
  final String gender;

  final String fullName;
  final String email;
  final String? phone;
  final String? cell;
  final String? city;
  final String? state;
  final String? country;
  final String profilePicture;

  CustomerModel(
      {required this.gender,
      required this.fullName,
      required this.email,
       this.phone,
     this.cell,
      this.city,
       this.state,
       this.country,
      required this.profilePicture});

  static CustomerModel fromJson(Map data) {
    return CustomerModel(
      gender: data["gender"],
      fullName: "${data["name"]["first"]} ${data["name"]["last"]}",
      email: data["email"],
      phone: data["phone"],
      cell: data["cell"],
      city: data["location"]["city"],
      state: data["location"]["state"],
      country: data['location']['country'],
      profilePicture: data['picture']['large'],


    );
  }
}
