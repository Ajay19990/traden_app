import 'package:flutter/material.dart';
import 'list_card.dart';
import 'package:traden_app/models/service.dart';
import 'package:traden_app/utilities/helper_functions.dart';
import 'package:traden_app/pages/service_detail.dart';

class CustomList extends StatelessWidget {
  final List<Service> services;

  CustomList({this.services});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          var service = services[index];
          return Container(
            width: 170,
            child: ListCard(
              imageName: 'assets/carousel1.png',
              title: service.name,
              description: service.shortDescription,
              onTapHandler: () {
                pushScreen(context, ServiceDetailPage(services[index]));
              },
            ),
          );
        },
      ),
    );
  }
}
