import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traden_app/models/category.dart';
import 'package:traden_app/services/network_helper.dart';
import 'package:traden_app/widgets/home_tab_view.dart';
import 'package:traden_app/utilities/constants.dart';
import 'package:traden_app/models/service.dart';
import 'package:traden_app/widgets/search_tab_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabBarController;
  List<Service> _allServices;
  List<Service> _followingServices;
  List<Category> _categories;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: 3, vsync: this);
    fetchServiceList();
  }

  void handleFollowingServices(services, String error) {
    setState(() {
      _followingServices = services;
    });
  }

  void fetchServiceList() async {
    setState(() {
      isLoading = true;
    });
    var token = await storage.read(key: 'token');
    await NetworkHelper.getServiceList(
      Path.allServices,
      token,
      handleAllServices,
    );
    await NetworkHelper.getServiceList(
      Path.followingServices,
      token,
      handleFollowingServices,
    );
    await NetworkHelper.getCategoryList(token, handleCategories);
    setState(() {
      isLoading = false;
    });
  }

  void handleCategories(categories, String error) {
    setState(() {
      _categories = categories;
    });
  }

  void handleAllServices(services, String error) {
    setState(() {
      _allServices = services;
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
                HomeTabView(
                  allServices: _allServices,
                  followingServices: _followingServices,
                  updateList: fetchServiceList,
                ),
                SearchTabView(categories: _categories),
                Container(),
              ],
              controller: _tabBarController,
            ),
    );
  }
}
