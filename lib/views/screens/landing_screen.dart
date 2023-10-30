import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfolio_cv_assessment/views/constants/colors/colors.dart';
import 'package:portfolio_cv_assessment/views/constants/text_decorations/text_decoration.dart';
import 'package:portfolio_cv_assessment/views/screens/github_users.dart';
import 'package:portfolio_cv_assessment/views/screens/porfolio_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Widget>? body;
  int? index = 0;

  @override
  void initState() {
    super.initState();
    body = [const PortfolioScreen(), const GithubUsers()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        elevation: 0,
        currentIndex: index!,
        type: BottomNavigationBarType.fixed,
        backgroundColor: PorfolioColorsDark.backgroundColor,
        unselectedLabelStyle:
            appTextStyle(color: PorfolioColorsDark.white, fontSize: 8),
        selectedFontSize: 8,
        unselectedFontSize: 8,
        selectedItemColor: Colors.white,
        selectedLabelStyle:
            appTextStyle(color: PorfolioColorsDark.white, fontSize: 8),
        items: [
          buildBottomNavigationBarItem(
            label: "Portfolio",
            icon: FeatherIcons.userX,
            itemIndex: 0,
          ),
          buildBottomNavigationBarItem(
            label: "GitHub",
            icon: FeatherIcons.github,
            itemIndex: 1,
          ),
        ],
      ),
      body: body!.elementAt(index!),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String label,
    required IconData icon,
    required int itemIndex,
  }) {
    final isActive = index == itemIndex;
    final iconColor = isActive ? Colors.white : PorfolioColorsDark.grey_400;

    return BottomNavigationBarItem(
      label: label,
      icon: Icon(icon, color: iconColor),
    );
  }
}
