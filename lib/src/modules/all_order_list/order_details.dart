import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_management_system/src/utils/app_colors.dart';

import '../../utils/font_style.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  final List<String> SliderImages = [
    "assets/image-cocki.png",
    "assets/image-cocki.png",
    "assets/image-cocki.png",
  ];
  late PageController _pageController=PageController(viewportFraction: 0.8);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
   int activePage =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Order Details',style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500)),
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
      body: Container(
        height: MediaQuery.of(context).size.height,

        decoration: BoxDecoration(
            gradient: appbackGroundgradent
        ),
        child: Column(
          children: [
            Container(

              height: 200,
              child: PageView.builder(
                itemCount: SliderImages.length,
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  pageSnapping: true,

                  onPageChanged: (page){
                    setState(() {
                      activePage = page;
                    });
                  },
                  itemBuilder: (context,item){
                  return Container(

                    child: Image.asset("${SliderImages[item]}"),);
                  }
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(SliderImages.length,activePage),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.bottomNavigationBackgrundEnd
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                        child: Text("Date - 23 Feb 2023 - 28 Feb 2023",style: GoogleFonts.poppins(color:Colors.white,fontSize: 15, fontWeight: FontWeight.w300) ,)),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,

                        margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 45),
                        decoration: BoxDecoration(
                            //gradient: appbackGroundgradent
                          color: Colors.white
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Text(
                                  'Category Name-',
                                  style:  GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w300,color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  'Sample',
                                  style:  GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500,color:AppColors.bottomNavigationBackgrundEnd),
                                ),
                                SizedBox(width: 20,),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Text(
                                  'Allocated Job-',
                                  style:  GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w300,color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  'Design',
                                  style:  GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500,color:AppColors.bottomNavigationBackgrundEnd),
                                ),
                                SizedBox(width: 20,),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Text(
                                  'Rmd-',
                                  style:  GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w300,color: AppColors.bottomNavigationBackgrundEnd),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Container(
                                  width: 285,
                                  child: Text(
                                    'Remains of ancient build exist in the neighborhood ancient build exist in the',
                                    style:  GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w300,color: Colors.black),
                                  ),
                                ),

                              ],
                            ),

                            SizedBox(height: 15,),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Text(
                                  'Details Description-',
                                  style:  GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w300,color: AppColors.bottomNavigationBackgrundEnd),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Container(
                                  width: 285,
                                  child: Text(
                                    'Remains of ancient build exist in the neighborhood ancient build exist in the',
                                    style:  GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w300,color: Colors.black),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Text(
                                  'C.Person Name-',
                                  style:  GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w300,color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  'John Smith',
                                  style:  GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500,color:AppColors.bottomNavigationBackgrundEnd),
                                ),
                                SizedBox(width: 20,),
                              ],
                            ),


                            SizedBox(height: 15,),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Text(
                                  'C.Person Number-',
                                  style:  GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w300,color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  '01758926754',
                                  style:  GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500,color:AppColors.bottomNavigationBackgrundEnd),
                                ),
                                SizedBox(width: 20,),
                              ],
                            ),
                            SizedBox(height: 30,),
                            Container(
                              height: 50,
                              width: 285,
                              margin: EdgeInsets.only(left: 15,right: 15),
                              decoration: BoxDecoration(
                                  color: AppColors.redButtonBackColor.withOpacity(0.96)
                              ),
                              child:Center(
                                child: Text(
                                  'Cancel Order',
                                  style:  GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),
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

  List<Widget> indicators(imagesLength,currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? AppColors.bottomNavigationBackgrundEnd : AppColors.bottomNavigationBackgrundEnd.withOpacity(0.2),
            shape: BoxShape.circle),
      );
    });
  }
}
