import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfolio_cv_assessment/initialize_singletons.dart';
import 'package:portfolio_cv_assessment/models/all_users_model.dart';
import 'package:portfolio_cv_assessment/services/github/github_request.dart';
import 'package:portfolio_cv_assessment/views/constants/colors/colors.dart';
import 'package:portfolio_cv_assessment/views/constants/text_decorations/text_decoration.dart';
import 'package:portfolio_cv_assessment/views/widgets/users_card.dart';

class GithubUsers extends StatelessWidget {
  const GithubUsers({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch GitHub users data
    GitHubUsersRequest.fetchAllUsers();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Github Users",
              style: appTextStyle(color: PorfolioColorsDark.white),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(FeatherIcons.github)
          ],
        ),
        backgroundColor: PorfolioColorsDark.backgroundColor,
      ),
      body: SafeArea(
        top: true,
        child: StreamBuilder<List<AllUsersModel>>(
            stream: $githubUsers.allUsers,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }

              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return UsersCard(
                    allUsersModel: snapshot.data![index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    height: 3,
                  );
                },
                itemCount: snapshot.data!.length,
              );
            }),
      ),
    );
  }
}
