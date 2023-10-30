import 'dart:async';

mixin FieldValidations {
  StreamTransformer<String, String> emailValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.isEmpty ||
        !email.contains(RegExp(
            r"^([a-zA-Z0-9_\-\.+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})([a-zA-Z0-9\+]+)?$"))) {
      sink.addError("Enter a valid email address");
    } else {
      sink.add(email);
    }
  });

  StreamTransformer<String, String> passwordValidation =
      StreamTransformer.fromHandlers(handleData: (password, sink) {
    if (password.isEmpty || password.length < 8) {
      sink.addError("Password Must contain 8 Characters or more");
    } else if (!password.contains(RegExp("^(?=.*[0-9])"))) {
      sink.addError("Password Must Contain at least one number");
    } else if (!password.contains(RegExp("(?=.*[a-z])"))) {
      sink.addError("Password Must contain one Lower case letter");
    } else if (!password.contains(RegExp("(?=.*[A-Z])"))) {
      sink.addError("Password Must contain one Upper case letter");
    } else if (!password.contains(RegExp(r"(?=.*?[#?!@$%^&*-])"))) {
      sink.addError("Password Must contain one special character");
    } else {
      sink.add(password.trim());
    }
  });
}
