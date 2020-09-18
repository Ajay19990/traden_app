import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traden_app/widgets/custom_button.dart';
import 'package:traden_app/utilities/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:traden_app/widgets/custom_card_indicator.dart';
import 'package:traden_app/pages/login_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var currentIndex = 0;
  var carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'TRADENAPP',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider(
                        items: carouselItems,
                        options: CarouselOptions(
                          viewportFraction: 1.0,
                          enableInfiniteScroll: false,
                          height: MediaQuery.of(context).size.height * 0.5,
                          initialPage: 0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                      CustomCardIndicator(currentIndex: currentIndex),
                    ],
                  ),
                ),
              ),
              CustomButton(
                title: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              CustomButton(title: 'Sign up', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
