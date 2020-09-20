import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traden_app/models/service.dart';
import 'package:traden_app/widgets/custom_list_view.dart';

class HomeTabView extends StatelessWidget {
  final List<Service> allServices;
  final List<Service> followingServices;
  final Function updateList;

  HomeTabView({
    this.allServices,
    this.followingServices,
    this.updateList,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ALL SERVICES',
              style: Theme.of(context).textTheme.headline4,
            ),
            CustomList(
              services: allServices,
              updateList: updateList,
            ),
            SizedBox(height: 20),
            Text(
              'FOLLOWING SERVICES',
              style: Theme.of(context).textTheme.headline4,
            ),
            CustomList(
              services: followingServices,
              updateList: updateList,
            ),
            SizedBox(height: 20),
            Text(
              'ALL SERVICES',
              style: Theme.of(context).textTheme.headline4,
            ),
            CustomList(
              services: allServices,
              updateList: updateList,
            ),
          ],
        ),
      ),
    );
  }
}
