import 'package:portfolio_cv_assessment/initialize_singletons.dart';
import 'package:portfolio_cv_assessment/views/screens/landing_screen.dart';
import 'package:portfolio_cv_assessment/views/widgets/navigation.dart';
import 'package:portfolio_cv_assessment/views/widgets/progress_indicator.dart';

import '../../main.dart';

// Function to handle the sign-in process
signIn() {
  var email = $signIn.body['email'];
  var password = $signIn.body['password'];
  try {
    if (email == "testmail@gmail.com" && password == "Password1234@") {
      // Navigate to the dashboard if the credentials are correct
      navigateReplaceToPage(const DashBoard());
    } else {
      // Show an error dialog for incorrect email or password
      showErrorDialog(navigatorKey!.currentContext, "Something Went Wrong",
          "Wrong Email or Password", "Retry", () {
        hideProgressIndicator(navigatorKey!.currentState!.overlay!.context);
      });
    }
  } catch (e) {}
}
