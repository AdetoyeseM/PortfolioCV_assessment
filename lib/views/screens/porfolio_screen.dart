import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfolio_cv_assessment/views/constants/colors/colors.dart';
import 'package:portfolio_cv_assessment/views/constants/text_decorations/text_decoration.dart';
import 'package:portfolio_cv_assessment/views/widgets/projects_slider.dart';
import 'package:portfolio_cv_assessment/views/widgets/social_icons.dart';
import 'package:portfolio_cv_assessment/views/widgets/url_launchers.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 17),
          child: CustomScrollView(
            slivers: <Widget>[
              // SliverAppBar for the header section
              SliverAppBar(
                backgroundColor: PorfolioColorsDark.backgroundColor,
                expandedHeight: 350, // Adjust the height as needed
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      // Background image
                      Image.asset("assets/images/pc.jpg"),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            FeatherIcons.codepen,
                            size: 62,
                          ),
                          Text(
                            "ADETOYESE\nMATTHEW",
                            style: appTextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.w600,
                                color: PorfolioColorsDark.white),
                          ),
                          Container(
                            height: 12,
                            width: 105,
                            color: PorfolioColorsDark.blue_600,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          // Social icons and links
                          Row(
                            children: [
                              SocialICons(
                                  onTap: () {
                                    UrILauncher().launchInBrowser(Uri.parse(
                                        "https://www.linkedin.com/in/adetoyesematthew/"));
                                  },
                                  icon: FeatherIcons.linkedin),
                              SocialICons(
                                  onTap: () {
                                    UrILauncher().launchEmail(
                                        "adetoyesematthew97@gmail.com");
                                  },
                                  icon: FeatherIcons.mail),
                              SocialICons(
                                  onTap: () {
                                    UrILauncher().launchInBrowser(Uri.parse(
                                        "https://github.com/AdetoyeseM"));
                                  },
                                  icon: FeatherIcons.github),
                              SocialICons(
                                  onTap: () {
                                    UrILauncher().launchCall("+2347067571842");
                                  },
                                  icon: FeatherIcons.phoneCall),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // SliverList for the content section
              SliverList(
                delegate: SliverChildListDelegate([
                  Text(
                    "- meet.me()",
                    style: appTextStyle(color: PorfolioColorsDark.white),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "I'm a Mobile App developer with a strong passion and enthusiasm for designing, building great products, Applications, and providing optimal educational solutions. Addicted to managing and developing projects/Apps with cool UI/UX, clean codes, and best practices...",
                    textAlign: TextAlign.left,
                    style: appTextStyle(
                        color: PorfolioColorsDark.white, fontSize: 28),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          side: const BorderSide(
                              color: Colors
                                  .white), // Set the border color to white
                        ),
                      ),
                    ),
                    onPressed: () {
                      UrILauncher().launchInBrowser(Uri.parse(
                          "https://drive.google.com/file/d/1d3-wfrpjg_57x-o09iYoo7xvVMrOhDoK/view?usp=sharing"));
                    },
                    icon: const Icon(FeatherIcons.externalLink),
                    label: const Text("View Resume"),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Recent Projects",
                    textAlign: TextAlign.left,
                    style: appTextStyle(
                        color: PorfolioColorsDark.white, fontSize: 28),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Widget to display recent projects
                  ProjectSlider(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
