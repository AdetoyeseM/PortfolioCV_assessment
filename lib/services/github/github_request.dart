import 'package:portfolio_cv_assessment/initialize_singletons.dart';
import 'package:portfolio_cv_assessment/main.dart';
import 'package:portfolio_cv_assessment/models/all_users_model.dart';
import 'package:portfolio_cv_assessment/models/user_profile_model.dart';
import 'package:portfolio_cv_assessment/services/network_constant/base_url.dart';
import 'package:portfolio_cv_assessment/services/network_constant/http_services.dart';
import 'package:portfolio_cv_assessment/services/network_constant/network_constants.dart';
import 'package:portfolio_cv_assessment/views/widgets/progress_indicator.dart';

class GitHubUsersRequest {
  // Fetch all GitHub users and store them in the stream
  static fetchAllUsers() async {
    List<AllUsersModel>? allUsers;
    var url = API.users;
    ApiResponse response = await HttpService().get(url: url);

    if (response.statusCode == 200) {
      allUsers = response.data['items'].map<AllUsersModel>((e) {
        return AllUsersModel.fromJson(e);
      }).toList();
      $githubUsers.addAllUsers(allUsers); // Add users to the stream
    } else {
      // Display an error dialog if the request fails
      showErrorDialog(navigatorKey!.currentContext!, "Something Went Wrong",
          "error", "Retry", () {
        hideProgressIndicator(navigatorKey!.currentContext!);
      });
    }
  }

  // Fetch user profile and store it in the stream
  fetchusersProfile(String? username) async {
    UserProfileModel? userProfileModel;
    var url = API.userProfile(username);
    ApiResponse response = await HttpService().get(url: url);
    if (response.statusCode == 200) {
      userProfileModel = UserProfileModel.fromJson(response.data);

      $githubUsers
          .allUserProfile(userProfileModel); // Add user profile to the stream
    } else {
      // Display an error dialog if the request fails
      showErrorDialog(navigatorKey!.currentContext!, "Something Went Wrong",
          "error", "Retry", () {
        hideProgressIndicator(navigatorKey!.currentContext!);
      });
    }
  }
}
