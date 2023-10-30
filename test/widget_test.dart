import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_cv_assessment/initialize_singletons.dart';
import 'package:portfolio_cv_assessment/models/user_profile_model.dart';
import 'package:portfolio_cv_assessment/services/github/github_bloc.dart';
import 'package:portfolio_cv_assessment/services/sign_in/sign_in_bloc.dart';
import 'package:portfolio_cv_assessment/views/screens/login_screen.dart';

void main() {
  initializeSingletons();
  testWidgets('Widget Tests', (WidgetTester tester) async {
    final signInBloc = SignINBLoc();
    final githubUsersBloc = GitHubUsersBloc();

    // Widget Test for Sign In Form
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SignIN(),
      ),
    ));

    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final signInButton = find.byKey(const Key('signInButton'));

    await tester.enterText(emailField, 'testmail@gmail.com');
    await tester.enterText(passwordField, 'Password1234@');
    expect(find.text('testmail@gmail.com'), findsOneWidget);
    expect(find.text('Password1234@'), findsOneWidget);
    await tester.tap(signInButton);

    // Widget Test for GitHubUsersBloc
    final sampleUserProfileModel = UserProfileModel();
    githubUsersBloc.allUserProfile(sampleUserProfileModel);

    await tester.pumpWidget(MaterialApp(
      home: StreamBuilder<UserProfileModel>(
        stream: githubUsersBloc.usersProfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.toString());
          }
          return Container();
        },
      ),
    ));

    expect(find.text(sampleUserProfileModel.toString()), findsOneWidget);
  });
}
