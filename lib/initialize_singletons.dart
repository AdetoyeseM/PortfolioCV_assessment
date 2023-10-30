import 'package:get_it/get_it.dart';
import 'package:portfolio_cv_assessment/services/github/github_bloc.dart';
import 'package:portfolio_cv_assessment/services/sign_in/sign_in_bloc.dart';

GetIt locator = GetIt.asNewInstance();

initializeSingletons() {
  locator.registerLazySingleton(() => SignINBLoc());
  locator.registerLazySingleton(() => GitHubUsersBloc());
}

SignINBLoc get $signIn => locator.get<SignINBLoc>();
GitHubUsersBloc get $githubUsers => locator.get<GitHubUsersBloc>();
