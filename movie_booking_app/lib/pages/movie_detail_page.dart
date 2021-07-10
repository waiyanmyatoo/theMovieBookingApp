import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/buy_snacks_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/method.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/back_button_view.dart';
import 'package:movie_booking_app/widgets/button_view.dart';
import 'package:movie_booking_app/widgets/play_button_view.dart';
import 'package:movie_booking_app/widgets/rating_view.dart';
import 'package:movie_booking_app/widgets/title_text.dart';

class MovieDetailPage extends StatelessWidget {
  List<String> genreList = [
    "Mystery",
    "Adventure",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                MovieDetailsSliverAppBarView(
                  onTapBack: () => routeToPreviousPage(context),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_2,
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MovieDetailsTitleInfoSectionView(
                                  genreList: genreList),
                              SizedBox(
                                height: MARGIN_MEDIUM_2,
                              ),
                              PlotSummaryView(),
                              SizedBox(
                                height: MARGIN_MEDIUM_2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CastSectionView(),
                      SizedBox(
                        height: MARGIN_XXLARGE,
                      ),
                      SizedBox(
                        height: MARGIN_XXLARGE,
                      ),
                      SizedBox(
                        height: MARGIN_XXLARGE,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: DOUBLE_8),
                height: DOUBLE_80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white,
                      ]),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: DOUBLE_20 + 2,
                    ),
                    ReuseButtonView(
                      borderColor: PURPLE_COLOR,
                      btnColor: PURPLE_COLOR,
                      btnText: GET_YOUR_TICKET,
                      fn: () {
                        routeToNextPage(
                          context,
                          BuySnacksPage(),
                        );
                      },
                    ),
                    // FlatButton(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(DOUBLE_10)),
                    //   minWidth: double.infinity,
                    //   height: BUTTON_HEIGHT,
                    //   color: PURPLE_COLOR,
                    //   onPressed: () {},
                    //   child: Text(
                    //     GET_YOUR_TICKET,
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: TEXT_REGULAR_2X,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CastSectionView extends StatelessWidget {
  const CastSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: TitleText(
            text: CAST,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        ActorsSectionView(),
      ],
    );
  }
}

class ActorsSectionView extends StatelessWidget {
  const ActorsSectionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: DOUBLE_100,
      // color: Colors.red,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
              // right: MARGIN_MEDIUM,
              left: MARGIN_MEDIUM_2,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: MARGIN_XLARGE,
                  backgroundImage: NetworkImage(
                      "https://www.gstatic.com/tv/thumb/persons/552822/552822_v9_bc.jpg"),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Text(
                  "Lily",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class PlotSummaryView extends StatelessWidget {
  const PlotSummaryView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleText(
          text: PLOT_SUMMARY,
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          "Ace detective Harry Goodman goes mysteriously missing, prompting his 21-year-old son, Tim, to find out what happened. Aiding in the investigation is Harry's former Pokémon partner, wise-cracking, adorable super-sleuth Detective Pikachu. Finding that they are uniquely equipped to work together, as Tim is the only human who can talk with Pikachu, they join forces to unravel the tangled mystery.",
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR,
          ),
        )
      ],
    );
  }
}

class MovieDetailsTitleInfoSectionView extends StatelessWidget {
  const MovieDetailsTitleInfoSectionView({
    Key key,
    @required this.genreList,
  }) : super(key: key);

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Detective Pikachu",
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_HEADING_1X,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(
          height: MARGIN_CARD_MEDIUM_2,
        ),
        Row(
          children: <Widget>[
            Text(
              "1h 45m",
              style: TextStyle(
                color: Colors.black,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(
              width: MARGIN_MEDIUM,
            ),
            RatingView(),
            SizedBox(
              width: MARGIN_MEDIUM,
            ),
            Text(
              "IMDB 6.6",
              style: TextStyle(
                color: Colors.black,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Row(
          children: genreList
              .map(
                (genre) => GenreChipView(
                  genreText: genre,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class GenreChipView extends StatelessWidget {
  final String genreText;

  const GenreChipView({
    Key key,
    this.genreText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey[300],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          label: Text(
            genreText,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(
          width: MARGIN_SMALL,
        ),
      ],
    );
  }
}

class MovieDetailsSliverAppBarView extends StatelessWidget {
  final Function onTapBack;

  const MovieDetailsSliverAppBarView({
    Key key,
    this.onTapBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      automaticallyImplyLeading: false,
      // bottom: PreferredSize(
      //   child: Container(),
      //   preferredSize: Size(0, DOUBLE_20),
      // ),
      pinned: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGFrQd3ez_nmjQhnH7F3vyJUbDogMKNqoU6nCd-7rJ3ZzgprZo",
              ),
            ),
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: MARGIN_XXLARGE,
                left: MARGIN_MEDIUM_2,
              ),
              child: BackButtonView(
                onTapBack: () {
                  this.onTapBack();
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
          Positioned(
            child: Container(
              height: DOUBLE_20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(DOUBLE_50),
                  topRight: Radius.circular(DOUBLE_50),
                ),
              ),
            ),
            bottom: 0,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }
}

class MovieDetailsAppBarImageView extends StatelessWidget {
  const MovieDetailsAppBarImageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://www.denofgeek.com/wp-content/uploads/2017/02/the-wolverine-2013.jpg?resize=768%2C432",
      fit: BoxFit.cover,
    );
  }
}
