import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/my_main_button.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/authantication_text.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/authantication_text_2.dart';

class ResetPasswordAndOtpVerificationScreen extends StatelessWidget {
  final String mainText;
  final String smallText;
  final List<Widget> pageContent;
  final Function onPressed;
  final String buttonText;

  const ResetPasswordAndOtpVerificationScreen({
    super.key,
    required this.mainText,
    required this.smallText,
    required this.pageContent,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            elevation: 10,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        body: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 15,
            start: 15,
            end: 15,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthanticationText(text: mainText),
              AuthanticationText2(text: smallText),
              Column(
                children: pageContent,
              ),
              const Spacer(),
              MyMainButton(
                context: context,
                onTap: () {
                  onPressed();
                },
                title: buttonText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
