import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:istan/pages/search_page.dart';
import 'package:istan/theme/colors.dart';

import 'home_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      // backgroundColor: black,
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      SearchPage(),
        Center(
          child: Text("Search Page", style: TextStyle(
            fontSize:20.0,
            fontWeight: FontWeight.bold,
            color: white,
          ),),
        ),
        Center(
          child: Text("Upload Page", style: TextStyle(
            fontSize:20.0,
            fontWeight: FontWeight.bold,
            color: white,
          ),),
        ),
        Center(
          child: Text("Love Page", style: TextStyle(
            fontSize:20.0,
            fontWeight: FontWeight.bold,
            color: white,
          ),),
        ),
        Center(
          child: Text("Account Page", style: TextStyle(
            fontSize:20.0,
            fontWeight: FontWeight.bold,
            color: white,
          ),),
        )
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }
  
  // Widget?
  PreferredSizeWidget? getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/images/camera_icon.svg",
              width: 30.0,
            ),
            Text(
              "Istagram",
              style: TextStyle(fontFamily: 'Billabong', fontSize: 35.0),
            ),
            SvgPicture.asset(
              "assets/images/message_icon.svg",
              width: 30.0,
            ),
          ],
        ),
      );
    } else if (pageIndex == 1) {
      return null;
    } else if (pageIndex == 2) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text("Upload"),
      );
    } else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text("Activity"),
      );
    } else {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text("Account"),
      );
    }
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      pageIndex == 3
          ? "assets/images/love_active_icon.svg"
          : "assets/images/love_icon.svg",
      pageIndex == 4
          ? "assets/images/acount_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return Container(
        width: double.infinity,
        height: 80.0,
        decoration: BoxDecoration(color: appFooterColor),
        child: Padding(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return InkWell(
                  onTap: () {
                    selectedTab(index);
                  },
                  child: SvgPicture.asset(bottomItems[index], width: 27.0));
            }),
          ),
        ));
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
