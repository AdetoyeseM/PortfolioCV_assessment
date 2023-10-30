import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio_cv_assessment/models/project_slider_model.dart';
import 'package:portfolio_cv_assessment/views/widgets/url_launchers.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_cv_assessment/views/constants/colors/colors.dart';
import 'package:portfolio_cv_assessment/views/constants/text_decorations/text_decoration.dart';

class ProjectSlider extends StatelessWidget {
  ProjectSlider({Key? key}) : super(key: key);

  final List<ProjectSliderModel> projects = [
    ProjectSliderModel(
      onTap: () async {
        await UrILauncher().launchInBrowser(Uri.parse(
            "https://play.google.com/store/apps/details?id=com.esusu_africa.fieldcollectors&hl=en&gl=US"));
      },
      title: 'Esusu Field Collector',
      description:
          'A platform to digitize savings thrift savings and collections seamlessly that promotes a secured online and mobile digital banking experience',
      imageUrl: 'assets/images/pc.jpg',
    ),
    ProjectSliderModel(
      onTap: () async {
        await UrILauncher().launchInBrowser(Uri.parse(
            "https://play.google.com/store/apps/details?id=com.mobirevo.kolatree_users_app&hl=en&gl=US"));
      },
      title: 'Kolatree',
      description:
          'Kolatree is a platform that connects builders with suppliers of building materials.',
      imageUrl: 'assets/images/pc.jpg',
    ),
    ProjectSliderModel(
      onTap: () async {
        await UrILauncher().launchInBrowser(Uri.parse(
            "https://play.google.com/store/apps/details?id=com.mobirevo.tradelite&hl=en&gl=US"));
      },
      title: 'Tradelite',
      description:
          'Tradelite, your all-in-one platform for buying and selling Giftcards, airtime and more. Join thousands of satisfied users who trust Tradelite for their digital asset transactions.',
      imageUrl: 'assets/images/pc.jpg',
    ),
    ProjectSliderModel(
      onTap: () async {
        await UrILauncher().launchInBrowser(Uri.parse(
            "https://apps.apple.com/us/app/investnaija/id1579193940"));
      },
      title: 'InvestNaija',
      description:
          'InvestNaija is the all-in-one money app that helps you plan, save, and invest responsibly. With our easy-to-use app, powered by Chapel Hill Denham, you can start your journey to financial independence',
      imageUrl: 'assets/images/pc.jpg',
    ),
    ProjectSliderModel(
      onTap: () async {
        await UrILauncher().launchInBrowser(Uri.parse(
            "https://apps.apple.com/us/app/bridgeorder/id6443728285"));
      },
      title: 'BridgeOrder',
      description:
          'A table ordering and reservation app with a wallet for payment, to make ordering process seamless, convenient and fast.',
      imageUrl: 'assets/images/pc.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        initialPage: 2,
        autoPlay: true,
      ),
      items: projects.map((project) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: project.onTap,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Card(
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          project.imageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        project.title,
                        style: appTextStyle(
                          fontSize: 18.0,
                          color: PorfolioColorsDark.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        project.description,
                        textAlign: TextAlign.center,
                        style: appTextStyle(
                            fontSize: 12.0, color: PorfolioColorsDark.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
