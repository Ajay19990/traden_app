import 'package:flutter/material.dart';
import 'package:traden_app/models/service.dart';

class ServiceDetailPage extends StatefulWidget {
  final Service _service;

  ServiceDetailPage(this._service);

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SERVICE INFO'),
        centerTitle: false,
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}
