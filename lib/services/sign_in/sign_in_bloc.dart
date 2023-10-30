import 'package:portfolio_cv_assessment/services/validations/validations.dart';
import 'package:rxdart/rxdart.dart';

class SignINBLoc with FieldValidations {
  final BehaviorSubject<String> _password = BehaviorSubject<String>();
  Stream<String> get password => _password.stream.transform(passwordValidation);
  addPassword(String? p) => _password.sink.add(p!);

  final BehaviorSubject<String> _email = BehaviorSubject<String>();
  Stream<String> get email => _email.stream.transform(emailValidation);
  addEmail(String? e) => _email.sink.add(e!);

  // Combine password and email streams to check if both are completed
  Stream<bool> get completed => Rx.combineLatest(
        [
          password,
          email,
        ],
        (values) {
          return values.every((value) => value.isNotEmpty);
        },
      );

  // Get the values of password and email as a map
  Map<String, String?> get body => {
        "password": _password.value,
        "email": _email.value,
      };
}
