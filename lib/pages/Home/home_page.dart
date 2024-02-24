import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_part1/Utils/Colors.dart';
import 'package:food_app_part1/pages/Home/main_food_page.dart';
import 'package:food_app_part1/pages/account_page.dart';
import 'package:food_app_part1/pages/acrchive_page.dart';
import 'package:food_app_part1/pages/cart/cart_history.dart';
import 'package:food_app_part1/pages/cart/cart_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _selectedIndex = 0;

  // List pages = [
  //   MainFoodPage(),
  //   Container(
  //     child: Center(
  //       child: Text("Archive"),
  //     ),
  //   ),
  //   Container(
  //     child: Center(
  //       child: Text("cart page"),
  //     ),
  //   ),
  //   Container(
  //     child: Center(
  //       child: Text("Account page"),
  //     ),
  //   ),
  // ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late PersistentTabController _controller;

  

  @override
  void initState() {
    super.initState();
    _controller= PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
        return [
          MainFoodPage(),
          ArchivePage(),
           CartHistory(),
           AccountPage(),

           
        ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: CupertinoColors.activeOrange,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.archivebox),
                title: ("Archive"),
                activeColorPrimary: CupertinoColors.activeOrange,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.shopping_cart),
                title: ("Cart"),
                activeColorPrimary: CupertinoColors.activeOrange,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.person_2),
                title: ("Me"),
                activeColorPrimary: CupertinoColors.activeOrange,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }

  @override
  Widget build(BuildContext context) {
    
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style5, // Choose the nav bar style with this property.
    );
  }
  }

