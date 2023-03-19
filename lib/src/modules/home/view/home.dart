import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';
import 'package:order_management_system/src/modules/home/components/drawer.dart';
import 'package:order_management_system/src/modules/order/view/order.dart';
import 'package:order_management_system/src/routing/app_route.dart';
import 'package:order_management_system/src/utils/font_style.dart';

import '../../../components/pie_chart.dart';
import '../../../components/title_circle.dart';

class HomePage extends StatelessWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(email: email),
      appBar: AppBar(
        title: const Text('EkopII'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
            gapH24,
            ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRoute.order.name);
              },
              child: Text('add order'),
            )
          ],
        ),
      ),
    );
  }
}
