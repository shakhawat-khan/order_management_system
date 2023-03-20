import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';
import 'package:order_management_system/src/modules/home/components/drawer.dart';
import 'package:order_management_system/src/modules/order/view/add_order.dart';
import 'package:order_management_system/src/routing/app_route.dart';
import 'package:order_management_system/src/utils/app_colors.dart';
import 'package:order_management_system/src/utils/font_style.dart';

import '../../../components/pie_chart.dart';
import '../../../components/title_circle.dart';

class HomePage extends StatefulWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

int currentIndexwidget =0;

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(email: widget.email),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            if(scaffoldKey.currentState!.isDrawerOpen){
              scaffoldKey.currentState!.closeDrawer();
              //close drawer, if drawer is open
            }else{
              scaffoldKey.currentState!.openDrawer();
              //open drawer, if drawer is closed
            }
          },
          icon: Image.asset("assets/ic-drawer.png"),

        ),
        title:  Image.asset("assets/ic-logo.png"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: appbackGroundgradent
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Color(0xff354CD8),//Colors.cyan,
              child: ClipOval(
                  child: Image.asset("assets/image-person.png",fit: BoxFit.cover,height: 35,width: 35,)),
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: appbackGroundgradent
        ),
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 30),
          child: Column(
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(gradient: kPiChartBackground),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                        ),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: PieChartSample3(),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitelCircle(
                              color: Colors.yellow,
                              text: '30% increased',
                            ),
                            TitelCircle(
                              color: Colors.purple,
                              text: '16% pending',
                            ),
                            TitelCircle(
                              color: Colors.green,
                              text: '15% waiting',
                            ),
                            TitelCircle(
                              color: Colors.red,
                              text: '40% loss',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
     // bottomNavigationBar: getBottomNav(),
    );
  }

  Widget getBottomNav() {


    return Container(

      decoration: BoxDecoration(
          gradient:LinearGradient(
            colors: [AppColors.bottomNavigationBackgrundStart, AppColors.bottomNavigationBackgrundEnd],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 0.8],
            tileMode: TileMode.clamp,
          )
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndexwidget,

        onTap: (index) {
          setState(() {
            currentIndexwidget=index;
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
            icon: Image.asset("assets/ic-nav-market.png"),
            label: "Market",

          ),
          BottomNavigationBarItem(
              icon: Image.asset("assets/ic-nav-trade.png"),
              label: "Trade"
          ),
          BottomNavigationBarItem(
              icon: Image.asset("assets/ic-nav-wallet.png"),
              label: "Wallet",
          ),
        ],
      ),
    );

  }
}
