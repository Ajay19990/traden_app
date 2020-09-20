import 'package:flutter/material.dart';
import 'package:traden_app/models/category.dart';
import 'package:traden_app/models/service.dart';
import 'package:traden_app/pages/service_detail.dart';
import 'package:traden_app/services/network_helper.dart';
import 'package:traden_app/utilities/constants.dart';
import 'package:traden_app/widgets/list_card.dart';
import 'dart:math';

class CategoryServicesList extends StatefulWidget {
  final Category category;

  CategoryServicesList({this.category});

  @override
  _CategoryServicesListState createState() => _CategoryServicesListState();
}

class _CategoryServicesListState extends State<CategoryServicesList> {
  List<Service> _services;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getServices();
  }

  void getServices() async {
    setState(() {
      isLoading = true;
    });
    var token = await storage.read(key: 'token');
    await NetworkHelper.getServiceListByCategory(
      token: token,
      id: widget.category.id,
      completion: handleServices,
    );
    setState(() {
      isLoading = false;
    });
  }

  void handleServices(services, String error) {
    setState(() {
      _services = services;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        centerTitle: false,
        backgroundColor: Colors.indigoAccent,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
              ),
              itemCount: _services.length,
              itemBuilder: (buildContext, index) {
                int randomImageNumber = 2 + Random().nextInt(10 - 2);
                var service = _services[index];
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListCard(
                    imageName: 'assets/image${randomImageNumber.toString()}.jpg',
                    title: service.name,
                    description: service.shortDescription,
                    onTapHandler: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailPage(_services[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
