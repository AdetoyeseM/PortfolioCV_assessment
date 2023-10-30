import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_cv_assessment/views/constants/colors/colors.dart';
import 'package:portfolio_cv_assessment/views/constants/text_decorations/text_decoration.dart';
import 'package:portfolio_cv_assessment/views/widgets/app_button.dart';

void hideProgressIndicator(BuildContext context) {
  Navigator.of(context).pop();
}

showErrorDialog(BuildContext? context, String title, String message,
    String actionText, VoidCallback onClose,
    {bool hasClose = false}) async {
  showGeneralDialog(
      context: context!,
      barrierColor: Colors.black54,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return FadeTransition(
            opacity: animation,
            child: ErrorOverlayWidget(
              description: message,
              message: title,
              onClose: onClose,
              isError: true,
              actionText: actionText,
            ));
      });
}

class ErrorOverlayWidget extends StatefulWidget {
  const ErrorOverlayWidget(
      {Key? key,
      this.isError,
      this.message,
      this.description,
      this.actionText,
      this.onClose})
      : super(key: key);
  final String? message, description;
  final bool? isError;
  final String? actionText;
  final VoidCallback? onClose;

  @override
  State<ErrorOverlayWidget> createState() => _ErrorOverlayWidgetState();
}

class _ErrorOverlayWidgetState extends State<ErrorOverlayWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animationController.forward(); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WillPopScope(
        onWillPop: () async => true,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color: PorfolioColorsDark.blue_800.withOpacity(.25),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    widget.isError == true
                        ? AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            progress: _animationController,
                            color: Colors.red,
                            size: 42,
                          )
                        : Icon(
                            Icons.done_all,
                            color: PorfolioColorsDark.blue_800,
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Text(
                        "${widget.description}",
                        textAlign: TextAlign.center,
                        style: appTextStyle(
                            fontSize: 14,
                            color: PorfolioColorsDark.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                      child: CustomButton(
                          text: widget.actionText ?? "Retry",
                          onTap: widget.onClose),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
