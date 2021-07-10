import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:movie_booking_app/pages/movie_detail_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/viewitems/movie_view.dart';
import 'package:movie_booking_app/widgets/title_text.dart';

class HomePage extends StatelessWidget {
  List<String> menuItems = [
    "Promotion Code",
    'Select Language',
    'Terms of Service',
    'Help'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 0,
              left: 0,
              bottom: 0,
              right: MARGIN_MEDIUM_2,
            ),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            color: PURPLE_COLOR,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 96,
                ),
                DrawerHeaderSection(),
                SizedBox(
                  height: MARGIN_XXLARGE,
                ),
                Column(
                  children: menuItems.map(
                    (menu) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: MARGIN_MEDIUM_2,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.help, color: Colors.white),
                          title: Text(
                            menu,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: TEXT_REGULAR_3X,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                Spacer(),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Log out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_3X,
                    ),
                  ),
                ),
                SizedBox(
                  height: MARGIN_XLARGE,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_2,
                ),
                child: ProfileSection(),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              MoviesListSectionView(
                title: NOW_SHOWING,
                onTapMovie: () => _routeToMovieDetaiScreen(context),
              ),
              SizedBox(
                height: MARGIN_LARGE,
              ),
              MoviesListSectionView(
                title: COMING_SOON,
                onTapMovie: () => _routeToMovieDetaiScreen(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _routeToMovieDetaiScreen(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieDetailPage()),
    );
  }
}

class DrawerHeaderSection extends StatelessWidget {
  const DrawerHeaderSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: PROFILE_IMAGE_SIZE,
          height: PROFILE_IMAGE_SIZE,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  "https://www.gstatic.com/tv/thumb/persons/552822/552822_v9_bc.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: MARGIN_MEDIUM_2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Lily Jhonson',
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: MARGIN_MEDIUM,
            ),
            Row(
              children: [
                Text(
                  'lilyJohnson@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MARGIN_LARGE,
                ),
                Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class MoviesListSectionView extends StatelessWidget {
  final String title;
  final Function onTapMovie;

  const MoviesListSectionView({
    Key key,
    this.title,
    this.onTapMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: TitleText(
            text: title,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        HorizontalMovieListView(
          onTapMovie: () {
            this.onTapMovie();
          },
        ),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final Function onTapMovie;

  const HorizontalMovieListView({
    Key key,
    this.onTapMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGHT,
      // color: Colors.blue,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
          left: MARGIN_MEDIUM_2,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return MovieView(
            onTapMovie: () {
              this.onTapMovie();
            },
          );
        },
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: MARGIN_LARGE,
          backgroundImage: NetworkImage(
              "https://www.gstatic.com/tv/thumb/persons/552822/552822_v9_bc.jpg"),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(
          width: MARGIN_CARD_MEDIUM_2,
        ),
        Text(
          "Hi Lily!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: TEXT_REGULAR_3X,
          ),
        )
      ],
    );
  }
}
