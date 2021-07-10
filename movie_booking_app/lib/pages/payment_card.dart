import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_credit_card_ui/flutter_custom_credit_card_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movie_booking_app/pages/add_new_card_page.dart';
import 'package:movie_booking_app/pages/ticket_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/method.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/back_button_view.dart';
import 'package:movie_booking_app/widgets/button_view.dart';

import 'home_page.dart';

class PaymentCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime _dateTime = DateTime.now();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: PaymentAmountView(),
          ),
          CreditCardListView(dateTime: _dateTime),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: AddNewCardView(
              addNewCardFn: () {
                routeToNextPage(context, AddNewCardPage());
              },
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: ReuseButtonView(
              borderColor: Colors.white,
              btnColor: PURPLE_COLOR,
              btnText: CONFIRM,
              fn: () {
                routeToNextPage(context, TicketPage());
              },
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2,
          ),
        ],
      ),
    );
  }
}

class AddNewCardView extends StatelessWidget {
  final Function addNewCardFn;

  const AddNewCardView({
    Key key,
    this.addNewCardFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.addNewCardFn();
      },
      child: Row(
        children: [
          FaIcon(
            FontAwesomeIcons.plusCircle,
            color: LIGHT_GREEN_COLOR,
            size: TEXT_REGULAR_2XX,
          ),
          SizedBox(
            width: MARGIN_MEDIUM,
          ),
          Text(
            "Add new card",
            style: TextStyle(
              color: LIGHT_GREEN_COLOR,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentAmountView extends StatelessWidget {
  const PaymentAmountView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AMOUNT,
          style: TextStyle(
            color: Colors.grey,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          "\$ 926.21",
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_HEADING_1X,
            fontWeight: FontWeight.w900,
            letterSpacing: LETTER_SPC2,
          ),
        ),
      ],
    );
  }
}

Color mC = Colors.grey.shade100;
Color mCL = Colors.white;
Color mCD = Colors.black.withOpacity(0.075);
Color mCC = Colors.green.withOpacity(0.65);
Color fCD = Colors.white;
Color fCL = Colors.white;

BoxDecoration nMbox = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    // color: mC,
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      // stops: [0.1, 0.4, 0.7, 0.9],
      colors: [
        HexColor("#8c76fc"),
        HexColor("#9f79f3"),
      ],
    ),
    boxShadow: [
      BoxShadow(
        color: mCD,
        offset: Offset(10, 10),
        blurRadius: 10,
      ),
      BoxShadow(
        color: mCL,
        offset: Offset(-10, -10),
        blurRadius: 10,
      ),
    ]);

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMbox,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('VISA',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Icon(
                Icons.more_horiz,
                color: fCD,
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('* * * *',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('* * * *',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('* * * *',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('8014',
                  style: TextStyle(
                      color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Card Holder',
                      style: TextStyle(
                          color: fCL,
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                  Text('Lindsey Johnson',
                      style: TextStyle(
                          color: fCD,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Expires',
                      style: TextStyle(
                          color: fCL,
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                  Text('08 / 21',
                      style: TextStyle(
                          color: fCD,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CreditCardListView extends StatelessWidget {
  const CreditCardListView({
    Key key,
    @required DateTime dateTime,
  })  : _dateTime = dateTime,
        super(key: key);

  final DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: 15,
        itemBuilder: (BuildContext context, int itemIndex) {
          return CustomCreditCard(
            cardNumber: "4687853000308938",
            cardHolder: "LyhourChhen",
            year: _dateTime.year,
            month: _dateTime.month,
            bgColor: PURPLE_COLOR,
            isGradient: true,
          );
          // return CreditCard();
        },
      ),
    );
  }
}
