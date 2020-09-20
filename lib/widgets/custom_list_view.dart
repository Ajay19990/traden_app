import 'package:flutter/material.dart';
import 'list_card.dart';
import 'package:traden_app/models/service.dart';
import 'package:traden_app/pages/service_detail.dart';
import 'dart:math';

class CustomList extends StatelessWidget {
  final List<Service> services;
  final Function updateList;

  CustomList({this.services, this.updateList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          int randomImageNumber = 1 + Random().nextInt(10 - 1);
          var service = services[index];
          return Container(
            width: 150,
            child: ListCard(
              imageName: 'assets/image${randomImageNumber.toString()}.jpg',
              title: service.name,
              description: service.shortDescription,
              onTapHandler: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailPage(services[index]),
                  ),
                );
                await updateList();
              },
            ),
          );
        },
      ),
    );
  }
}
