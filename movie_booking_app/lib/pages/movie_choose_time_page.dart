import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/method.dart';
import 'package:movie_booking_app/widgets/back_button_view.dart';

class MovieChooseTimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PURPLE_COLOR,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: MARGIN_XLARGE,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieChooseDateView(),
              ChooseItemGridSectionView(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_2,
                ),
                height: MARGIN_XXLARGE,
                decoration: BoxDecoration(
                    color: PURPLE_COLOR,
                    borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2)),
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseItemGridSectionView extends StatelessWidget {
  const ChooseItemGridSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MARGIN_MEDIUM_2,
        right: MARGIN_MEDIUM_2,
        top: MARGIN_MEDIUM_2,
        bottom: MARGIN_MEDIUM_2,
      ),
      color: Colors.white,
      child: Column(
        children: [
          ChooseItemGridView(),
          ChooseItemGridView(),
          ChooseItemGridView(),
        ],
      ),
    );
  }
}

class ChooseItemGridView extends StatelessWidget {
  const ChooseItemGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Text(
          'Available Times',
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.5,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                left: MARGIN_MEDIUM_2,
                right: MARGIN_MEDIUM_2,
                top: MARGIN_MEDIUM,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    MARGIN_MEDIUM,
                  ),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  )),
              child: Center(child: Text("2D")),
            );
          },
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
      ],
    );
  }
}

class MovieChooseDateView extends StatelessWidget {
  const MovieChooseDateView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PURPLE_COLOR,
      height: DOUBLE_88,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            width: MARGIN_MEDIUM_2,
          );
        },
        padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Text(
                'Wed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                ),
              ),
              Text(
                '10',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
