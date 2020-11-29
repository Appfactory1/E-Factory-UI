import 'package:app_shoe_shop/models/job.dart';

class Worker {
  String name;
  String phone;
  String address;
  //List<Job> jobs;

  Worker({this.name, this.phone, this.address /*this.jobs*/});

  Worker.fromMap(Map snapshot)
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
