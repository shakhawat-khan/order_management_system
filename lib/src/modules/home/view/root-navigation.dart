import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../all_order_list/order_list.dart';
import 'home.dart';

class RootNavigation extends StatefulWidget {
  final String email;
  const RootNavigation({super.key, required this.email});

  @override
  _RootNavigationState createState() => _RootNavigationState(email);
}

int currentIndexwidget = 0;

class _RootNavigationState extends State<RootNavigation> {
  final String email;
  _RootNavigationState(this.email);

  final tabs = [
    HomePage(),
    OrderList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndexwidget],
      bottomNavigationBar: getBottomNav(),
    );
  }

  Widget getBottomNav() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          AppColors.bottomNavigationBackgrundStart,
          AppColors.bottomNavigationBackgrundEnd
        ],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        stops: [0.0, 0.8],
        tileMode: TileMode.clamp,
      )),
      child: BottomNavigationBar(
        currentIndex: currentIndexwidget,
        onTap: (index) {
          setState(() {
            currentIndexwidget = index;
          });
        },
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: Colors.white),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white,size: 21,),
            label: "Dash Board",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined,color: Colors.white,size: 21,),//Image.asset("assets/ic-nav-wallet.png"),
            label: "Crafting",
          ),
        ],
      ),
    );
  }
}
