import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';
import 'package:order_management_system/src/modules/order/provider/functions.dart';
import 'package:order_management_system/src/modules/order/provider/providers.dart';
import 'package:order_management_system/src/provider/providers.dart';
import 'package:order_management_system/src/routing/app_route.dart';
import 'package:order_management_system/src/utils/app_colors.dart';
import 'package:path_provider/path_provider.dart';

import '../../../models/orders_models.dart';
import '../../../utils/font_style.dart';
import '../../../utils/nav_utils.dart';

class OrderPage extends ConsumerStatefulWidget {
  const OrderPage({super.key});

  @override
  ConsumerState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  var userId;
  @override
  void initState() {
    // TODO: implement initState

    userId =FirebaseAuth.instance.currentUser?.uid!;
    print("user id ......${FirebaseAuth.instance.currentUser?.uid}");
    super.initState();
  }

  TextEditingController dateStart = TextEditingController();
  TextEditingController dateEnd = TextEditingController();

  addItem(Orders orders) {

    FirebaseFirestore.instance.collection('orders').add(orders.toJson());
    //FirebaseFirestore.instance.collection("${userId}").add(orders.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Add New Order',
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
        decoration: BoxDecoration(gradient: appbackGroundgradent),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Image Add',
                    style: kTextStylePoppinsTitel,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          ref
                              .read(pickImageProvider.notifier)
                              .pickImageGallery();
                        },
                        child: Container(
                            width: 152,
                            height: 90,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.inputBorderColor,
                                    width: 0.5)),
                            child: Image.asset("assets/ic-upload.png")),
                      ),
                      SizedBox(
                        width: 10,
                      ),

                      ref.watch(pickImageProvider).length>0? Expanded(
                        child: Container(
                          child: Wrap(
                            runSpacing: 2,
                            spacing: 2,
                            children: ref.watch(pickImageProvider).map((e) =>   GestureDetector(
                              onTap: ()async{
                                await showDialog(
                                    context: context,
                                    builder: (_) => ImageDialog(e!.path)
                                );
                              },
                              child: Container(
                                width: 82,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: AppColors.inputBorderColor,
                                        width: 0.5)),
                                child: Image.file(File(e!.path),fit: BoxFit.cover,),
                              ),
                            )
                            ).toList(),
                          ),
                        ),
                      ):
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              ref.read(pickImageProvider).forEach((element) {
                                print("Image path.......${element?.path}");
                              });
                            },
                            child: Container(
                              width: 82,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: AppColors.inputBorderColor,
                                      width: 0.5)),


                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 82,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.inputBorderColor,
                                    width: 0.5)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ref.watch(pickImageProvider).length>0?SizedBox(): Column(
                        children: [
                          Container(
                            width: 82,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.inputBorderColor,
                                    width: 0.5)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 82,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.inputBorderColor,
                                    width: 0.5)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  gapH16,
                  Text(
                    'Category Name',
                    style: kTextStylePoppinsTitel,
                  ),
                  gapH16,
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: AppColors.inputBorderColor, width: 0.5)),
                    child: DropdownButton(
                      isExpanded: true,
                      icon: Image.asset("assets/ic-downarrow-dropdown.png"),
                      underline: SizedBox(),
                      hint: Container(
                          child: Text(
                        'Category Name',
                        style: kTextStylePoppinsTitel,
                      )),
                      items: <String>['Sample Order', 'Final Order']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: ref.watch(dropdown1Provider),
                      onChanged: (value) {
                        ref
                            .read(dropdown1Provider.notifier)
                            .update((state) => value!);
                      },
                    ),
                  ),
                  gapH20,
                  Text(
                    'Allocated Job',
                    style: kTextStylePoppinsTitel,
                  ),
                  gapH16,
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: AppColors.inputBorderColor, width: 0.5)),
                    child: DropdownButton(
                      icon: Image.asset("assets/ic-downarrow-dropdown.png"),
                      underline: SizedBox(),
                      isExpanded: true,
                      hint: const Text('Allocated job'),
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                      items: <String>['Design', 'Mokeup', 'Production']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: ref.watch(dropdown2Provider),
                      onChanged: (value) {
                        ref
                            .read(dropdown2Provider.notifier)
                            .update((state) => value!);
                      },
                    ),
                  ),
                ],
              ),
              gapH20,
              Text(
                'RAW Material Details',
                style: kTextStylePoppinsTitel,
              ),
              gapH16,
              TextField(
                maxLines: 5,
                decoration: const InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.inputBorderColor, width: 0.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter Details '),
                controller: ref.watch(
                  textControllerProvider(
                    'order_rawMaterial',
                  ),
                ),
              ),
              gapH20,
              Text(
                'Details Description',
                style: kTextStylePoppinsTitel,
              ),
              gapH12,
              TextField(
                maxLines: 5,
                decoration: const InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.inputBorderColor, width: 0.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Details Description'),
                controller: ref.watch(
                  textControllerProvider(
                    'order_description',
                  ),
                ),
              ),
              gapH20,
              Text(
                'Contact Person Name',
                style: kTextStylePoppinsTitel,
              ),
              gapH16,
              TextFormField(
                keyboardType: TextInputType.name,
                controller: ref.watch(
                  textControllerProvider(
                    'contact_person_name',
                  ),
                ),
                decoration: const InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.inputBorderColor, width: 0.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'contact person name',
                    prefixIcon: Icon(Icons.abc)),
              ),
              gapH20,
              Text(
                'Contact Person Number',
                style: kTextStylePoppinsTitel,
              ),
              gapH16,
              TextFormField(
                keyboardType: TextInputType.number,
                controller: ref.watch(
                  textControllerProvider(
                    'contact_person_number',
                  ),
                ),
                decoration: const InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.inputBorderColor, width: 0.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.numbers),
                  hintText: 'contact person phone number',
                ),
              ),
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'Start Date',
                          style: kTextStylePoppinsTitel,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight:
                              FontWeight.w300),
                          controller: ref.watch(textControllerProvider('start_date')),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.inputBorderColor,
                                    width: 0.0),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: InkWell(
                                  onTap: () async {
                                    //dateStart.text = DateFormat('yyyy-MM-dd – kk:mm').format(await selectDate(context));
                                    ref.read(textControllerProvider('start_date')).text=DateFormat('dd-MM-yyyy').format(await selectDate(context));

                                  },
                                  child:
                                      Image.asset("assets/ic-calendar.png"))),
                        ),
                      ],
                    ),
                  ),
                  gapW16,
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'End Date',
                          style: kTextStylePoppinsTitel,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight:
                            FontWeight.w300),
                          controller:
                              ref.watch(textControllerProvider('end_date')),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.inputBorderColor,
                                    width: 0.0),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: InkWell(
                                  onTap: () async {
                                    ref.read(textControllerProvider('end_date')).text=DateFormat('dd-MM-yyyy').format(await selectDate(context));

                                  },
                                  child:
                                      Image.asset("assets/ic-calendar.png"))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: DecoratedBox(
                        decoration: BoxDecoration(gradient: kGradientColorBlue),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () {
                            addItem(
                                Orders(
                                allocatedJob: ref.read(dropdown2Provider)!,
                                categoryName: ref.read(dropdown1Provider)!,
                                id:FirebaseAuth.instance.currentUser?.uid,
                                contactPersonName: ref
                                    .read(textControllerProvider(
                                      'contact_person_name',
                                    ))
                                    .text,
                                contactPersonNumber: ref
                                    .read(textControllerProvider(
                                      'contact_person_number',
                                    ))
                                    .text,
                                details: ref
                                    .read(textControllerProvider(
                                      'order_description',
                                    ))
                                    .text,
                                startDate: 0,
                                endDate: 69,
                                imagePath: 'test',
                                rawMaterial: ref
                                    .read(textControllerProvider(
                                      'order_rawMaterial',
                                    ))
                                    .text,
                                )
                            );
                          },
                          child: Text(
                            'Submit  Order',
                            style: kTextStyleButtonText(Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final image;
  ImageDialog(this.image);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          InteractiveViewer(
            child: ClipRRect(

                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.file(File(image),fit: BoxFit.cover,width: 350,height: 300,)),
          ),
          Positioned(
            right: 5,
              top: -5,
              child: IconButton(
                icon: Icon(Icons.clear,size: 30,color: Colors.red,),
                onPressed: () {
                  Navigator.pop(context);

          },))
        ],
      ),
    );
  }
}
