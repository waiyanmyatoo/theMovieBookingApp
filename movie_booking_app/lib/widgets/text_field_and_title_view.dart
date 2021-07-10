import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class TextFieldAndTitleView extends StatelessWidget {
  final String title;
  final bool isObscure;
  final TextInputType textInputType;
  final Function(String) onChangeValue;
  final Function(String) onSubmitValue;

  const TextFieldAndTitleView({
    Key key,
    this.title,
    this.isObscure,
    this.textInputType,
    this.onChangeValue,
    this.onSubmitValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        TextField(
          obscureText: isObscure,
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
      ],
    );
  }
}