import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_ui_kit/screens/cart.dart';
import 'package:restaurant_ui_kit/screens/viewSell.dart';
import 'package:restaurant_ui_kit/screens/home.dart';
import 'package:restaurant_ui_kit/screens/profile.dart';
import 'package:restaurant_ui_kit/screens/search.dart';
import 'package:restaurant_ui_kit/util/const.dart';
import 'package:restaurant_ui_kit/util/search_services.dart';
import 'package:restaurant_ui_kit/widgets/badge.dart';
import 'package:restaurant_ui_kit/screens/join.dart';
import 'package:restaurant_ui_kit/util/services.dart';
import 'package:geolocator/geolocator.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;
  //declarar variables latitud y longitud
  double latitude;
  double longitude;

  //obtener ubicacion para guardarla
  Future<Position> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            Constants.appName,
          ),
          elevation: 0.0,
          actions: <Widget>[],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: <Widget>[
            Home(),
            ViewSells(),
            SearchScreen(),
            CartScreen(),
            Profile(),
            JoinApp(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 7),
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 24.0,
                ),
                color: _page == 0
                    ? Theme.of(context).accentColor
                    : Theme.of(context).textTheme.caption.color,
                onPressed: () => _pageController.jumpToPage(0),
              ),
              IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 24.0,
                  ),
                  color: _page == 1
                      ? Theme.of(context).accentColor
                      : Theme.of(context).textTheme.caption.color,
                  onPressed: () {
                    print(Constants().validateLogin());
                    Constants().validateLogin().then((value) => {
                          if (value)
                            {_pageController.jumpToPage(1)}
                          else
                            {_pageController.jumpToPage(5)}
                        });
                  }),
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 24.0,
                  color: Theme.of(context).primaryColor,
                ),
                color: _page == 2
                    ? Theme.of(context).accentColor
                    : Theme.of(context).textTheme.caption.color,
                onPressed: () => _pageController.jumpToPage(2),
              ),
              IconButton(
                  icon: IconBadge(
                    icon: Icons.shopping_cart,
                    size: 24.0,
                  ),
                  color: _page == 3
                      ? Theme.of(context).accentColor
                      : Theme.of(context).textTheme.caption.color,
                  onPressed: () {
                    print(Constants().validateLogin());
                    Constants().validateLogin().then((value) => {
                          if (value)
                            {_pageController.jumpToPage(3)}
                          else
                            {_pageController.jumpToPage(5)}
                        });
                  }),
              IconButton(
                  icon: Icon(
                    Icons.person,
                    size: 24.0,
                  ),
                  color: _page == 4
                      ? Theme.of(context).accentColor
                      : Theme.of(context).textTheme.caption.color,
                  onPressed: () {
                    print(Constants().validateLogin());
                    Constants().validateLogin().then((value) => {
                          if (value)
                            {_pageController.jumpToPage(4)}
                          else
                            {_pageController.jumpToPage(5)}
                        });
                  }),
              SizedBox(width: 7),
              FutureBuilder(
                future: _getCurrentLocation(),
                builder:
                    (BuildContext context, AsyncSnapshot<Position> snapshot) {
                  if (snapshot.hasData) {
                    longitude = snapshot.data.longitude.toDouble();
                    Constants().setLongitud(longitude);
                    latitude = snapshot.data.latitude.toDouble();
                    Constants().setLatitud(latitude);
                    readServicesData();
                    readSearchServicesData();
                    return Text("");
                  } else if (snapshot.hasError) {
                    return Text("Error");
                  } else {
                    LinearProgressIndicator();
                    return Text("");
                  }
                },
              ),
            ],
          ),
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 4.0,
          child: Icon(
            Icons.search,
          ),
          onPressed: () => _pageController.jumpToPage(2),
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
