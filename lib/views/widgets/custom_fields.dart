import 'package:flutter/material.dart';
import 'package:portfolio_cv_assessment/services/toggle_password_visibility/toggle_password_visibility_bloc.dart';
import 'package:portfolio_cv_assessment/views/constants/colors/colors.dart';

import '../constants/text_decorations/text_decoration.dart';

class PorfolioAppTextField extends StatelessWidget {
  const PorfolioAppTextField({
    Key? key,
    this.label,
    this.hint,
    this.stream,
    this.onChanged,
    this.enabled,
    this.onTap,
    this.controller,
    this.textInputAction,
    this.trailing,
    this.keyboardType,
  }) : super(key: key);

  final String? label, hint;
  final Stream? stream;
  final Widget? trailing;
  final Function(String? e)? onChanged;
  final bool? enabled;
  final void Function()? onTap;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label ?? "",
                  style: appTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: PorfolioColorsDark.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  enableInteractiveSelection: true,
                  enableSuggestions: true,
                  autovalidateMode: AutovalidateMode.always,
                  textInputAction: textInputAction ?? TextInputAction.next,
                  keyboardType: keyboardType ?? TextInputType.text,
                  controller: controller,
                  onTap: onTap,
                  onChanged: onChanged,
                  enabled: enabled ?? true,
                  decoration: InputDecoration(
                    suffixIcon: trailing,
                    fillColor:
                        enabled == false ? PorfolioColorsDark.grey_900 : null,
                    errorText:
                        snapshot.hasError ? snapshot.error.toString() : null,
                    hintText: hint,
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField(
      {Key? key,
      this.hint,
      this.label,
      this.stream,
      this.keyboardType,
      this.action,
      this.onchanged,
      this.number,
      this.leading,
      this.controller,
      this.useListRequirements})
      : super(key: key);

  final String? label;
  final String? hint;
  final TextInputType? keyboardType;
  final Stream? stream;
  final Function(String e)? onchanged;
  final bool? number, useListRequirements;
  final Widget? leading;
  final TextInputAction? action;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    TogglePasswordVisibilityBloc togglePasswordVisibilityBloc =
        TogglePasswordVisibilityBloc();
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? "",
            style: appTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: PorfolioColorsDark.white),
          ),
          Visibility(
            visible: label != null,
            child: const SizedBox(
              height: 9,
            ),
          ),
          StreamBuilder(
              stream: stream,
              builder: (context, s) {
                return StreamBuilder<bool>(
                    initialData: true,
                    stream: togglePasswordVisibilityBloc.showPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                        textInputAction: action,
                        controller: controller,
                        obscureText: snapshot.data ?? true,
                        onChanged: onchanged,
                        keyboardType: keyboardType,
                        decoration: InputDecoration(
                            hintText: hint,
                            suffix: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: StreamBuilder<bool>(
                                  initialData: false,
                                  stream: togglePasswordVisibilityBloc
                                      .passwordShown,
                                  builder: (context, snapshot) {
                                    return InkWell(
                                        onTap: () =>
                                            togglePasswordVisibilityBloc
                                                .toggleShowPassword(),
                                        child: snapshot.data!
                                            ? Text(
                                                "Show",
                                                style: appTextStyle(
                                                    fontSize: 12,
                                                    color: PorfolioColorsDark
                                                        .white,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              )
                                            : Text(
                                                "Hide",
                                                style: appTextStyle(
                                                    color: PorfolioColorsDark
                                                        .white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ));
                                  }),
                            ),
                            errorText: s.hasError ? s.error.toString() : null),
                      );
                    });
              }),
          useListRequirements == true
              ? StreamBuilder(
                  stream: stream,
                  builder: (context, passwordSnapshot) {
                    String password = passwordSnapshot.data ?? "";

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        _buildRequirementText(
                          "A Lowercase letter",
                          password.contains(RegExp(r"(?=.*?[a-z])")),
                        ),
                        _buildRequirementText(
                          "An Uppercase letter",
                          password.contains(RegExp(r"(?=.*?[A-Z])")),
                        ),
                        _buildRequirementText(
                          "At least one number",
                          password.contains(RegExp(r"(?=.*?[0-9])")),
                        ),
                        _buildRequirementText(
                          "At least one special character",
                          password.contains(RegExp(r"(?=.*?[#?!@$%^&*-])")),
                        ),
                        _buildRequirementText(
                          "8 Characters minimum",
                          password.length >= 8,
                        ),
                      ],
                    );
                  },
                )
              : const SizedBox()
        ],
      ),
    );
  }

  _buildRequirementText(String s, bool contains) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: contains ? Colors.green : Colors.red,
              radius: 8,
              child: contains
                  ? const Icon(
                      Icons.done,
                      size: 10,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.close,
                      size: 10,
                      color: Colors.white,
                    )),
          const SizedBox(
            width: 5,
          ),
          Text(
            s,
            style: appTextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: contains ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
