import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_management_system/src/models/orders_models.dart';
import 'package:order_management_system/src/utils/app_colors.dart';
import 'package:order_management_system/src/utils/nav_utils.dart';

import '../../utils/font_style.dart';
import '../order/view/add_order.dart';
import 'order_details.dart';

class OrderList extends ConsumerStatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  ConsumerState<OrderList> createState() => _OrderListState();
}

class _OrderListState extends ConsumerState<OrderList> {
  List<Orders> totalOrders = [];
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState

    if (user!.uid == '8CPgxNn0WiPXk1eFgSh10FkZjNJ2') {
      FirebaseFirestore.instance
          .collection('orders')
          .snapshots()
          .listen((event) {
        mapRecords(event);
      });
    } else {
      FirebaseFirestore.instance
          .collection('orders')
          .where('user_id', isEqualTo: user!.uid)
          .snapshots()
          .listen((event) {
        mapRecords(event);
      });
    }

    fetchData();
    super.initState();
  }

  fetchData() async {
    if (user!.uid == '8CPgxNn0WiPXk1eFgSh10FkZjNJ2') {
      var records = await FirebaseFirestore.instance.collection('orders').get();
      mapRecords(records);
    } else {
      var records = await FirebaseFirestore.instance
          .collection('orders')
          .where('user_id', isEqualTo: user!.uid)
          .get();
      mapRecords(records);
    }
  }

  void mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var list = records.docs
        .map(
          (order) => Orders(
            orderId: order.id,
            allocatedJob: order['allocated_job'],
            categoryName: order['category_name'],
            contactPersonName: order['contact_person_name'],
            contactPersonNumber: order['contact_person_number'],
            details: order['details'],
            startDate: order['start_date'],
            endDate: order['end_date'],
            imagePath: order['image_path'],
            rawMaterial: order['raw_material'],
            userId: order['user_id'],
          ),
        )
        .toList();

    setState(() {
      totalOrders = list;
    });
  }

  deleteItem(String id) {
    FirebaseFirestore.instance.collection('orders').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Order List',
            style:
                GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500)),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("assets/back.png"),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: appbackGroundgradent),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 40),
          decoration: BoxDecoration(gradient: appbackGroundgradent),
          child: Column(
            children: [
              ListView.builder(
                  itemCount: totalOrders.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            NavUtils.push(context, OrderDetails());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 112,
                            margin: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 2,
                                  offset: Offset(1, 3), // Shadow position
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 105,
                                  height: 112,
                                  decoration: BoxDecoration(
                                      color: AppColors.listItemContainerColor),
                                  child: Center(
                                      child: Image.asset(
                                          "assets/image-cocki.png")),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Container(
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            totalOrders[index].categoryName,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                              width: 157,
                                              child: Text(
                                                "Remains of ancient build",
                                                style: GoogleFonts.poppins(
                                                    color: AppColors
                                                        .listItemfontsmalColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                              child: Text(
                                            "23 Feb 2023 - 28 Feb 2023",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300),
                                          )),
                                        ],
                                      )),
                                ),
                                InkWell(
                                  onTap: () {
                                    deleteItem(totalOrders[index].orderId);

                                    print(totalOrders[index].orderId);
                                    print('hello');
                                  },
                                  child: Container(
                                    child: Image.asset("assets/ic-delete.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavUtils.push(context, OrderPage());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}
