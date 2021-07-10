import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/home_page.dart';
import 'package:movie_booking_app/pages/login_and_register_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/method.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/button_view.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PURPLE_COLOR,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     stops: [0.1, 0.4, 0.7, 0.9],
        //     colors: [
        //       Color(0xFF3594DD),
        //       Color(0xFF4563DB),
        //       Color(0xFF5036D5),
        //       Color(0xFF5B16D0),
        //     ],
        //   ),
        // ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(DOUBLE_20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      OnboardingImageView(),
                      SizedBox(height: DOUBLE_80),
                      WelcomeTextView(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ReuseButtonView(
                    borderColor: Colors.white,
                    btnColor: PURPLE_COLOR,
                    btnText: GET_STARTED,
                    fn: () {
                      routeToNextPage(context,LoginAndRegisterPage());
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}



class OnboardingImageView extends StatelessWidget {
  const OnboardingImageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage(
          'assets/images/onboarding0.png',
        ),
        // height: 300.0,
        // width: 300.0,
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.height / 2.5,
      ),
    );
  }
}

class WelcomeTextView extends StatelessWidget {
  const WelcomeTextView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          WELCOME_TEXT,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.w600,
              height: 1.2,
              letterSpacing: 1.2
              // fontStyle: FontStyle.,
              ),
        ),
        SizedBox(height: DOUBLE_10),
        Text(
          "Hello! Welcome to Galaxy App",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2XX,
            // fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
