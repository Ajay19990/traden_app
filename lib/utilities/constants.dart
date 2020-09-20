import 'package:traden_app/widgets/onboarding_card.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

var carouselItems = [
  OnBoardingCard(
    title: 'Find services near you',
    imagePath: 'assets/carousel1.png',
    description:
        'Search for local and international services and browse different categories',
  ),
  OnBoardingCard(
    title: 'Customize your needs',
    imagePath: 'assets/carousel2.png',
    description: 'Ask for what you want through our instant customised request',
  ),
  OnBoardingCard(
    title: 'Communicate instantly',
    imagePath: 'assets/carousel3.png',
    description: 'No need to wait and communicate with service providers instantly',
  ),
];

final storage = new FlutterSecureStorage();
