import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traden_app/models/service.dart';
import 'package:traden_app/pages/service_detail.dart';
import 'package:traden_app/widgets/custom_list_view.dart';
import 'package:traden_app/utilities/helper_functions.dart';

class HomeTabView extends StatelessWidget {
  final List<Service> services;

  HomeTabView({this.services});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FOLLOWING SERVICES',
            style: Theme.of(context).textTheme.headline5,
          ),
          CustomList(services: services),
        ],
      ),
    );
  }
}
