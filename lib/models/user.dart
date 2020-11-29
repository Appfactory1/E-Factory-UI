import 'package:app_shoe_shop/models/job.dart';

class User {
  String name;
  String phone;
  String address;
  //List<Job> jobs;

  User({
    this.name,
    this.phone,
    this.address,
    /*this.jobs*/
  });

  User.fromMap(Map snapshot)
      : name = snapshot['name'] ?? '',
        phone = snapshot['phone'] ?? '',
        address = snapshot['address'] ?? '';
  //jobs = snapshot['jobs'] ?? '';

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "adress": address,
    };
  }
}
