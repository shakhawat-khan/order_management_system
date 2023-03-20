import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_management_system/src/utils/app_colors.dart';
import 'package:order_management_system/src/utils/nav_utils.dart';

import '../../utils/font_style.dart';
import '../order/view/add_order.dart';
import 'order_details.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Order List',style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500)),
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Image.asset("assets/back.png")),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: appbackGroundgradent
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 40),

          decoration: BoxDecoration(
              gradient: appbackGroundgradent
          ),
          child: Column(
            children: [
              ListView.builder(
                itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                  return Column(
                    children: [
                      GestureDetector(
                        onTap:(){
                          NavUtils.push(context, OrderDetails());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 112,
                          margin: EdgeInsets.only(left: 20,right: 20),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius:2,
                                offset: Offset(1,3), // Shadow position
                              ),

                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 105,
                                height: 112,
                                decoration: BoxDecoration(
                                  color:AppColors.listItemContainerColor
                                ),
                                child: Center(child: Image.asset("assets/image-cocki.png")),
                              ),
                              SizedBox(width: 15,),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:Colors.white
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("John Smith",style: GoogleFonts.poppins(color:Colors.black,fontSize: 18, fontWeight: FontWeight.w400) ,),
                                      SizedBox(height: 5,),
                                      Container(
                                        width: 157,
                                          child: Text("Remains of ancient build",style: GoogleFonts.poppins(color:AppColors.listItemfontsmalColor,fontSize: 12, fontWeight: FontWeight.w300) ,)),
                                      SizedBox(height: 10,),
                                      Container(
                                          child: Text("23 Feb 2023 - 28 Feb 2023",style: GoogleFonts.poppins(color:Colors.black,fontSize: 12, fontWeight: FontWeight.w300) ,)),
                                    ],
                                  )
                                ),
                              ),
                              Container(
                                child: Image.asset("assets/ic-delete.png"),
                              ),
                              SizedBox(width:30,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  );
                  }
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavUtils.push(context, OrderPage());
      },
      child: Icon(Icons.add,color: Colors.white,size: 22,),
      ),
    );
  }
}
