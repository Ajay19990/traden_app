import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traden_app/services/network_helper.dart';
import 'package:traden_app/widgets/home_tab_view.dart';
import 'package:traden_app/utilities/constants.dart';
import 'package:traden_app/models/service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabBarController;
  List<Service> _services;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: 3, vsync: this);
    fetchServiceList();
  }

  void fetchServiceList() async {
    setState(() {
      isLoading = true;
    });
    var token = await storage.read(key: 'token');
    await NetworkHelper.allServices(token, handleServices);
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HSR Layout, Bangalore', style: TextStyle(fontSize: 16)),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigoAccent,
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          tabs: [
            Tab(icon: ImageIcon(AssetImage('assets/side_home.png'))),
            Tab(icon: Icon(CupertinoIcons.search)),
            Tab(icon: Icon(CupertinoIcons.bell)),
          ],
          controller: _tabBarController,
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : TabBarView(
              children: [
                HomeTabView(services: _services),
                Text("This is chat Tab View"),
                Text("This is notification Tab View"),
              ],
              controller: _tabBarController,
            ),
    );
  }
}
