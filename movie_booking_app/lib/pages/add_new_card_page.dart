import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/credit_card_number_input_formatter.dart';
import 'package:flutter_multi_formatter/utils/unfocuser.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/method.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/back_button_view.dart';
import 'package:movie_booking_app/widgets/button_view.dart';
import 'package:movie_booking_app/widgets/text_field_and_title_view.dart';

class AddNewCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        leading: BackButtonView(
          btnColor: Colors.black,
          onTapBack: () => routeToPreviousPage(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                CraditCardInputField(
                  title: CARD_NUMBER,
                  onChangeValue: (value) {},
                  onSubmitValue: (value) {},
                  textInputType: TextInputType.number,
                  formatter: CreditCardNumberInputFormatter(),
                ),
                SizedBox(
                  height: MARGIN_XLARGE,
                ),
                CraditCardInputField(
                  title: CARD_HOLDER,
                  onChangeValue: (value) {},
                  onSubmitValue: (value) {},
                  textInputType: TextInputType.name,
                  formatter: RestrictingInputFormatter.restrictFromString(
                    restrictedChars: ';^\\\$()[](){}*|/',
                  ),
                ),
                SizedBox(
                  height: MARGIN_XLARGE,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2.4,
                      child: CraditCardInputField(
                        title: EXPIR_DATE,
                        onChangeValue: (value) {},
                        onSubmitValue: (value) {},
                        textInputType: TextInputType.number,
                        formatter: CreditCardExpirationDateFormatter(),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.4,
                      child: CraditCardInputField(
                        title: CSV,
                        onChangeValue: (value) {},
                        onSubmitValue: (value) {},
                        textInputType: TextInputType.number,
                        formatter: CreditCardCvcInputFormatter(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.3,
                ),
                ReuseButtonView(
                  borderColor: Colors.white,
                  btnColor: PURPLE_COLOR,
                  btnText: CONFIRM,
                  fn: () {},
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CraditCardInputField extends StatelessWidget {
  final String title;
  final TextInputType textInputType;
  final Function(String) onChangeValue;
  final Function(String) onSubmitValue;
  final TextInputFormatter formatter;

  const CraditCardInputField({
    Key key,
    this.title,
    this.textInputType,
    this.onChangeValue,
    this.onSubmitValue,
    this.formatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: TEXT_REGULAR_2XX,
            letterSpacing: 1,
          ),
        ),
        Unfocuser(
          child: TextField(
            inputFormatters: [
              formatter,
            ],
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[400],
                  width: BORDER_WIDTH,
                ),
              ),
            ),
            keyboardType: textInputType,
            onChanged: (value) {
              onChangeValue(value);
            },
            onSubmitted: (value) {
              onSubmitValue(value);
            },
          ),
        ),
      ],
    );
  }
}
