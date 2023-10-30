import 'package:flutter/material.dart';
import 'package:portfolio_cv_assessment/initialize_singletons.dart';
import 'package:portfolio_cv_assessment/services/sign_in/sign_in_request.dart';
import 'package:portfolio_cv_assessment/views/constants/colors/colors.dart';
import 'package:portfolio_cv_assessment/views/constants/text_decorations/text_decoration.dart';
import 'package:portfolio_cv_assessment/views/widgets/app_button.dart';
import 'package:portfolio_cv_assessment/views/widgets/app_container.dart';
import 'package:portfolio_cv_assessment/views/widgets/custom_fields.dart';
import 'package:portfolio_cv_assessment/views/widgets/progress_indicator.dart';

class SignIN extends StatelessWidget {
  const SignIN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title for the login screen
              Text(
                "Log in ",
                style: appTextStyle(
                  fontSize: 32,
                  color: PorfolioColorsDark.white,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(
                height: 8.9,
              ),
              // Subtitle for the login screen
              Text(
                "Fill in the form to log in",
                style: appTextStyle(
                  color: PorfolioColorsDark.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Expanded(
                child: ListView(
                  children: [
                    // Container for email and password input fields
                    AppContainer(
                      hP: 16,
                      vP: 22.5,
                      children: [
                        // Email input field
                        PorfolioAppTextField(
                          key: const Key("emailField"),
                          onChanged: $signIn.addEmail,
                          stream: $signIn.email,
                          hint: "Your email",
                          label: "E-mail",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Password input field
                        PasswordField(
                          key: const Key("passwordField"),
                          onchanged: $signIn.addPassword,
                          stream: $signIn.password,
                          useListRequirements: false,
                          hint: "Your Password",
                          label: "Password",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              // Login button
              StreamBuilder<bool>(
                  stream: $signIn.completed,
                  builder: (context3, snapshot) {
                    return CustomButton(
                        key: const Key("signInButton"),
                        enabled: snapshot.data,
                        onTap: () {
                          signIn(); // Perform sign-in action
                        },
                        text: "Login");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
