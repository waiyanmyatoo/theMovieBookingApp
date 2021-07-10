import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

// import 'package:sign_button/sign_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_booking_app/data/models/Auth/auth_model_impl.dart';

import 'package:movie_booking_app/pages/home_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/icons.dart';
import 'package:movie_booking_app/resources/method.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/auth_button_view.dart';
import 'package:movie_booking_app/widgets/button_view.dart';
import 'package:movie_booking_app/widgets/text_field_and_title_view.dart';
import 'package:movie_booking_app/widgets/title_text.dart';

class LoginAndRegisterPage extends StatefulWidget {
  @override
  _LoginAndRegisterPageState createState() => _LoginAndRegisterPageState();
}

class _LoginAndRegisterPageState extends State<LoginAndRegisterPage> {
  AuthModelImpl authModelImpl = AuthModelImpl();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          height: ScreenUtil().screenHeight,
          color: HOME_SCREEN_BACKGROUND_COLOR,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: MARGIN_MEDIUM_2,
              right: MARGIN_MEDIUM_2,
              top: kToolbarHeight.h,
              bottom: MARGIN_MEDIUM_2.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                WelcomeMsgView(),
                SizedBox(
                  height: MARGIN_XLARGE,
                ),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.black,
                  labelColor: PURPLE_COLOR,
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: PURPLE_COLOR,
                        width: 2,
                      ),
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            LOGIN_TEXT,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            REGISTER_TEXT,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MARGIN_XXLARGE,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  child: Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: TabBarView(
                      children: [
                        LoginFormView(
                          onTapEmailLogin: (email, password) {
                            print('email : $email \npassword: $password');
                            return authModelImpl.loginWithEmail(email, password).then(
                              (value) {
                                print('success');
                                routeToNextPage(context, HomePage());
                              },
                            ).catchError((error) {
                              print(error);
                            });
                          },
                        ),
                        RegisterFormView(),
                      ],
                    ),
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

class LoginFormView extends StatefulWidget {
  LoginFormView({
    Key key,
    this.onTapEmailLogin,
  }) : super(key: key);

  final Function(String, String) onTapEmailLogin;

  @override
  _LoginFormViewState createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<LoginFormView> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldAndTitleView(
          isObscure: false,
          textInputType: TextInputType.emailAddress,
          title: EMAIL,
          onChangeValue: (value) {
            // print(value);
            setState(() {
              this.email = value;
            });
          },
          onSubmitValue: (value) {
            // print(value);
            setState(() {
              this.email = value;
            });
          },
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: SizedBox(
            height: DOUBLE_50,
          ),
        ),
        TextFieldAndTitleView(
          isObscure: true,
          textInputType: TextInputType.text,
          title: PASSWORD,
          onChangeValue: (value) {
            print(value);
            setState(() {
              this.password = value;
            });
          },
          onSubmitValue: (value) {
            print(value);
            setState(() {
              this.password = value;
            });
          },
        ),
        SizedBox(
          height: MARGIN_LARGE,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: TEXT_REGULAR_2X,
                // fontWeight: FontWeight.w800,
                // letterSpacing: BORDER_WIDTH,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_1,
        ),
        AuthButtonView(
          icon: FACEBOOK,
          btnText: LOGIN_WITH_FACEBOOK,
        ),
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        AuthButtonView(
          icon: GOOGLE,
          btnText: LOGIN_WITH_GOOGLE,
        ),
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        ReuseButtonView(
          borderColor: Colors.white,
          btnColor: PURPLE_COLOR,
          btnText: CONFIRM,
          fn: () {
            this.widget.onTapEmailLogin(this.email, this.password);
            // routeToNextPage(context, HomePage());
          },
        ),
      ],
    );
  }
}

class RegisterFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldAndTitleView(
              isObscure: false,
              textInputType: TextInputType.name,
              title: NAME,
              onChangeValue: (value) {
                print(value);
              },
              onSubmitValue: (value) {
                print(value);
              },
            ),
            SizedBox(
              height: MARGIN_XLARGE,
            ),
            TextFieldAndTitleView(
              isObscure: false,
              textInputType: TextInputType.phone,
              title: PHONE,
              onChangeValue: (value) {
                print(value);
              },
              onSubmitValue: (value) {
                print(value);
              },
            ),
            SizedBox(
              height: MARGIN_XLARGE,
            ),
            TextFieldAndTitleView(
              isObscure: false,
              textInputType: TextInputType.emailAddress,
              title: EMAIL,
              onChangeValue: (value) {
                print(value);
              },
              onSubmitValue: (value) {
                print(value);
              },
            ),

            SizedBox(
              height: MARGIN_XLARGE,
            ),
            TextFieldAndTitleView(
              isObscure: true,
              textInputType: TextInputType.text,
              title: CONFIRM_PASSWORD,
              onChangeValue: (value) {
                print(value);
              },
              onSubmitValue: (value) {
                print(value);
              },
            ),
            SizedBox(
              height: DOUBLE_60,
            ),
            // Spacer(),
            SizedBox(
              height: MARGIN_MEDIUM_3,
            ),
            AuthButtonView(
              icon: FACEBOOK,
              btnText: REGISTER_WITH_FACEBOOK,
            ),
            SizedBox(
              height: MARGIN_MEDIUM_3,
            ),
            AuthButtonView(
              icon: GOOGLE,
              btnText: REGISTER_WITH_GOOGLE,
            ),
            SizedBox(
              height: MARGIN_MEDIUM_3,
            ),
            ReuseButtonView(
              borderColor: Colors.white,
              btnColor: PURPLE_COLOR,
              btnText: CONFIRM,
              fn: () {
                routeToNextPage(context, HomePage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeMsgView extends StatelessWidget {
  const WelcomeMsgView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          WELCOME_TEXT,
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_HEADING_1X,
            fontWeight: FontWeight.w800,
            letterSpacing: BORDER_WIDTH,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          TO_LOGIN_MSG,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: TEXT_REGULAR_2X,
            // fontWeight: FontWeight.w800,
            // letterSpacing: BORDER_WIDTH,
          ),
        ),
      ],
    );
  }
}
