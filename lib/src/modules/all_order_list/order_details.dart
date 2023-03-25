import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_management_system/src/utils/app_colors.dart';

import '../../models/orders_models.dart';
import '../../utils/font_style.dart';

class OrderDetails extends StatefulWidget {
  //const OrderDetails({Key? key}) : super(key: key);
  Orders orders;
  OrderDetails(this.orders);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final List<String> SliderImages = [
    "assets/image-cocki.png",
    "assets/image-cocki.png",
    "assets/image-cocki.png",
  ];
  late PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Order Details',
            style:
                GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500)),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/back.png")),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: appbackGroundgradent),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: appbackGroundgradent),
        child: Column(
          children: [
            Container(
              height: 200,
              child: PageView.builder(
                  itemCount: widget.orders.productImage.length,
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  pageSnapping: true,
                  onPageChanged: (page) {
                    setState(() {
                      activePage = page;
                    });
                  },
                  itemBuilder: (context, item) {
                    return Container(
                      child:
                          Image.network("${widget.orders.productImage[item]}"),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  indicators(widget.orders.productImage.length, activePage),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.bottomNavigationBackgrundEnd),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: Text(
                      "${widget.orders.startDate} -- ${widget.orders.endDate}",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    )),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 45),
                        decoration: BoxDecoration(
                            //gradient: appbackGroundgradent
                            color: Colors.white),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Category Name-',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  '${widget.orders.categoryName != null ? widget.orders.categoryName : "Final Order"}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors
                                          .bottomNavigationBackgrundEnd),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Allocated Job-',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  '${widget.orders.allocatedJob != null ? widget.orders.allocatedJob : "Design"}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors
                                          .bottomNavigationBackgrundEnd),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Rmd-',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors
                                          .bottomNavigationBackgrundEnd),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 285,
                                  child: Text(
                                    '${widget.orders.rawMaterial != "" ? widget.orders.rawMaterial : "Remains of ancient build exist in the neighborhood ancient build exist in the"}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Details Description-',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors
                                          .bottomNavigationBackgrundEnd),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 285,
                                  child: Text(
                                    '${widget.orders.details != "" ? widget.orders.details : "Remains of ancient build exist in the neighborhood ancient build exist in the"}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'C.Person Name-',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  '${widget.orders.contactPersonName != "" ? widget.orders.contactPersonName : "No Name avilable"}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors
                                          .bottomNavigationBackgrundEnd),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'C.Person Number-',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  '${widget.orders.contactPersonNumber != "" ? widget.orders.contactPersonNumber : "No Number avilable"}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors
                                          .bottomNavigationBackgrundEnd),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection('orders')
                                    .doc(widget.orders.orderId)
                                    .delete();
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 50,
                                width: 285,
                                margin: EdgeInsets.only(left: 15, right: 15),
                                decoration: BoxDecoration(
                                    color: AppColors.redButtonBackColor
                                        .withOpacity(0.96)),
                                child: Center(
                                  child: Text(
                                    'Cancel Order',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.bottomNavigationBackgrundEnd
                : AppColors.bottomNavigationBackgrundEnd.withOpacity(0.2),
            shape: BoxShape.circle),
      );
    });
  }
}
