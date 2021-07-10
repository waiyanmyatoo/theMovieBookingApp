import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import '../data/vos/movie_seat_vo.dart';
import 'package:movie_booking_app/dummy/dummy_data.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/viewitems/movie_seat_item_view.dart';
import 'package:movie_booking_app/widgets/button_view.dart';

class MovieSeatPage extends StatelessWidget {
  final List<MovieSeatVO> _movieSeat = dummyMovieSeats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: MARGIN_XLARGE,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MovieNameAndCinemaSectionView(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              MovieSeatSectionView(
                movieSeat: _movieSeat,
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              MovieSeatGlossarySectionView(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              DottedLineSectionView(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              NumberOfSeatsAndTicketSectionView(),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: ReuseButtonView(
                  borderColor: PURPLE_COLOR,
                  btnColor: PURPLE_COLOR,
                  btnText: "Buy ticket for \$20",
                  fn: () {},
                ),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieNameAndCinemaSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Detective Pikachu',
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: MARGIN_SMALL,
        ),
        Text(
          'Galaxy Cinema - Golden City',
          style: TextStyle(
            color: MOVIE_SEAT_AVAILABLE_COLOR,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: MARGIN_SMALL,
        ),
        Text(
          'Wednesday, 10 May, 07:00 PM',
          style: TextStyle(
            color: MOVIE_SEAT_AVAILABLE_COLOR,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class MovieSeatSectionView extends StatelessWidget {
  final List<MovieSeatVO> movieSeat;

  const MovieSeatSectionView({Key key, this.movieSeat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieSeat.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: MARGIN_SMALL),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return MovieSeatItemView(
          mMovieSeatVO: movieSeat[index],
        );
      },
    );
  }
}

class MovieSeatGlossarySectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: MovieSeatGlossaryView(
              color: MOVIE_SEAT_AVAILABLE_COLOR,
              label: "Available",
            ),
          ),
          Expanded(
            flex: 1,
            child: MovieSeatGlossaryView(
              color: MOVIE_SEAT_TAKEN_COLOR,
              label: "Taken",
            ),
          ),
          Expanded(
            flex: 1,
            child: MovieSeatGlossaryView(
              color: PURPLE_COLOR,
              label: "Your Selection",
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLineSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: DottedLine(
        direction: Axis.horizontal,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: MARGIN_MEDIUM,
        dashColor: MOVIE_SEAT_AVAILABLE_COLOR,
        dashGapLength: MARGIN_MEDIUM,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }
}

class NumberOfSeatsAndTicketSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Column(
        children: <Widget>[
          NumberOfSeatsAndTicketView(
            title: "Tickets",
            info: '2',
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          NumberOfSeatsAndTicketView(
            title: "Seats",
            info: 'D Row/ 5,6',
          ),
        ],
      ),
    );
  }
}

class NumberOfSeatsAndTicketView extends StatelessWidget {
  final String title;
  final String info;

  const NumberOfSeatsAndTicketView({Key key, this.title, this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              color: MOVIE_SEAT_AVAILABLE_COLOR, fontSize: TEXT_REGULAR_2X),
        ),
        Spacer(),
        Text(
          info,
          style: TextStyle(
              color: MOVIE_SEAT_AVAILABLE_COLOR, fontSize: TEXT_REGULAR_2X),
        )
      ],
    );
  }
}

class MovieSeatGlossaryView extends StatelessWidget {
  final Color color;
  final String label;

  const MovieSeatGlossaryView({Key key, this.color, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: DOUBLE_30,
          height: DOUBLE_30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(
          width: DOUBLE_8,
        ),
        Text(
          label,
          style: TextStyle(
            color: MOVIE_SEAT_AVAILABLE_COLOR,
            fontSize: DOUBLE_13,
          ),
        )
      ],
    );
  }
}
