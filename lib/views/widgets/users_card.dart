import 'package:flutter/material.dart';
import 'package:portfolio_cv_assessment/models/all_users_model.dart';
import 'package:portfolio_cv_assessment/views/constants/colors/colors.dart';
import 'package:portfolio_cv_assessment/views/constants/text_decorations/text_decoration.dart';

class UsersCard extends StatelessWidget {
  const UsersCard({super.key, this.allUsersModel});

  final AllUsersModel? allUsersModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          width: double.infinity,
          child: ListTile(
            // isThreeLine: true,
            contentPadding: const EdgeInsets.all(0),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Score",
                  style: appTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: PorfolioColorsDark.white),
                ),
                Text(
                  allUsersModel!.score.toString(),
                  style: appTextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: PorfolioColorsDark.white),
                ),
              ],
            ),
            leading: ClipOval(
              child: SizedBox(
                width: 42, // Double the radius for a total diameter of 100
                height: 42, // Double the radius for a total diameter of 100
                child: Image.network(allUsersModel!.avatarUrl!),
              ),
            ),
            title: Text(
              allUsersModel!.login!.toUpperCase(),
              style: appTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: PorfolioColorsDark.white_200),
            ),
            subtitle: Text(
              allUsersModel!.nodeId!,
              style: appTextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: PorfolioColorsDark.grey_400),
            ),
          )),
    );
  }
}
