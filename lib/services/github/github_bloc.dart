import 'package:portfolio_cv_assessment/models/all_users_model.dart';
import 'package:portfolio_cv_assessment/models/user_profile_model.dart';
import 'package:rxdart/rxdart.dart';

class GitHubUsersBloc {
  final BehaviorSubject<List<AllUsersModel>> _allUsers =
      BehaviorSubject<List<AllUsersModel>>.seeded(
          []); // Create a stream of AllUsersModel

  final BehaviorSubject<UserProfileModel> _allUsersProfile = BehaviorSubject<
      UserProfileModel>(); // Create a stream of UserProfileModel

  Stream<List<AllUsersModel>> get allUsers =>
      _allUsers.stream; // Expose the AllUsersModel stream
  addAllUsers(List<AllUsersModel>? e) =>
      _allUsers.sink.add(e!); // Add data to the AllUsersModel stream

  Stream<UserProfileModel> get usersProfile =>
      _allUsersProfile.stream; // Expose the UserProfileModel stream
  allUserProfile(UserProfileModel? e) =>
      _allUsersProfile.sink.add(e!); // Add data to the UserProfileModel stream

  dispose() {
    _allUsers.close(); // Close the AllUsersModel stream when done
    _allUsersProfile.close(); // Close the UserProfileModel stream when done
  }
}
