import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_booking_app/pages/payment_card.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/method.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/back_button_view.dart';
import 'package:movie_booking_app/widgets/button_view.dart';
import 'package:movie_booking_app/widgets/text_field_and_title_view.dart';
import 'package:movie_booking_app/widgets/title_text.dart';

class BuySnacksPage extends StatefulWidget {
  @override
  _BuySnacksPageState createState() => _BuySnacksPageState();
}

class _BuySnacksPageState extends State<BuySnacksPage> {
  int price = 15;
  int price_1 = 18;
  int price_2 = 20;

  int amount = 0;
  int amount_1 = 0;
  int amount_2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        leading: BackButtonView(
          btnColor: Colors.black,
          onTapBack: () => routeToPreviousPage(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SnackSelectionView(
                snackTitle: SNACK_TITLE,
                snackDesc: SNACK_DESC,
                price: price,
                amount: amount,
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              SnackSelectionView(
                snackTitle: SNACK_TITLE_1,
                snackDesc: SNACK_DESC_1,
                price: price_1,
                amount: amount_1,
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              SnackSelectionView(
                snackTitle: SNACK_TITLE_2,
                snackDesc: SNACK_DESC_2,
                price: price_2,
                amount: amount_2,
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              PromoCodeTextFieldView(
                onSubmitValue: (value) {
                  print(value);
                },
                getItNow: () {},
              ),
              SizedBox(
                height: MARGIN_MEDIUM,
              ),
              Text(
                "Sub total : 40\$",
                style: TextStyle(
                  color: LIGHT_GREEN_COLOR,
                  fontSize: TEXT_REGULAR_3X,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              Text(
                PAYMENT_METHOD,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: TEXT_HEADING_1X,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              PaymentMethodCardListView(
                icon: FontAwesomeIcons.creditCard,
                title: CREDIT_CARD,
                cardList: CREDIT_CARD_LIST,
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              PaymentMethodCardListView(
                icon: FontAwesomeIcons.ccMastercard,
                title: INTERNET_BANKING_CARD,
                cardList: CREDIT_CARD_LIST,
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              PaymentMethodCardListView(
                icon: FontAwesomeIcons.wallet,
                title: E_WALLET,
                cardList: PAYPAL,
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              ReuseButtonView(
                borderColor: PURPLE_COLOR,
                btnColor: PURPLE_COLOR,
                btnText: "Pay \$40.00",
                fn: () {
                  routeToNextPage(
                    context,
                    PaymentCardPage(),
                  );
                },
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodCardListView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String cardList;

  const PaymentMethodCardListView({
    Key key,
    this.icon,
    this.title,
    this.cardList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FaIcon(
          icon,
          size: DOUBLE_26,
        ),
        SizedBox(
          width: MARGIN_LARGE,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: TEXT_REGULAR_2XX,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: MARGIN_MEDIUM,
            ),
            Text(
              cardList,
              style: TextStyle(
                color: Colors.grey,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PromoCodeTextFieldView extends StatelessWidget {
  final Function onSubmitValue;
  final Function getItNow;

  const PromoCodeTextFieldView({
    Key key,
    this.onSubmitValue,
    this.getItNow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[400],
                width: BORDER_WIDTH,
              ),
            ),
            hintText: PROMO_CODE_HINT_TEXT,
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: TEXT_REGULAR_3X,
              color: Colors.grey[400],
            ),
          ),
          onSubmitted: (value) {
            onSubmitValue(value);
          },
        ),
        // SizedBox(
        //   height: MARGIN_MEDIUM_1,
        // ),
        Row(
          children: [
            Text(
              DONT_HAVE_PROMO_CODE_MSG,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: TEXT_REGULAR,
                color: Colors.grey[500],
              ),
            ),
            TextButton(
              onPressed: () {
                this.getItNow();
              },
              child: Text(
                "Get it Now",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: TEXT_REGULAR_2X,
                  // fontWeight: FontWeight.w800,
                  // letterSpacing: BORDER_WIDTH,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class SnackSelectionView extends StatefulWidget {
  String snackTitle;
  String snackDesc;
  int price;
  int amount;

  SnackSelectionView({
    Key key,
    this.snackTitle,
    this.snackDesc,
    this.price,
    this.amount,
  }) : super(key: key);

  @override
  _SnackSelectionViewState createState() => _SnackSelectionViewState();
}

class _SnackSelectionViewState extends State<SnackSelectionView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.snackTitle,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: TEXT_REGULAR_3X,
                  letterSpacing: 1),
            ),
            Spacer(),
            Container(
              width: 110,
              child: Text(
                "${widget.price * widget.amount}\$",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: TEXT_REGULAR_3X,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MARGIN_MEDIUM_1,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.6,
              child: Text(
                widget.snackDesc,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                  fontSize: TEXT_REGULAR_2X,
                ),
              ),
            ),
            SizedBox(
              height: MARGIN_MEDIUM_1,
            ),
            Spacer(),
            Container(
              height: DOUBLE_40,
              width: DOUBLE_110,
              padding: EdgeInsets.symmetric(horizontal: DOUBLE_8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DOUBLE_10),
                  border: Border.all(color: Colors.grey[400])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (this.mounted) {
                        if (widget.amount > 0) {
                          setState(() {
                            widget.amount -= 1;
                          });
                        } else {}
                      }
                      print(widget.amount);
                      print(widget.amount);
                    },
                    child: Icon(
                      Icons.remove,
                      size: MARGIN_MEDIUM_2,
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                  ),
                  Text(
                    "${widget.amount}",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                      fontSize: TEXT_REGULAR_2XX,
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (this.mounted) {
                        setState(
                          () {
                            widget.amount += 1;
                          },
                        );
                      }
                      print(widget.amount);
                    },
                    child: Icon(
                      Icons.add,
                      size: MARGIN_MEDIUM_2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
