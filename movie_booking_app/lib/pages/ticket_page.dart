import 'package:flutter/material.dart';
import 'package:fw_ticket/fw_ticket.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/method.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/back_button_view.dart';
import 'package:barcode_flutter/barcode_flutter.dart';

class TicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        leading: BackButtonView(
          icon: Icons.close,
          btnColor: Colors.black,
          onTapBack: () => routeToPreviousPage(context),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TicketScreenTitleText(),
            SizedBox(
              height: MARGIN_MEDIUM_3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: HEIGHT_550,
                    // color: Colors.red,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TicketUpperSectionView(),
                        ShowTimeInfoSectionView(),
                        BarcodeSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BarcodeSection extends StatelessWidget {
  const BarcodeSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ticket(
      dashedBottom: true,
      innerRadius: BorderRadius.only(
        topLeft: Radius.circular(DOUBLE_10),
        topRight: Radius.circular(DOUBLE_10),
      ),
      outerRadius: BorderRadius.all(
        Radius.circular(DOUBLE_10),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4.0),
          blurRadius: 2.0,
          spreadRadius: 2.0,
          color: TICKET_SHADOW_COLOR,
        )
      ],
      child: Container(
        padding: const EdgeInsets.only(
          left: MARGIN_MEDIUM_2,
          right: MARGIN_MEDIUM_2,
          top: 0,
        ),
        width: double.infinity,
        height: DOUBLE_80,
        color: Colors.white,
        child: Center(
          child: Container(
            height: DOUBLE_50,
            child: BarCodeImage(
              params: Code39BarCodeParams(
                "1234ABCD",
                lineWidth:
                    2.0, // width for a single black/white bar (default: 2.0)
                barHeight:
                    DOUBLE_50, // height for the entire widget (default: 100.0)
                withText:
                    false, // Render with text label or not (default: false)
              ),
              onError: (error) {
                // Error handler
                print('error = $error');
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ShowTimeInfoSectionView extends StatelessWidget {
  const ShowTimeInfoSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ticket(
      dashedBottom: true,
      innerRadius: BorderRadius.only(
        topLeft: Radius.circular(DOUBLE_10),
        topRight: Radius.circular(DOUBLE_10),
        bottomLeft: Radius.circular(DOUBLE_10),
        bottomRight: Radius.circular(DOUBLE_10),
      ),
      outerRadius: BorderRadius.all(
        Radius.circular(DOUBLE_10),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4.0),
          blurRadius: 2.0,
          spreadRadius: 2.0,
          color: TICKET_SHADOW_COLOR,
        )
      ],
      child: Container(
        padding: const EdgeInsets.only(
          left: MARGIN_MEDIUM_2,
          right: MARGIN_MEDIUM_2,
          top: MARGIN_MEDIUM_2,
        ),
        color: Colors.white,
        height: 250,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TickerInfoView(
              label: "Booking No",
              text: "GC1547219308",
            ),
            TickerInfoView(
              label: "Show time - Date",
              text: "7:00 PM - 10 May",
            ),
            TickerInfoView(
              label: "Theater",
              text: "Galaxy Cinema - Golden City",
            ),
            TickerInfoView(
              label: "Screen",
              text: "2",
            ),
            TickerInfoView(
              label: "Row Seats",
              text: "5, 6",
            ),
            TickerInfoView(
              label: "Price",
              text: "\$40.00",
            ),
          ],
        ),
      ),
    );
  }
}

class TickerInfoView extends StatelessWidget {
  final String label;
  final String text;

  const TickerInfoView({
    Key key,
    this.label,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: TEXT_REGULAR_2X,
                letterSpacing: 1,
              ),
            ),
            Spacer(),
            Text(
              text,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
      ],
    );
  }
}

class TicketUpperSectionView extends StatelessWidget {
  const TicketUpperSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ticket(
      dashedBottom: true,
      innerRadius: BorderRadius.only(
        bottomLeft: Radius.circular(DOUBLE_10),
        bottomRight: Radius.circular(DOUBLE_10),
      ),
      outerRadius: BorderRadius.all(
        Radius.circular(DOUBLE_10),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 4.0),
          blurRadius: 2.0,
          spreadRadius: 2.0,
          color: TICKET_SHADOW_COLOR,
        )
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MoviePosterAndTitleView(),
        ],
      ),
    );
  }
}

class MoviePosterAndTitleView extends StatelessWidget {
  const MoviePosterAndTitleView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          child: ClipRRect(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGFrQd3ez_nmjQhnH7F3vyJUbDogMKNqoU6nCd-7rJ3ZzgprZo',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: MARGIN_MEDIUM_2,
            right: MARGIN_MEDIUM_2,
            top: MARGIN_MEDIUM,
          ),
          width: double.infinity,
          height: DOUBLE_70,
          color: Colors.white,
          child: MovieTitleAndLengthView(),
        ),
      ],
    );
  }
}

class MovieTitleAndLengthView extends StatelessWidget {
  const MovieTitleAndLengthView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Detective Pikachu",
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR_2XX,
            // fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          "105m - IMAX",
          style: TextStyle(
            color: Colors.grey,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.normal,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class TicketScreenTitleText extends StatelessWidget {
  const TicketScreenTitleText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AWESOME,
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
          TICKET_SCREEN_SECOND_TITLE,
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
