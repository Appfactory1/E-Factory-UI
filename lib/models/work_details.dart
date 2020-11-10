import 'package:app_shoe_shop/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WorkDetail {
  String name;
  String job;
  String address;
  String description;

  WorkDetail({this.name, this.job, this.address, this.description});

  static List<WorkDetail> workerDetails = [
    WorkDetail(
      name: 'Name',
      job: "Variable Price",
      address:
          "ed tempor elit et faucibus sagittis. Integer et mollis velit. Nunc vel elit facilisis, porttitor erat id, b.",
      description:
          'Sed tempor elit et faucibus sagittis. Integer et mollis velit. Nunc vel elit facilisis, porttitor erat id, blandit dui. Sed posuere iaculis tempor. Etiam elementum turpis sapien, et rutrum ligula eleifend vitae',
    ),
    WorkDetail(
      name: 'Name',
      job: "Rs. 700-850",
      address:
          "ed tempor elit et faucibus sagittis. Integer et mollis velit. Nunc vel elit facilisis, porttitor erat id.",
      description:
          'Sed tempor elit et faucibus sagittis. Integer et mollis velit. Nunc vel elit facilisis, porttitor erat id, blandit dui. Sed posuere iaculis tempor. Etiam elementum turpis sapien, et rutrum ligula eleifend vitae',
    ),
    WorkDetail(
      name: 'Name',
      job: "Rs. 1000-1200",
      address:
          "ed tempor elit et faucibus sagittis. Integer et mollis velit. Nunc vel elit facilisis, porttitor erat id, b",
      description:
          'Sed tempor elit et faucibus sagittis. Integer et mollis velit. Nunc vel elit facilisis, porttitor erat id, blandit dui. Sed posuere iaculis tempor. Etiam elementum turpis sapien, et rutrum ligula eleifend vitae',
    ),
    WorkDetail(
      name: 'Name',
      job: "Variable Price",
      address:
          "ed tempor elit et faucibus sagittis. Integer et mollis velit. Nunc vel elit facilisis, porttitor erat id.",
      description:
          'Sed tempor elit et faucibus sagittis. Integer et mollis velit. Nunc vel elit facilisis, porttitor erat id, blandit dui. Sed posuere iaculis tempor. Etiam elementum turpis sapien, et rutrum ligula eleifend vitae',
    )
  ];
}
