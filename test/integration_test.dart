import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_cv_assessment/initialize_singletons.dart';
import 'package:portfolio_cv_assessment/models/all_users_model.dart';
import 'package:portfolio_cv_assessment/services/github/github_request.dart';
import 'package:portfolio_cv_assessment/views/screens/login_screen.dart';

void main() {
  testWidgets('Integration Tests', (WidgetTester tester) async {
    initializeSingletons();
    await tester.pumpWidget(const MaterialApp(
      home: SignIN(),
    ));

    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final signInButton = find.byKey(const Key('signInButton'));

    await tester.enterText(emailField, 'testmail@gmail.com');
    await tester.enterText(passwordField, 'Password1234@');
    await tester.tap(signInButton);

    // Wait for the navigation to the dashboard page
    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
    await GitHubUsersRequest.fetchAllUsers();

    expect($githubUsers.allUsers, emits(isA<List<AllUsersModel>>));
  });
}
