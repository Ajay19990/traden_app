import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:traden_app/models/service.dart';
import 'package:traden_app/utilities/constants.dart';
import 'package:traden_app/widgets/custom_card_indicator.dart';
import 'package:traden_app/widgets/rating_icons.dart';
import 'package:traden_app/widgets/service_detail_button.dart';
import 'package:traden_app/services/network_helper.dart';
import 'package:traden_app/utilities/helper_functions.dart';

class ServiceDetailPage extends StatefulWidget {
  final Service _service;

  ServiceDetailPage(this._service);

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  var _currentIndex = 0;
  var rating = 0;

  void followService() async {
    var token = await storage.read(key: 'token');
    NetworkHelper.follow(
      token: token,
      id: widget._service.id,
      completion: handleFollow,
    );
  }

  void handleFollow(bool success, String message) {
    if (success) {
      showAlert(context: context, message: message, title: 'Success');
    } else {
      showAlert(context: context, message: message, title: 'Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SERVICE INFO'),
        centerTitle: false,
        backgroundColor: Colors.indigoAccent,
        automaticallyImplyLeading: false,
        leading: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context, 'pop');
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 25.0,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  items: serviceDetailImages,
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    height: MediaQuery.of(context).size.height * 0.309,
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              CustomCardIndicator(
                currentIndex: _currentIndex,
                items: serviceDetailImages,
              ),
              SizedBox(height: 10),
              Text(
                widget._service.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 5),
              Text(
                'By ${widget._service.providerFirstName}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RatingWidget(widget._service.rating),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage('assets/price.png'),
                    color: Colors.indigoAccent[400],
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Starting from:',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'AED 50',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[600],
                      fontSize: 13.5,
                      letterSpacing: 0.2,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[350]),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServiceDetailButton(imageName: 'see_reviews', title: 'See Reviews'),
                    ServiceDetailButton(
                      imageName: 'following_selected',
                      title: 'Follow',
                      onTap: followService,
                    ),
                    ServiceDetailButton(imageName: 'share', title: 'Share'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text('ABOUT', style: Theme.of(context).textTheme.bodyText1),
              ),
              Text(mockText, style: Theme.of(context).textTheme.headline3),
            ],
          ),
        ),
      ),
    );
  }
}
