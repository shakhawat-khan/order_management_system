import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';
import 'package:order_management_system/src/modules/order/provider/functions.dart';
import 'package:order_management_system/src/modules/order/provider/providers.dart';
import 'package:order_management_system/src/provider/providers.dart';
import 'package:order_management_system/src/routing/app_route.dart';
import 'package:order_management_system/src/utils/app_colors.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/font_style.dart';
import '../../../utils/nav_utils.dart';

class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Add New Order',style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500)),
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
        decoration: BoxDecoration(
            gradient: appbackGroundgradent
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Text(
                'Image Add',
                style: kTextStylePoppinsTitel,
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      ref.read(pickImageProvider.notifier).pickImageGallery();
                    },
                    child: Container(
                      width: 152,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.inputBorderColor,width: 0.5)
                        ),
                        child: Image.asset("assets/ic-upload.png")),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      Container(
                          width: 82,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.inputBorderColor,width: 0.5)
                          ),
                         ),
                      SizedBox(height: 5,),
                      Container(
                          width: 82,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.inputBorderColor,width: 0.5)
                          ),
                          ),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      Container(
                        width: 82,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.inputBorderColor,width: 0.5)
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 82,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.inputBorderColor,width: 0.5)
                        ),
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
                padding: EdgeInsets.only(left: 15,right: 15,top: 8),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.inputBorderColor,width: 0.5)
                ),
                child: DropdownButton(
                  isExpanded: true,
                  icon: Image.asset("assets/ic-downarrow-dropdown.png"),
                  underline: SizedBox(),
                  hint: Flexible(
                      child: Text('Category Name', style: kTextStylePoppinsTitel,)),
                  items: <String>['Sample Order','Final Order']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: ref.watch(dropdown1Provider),
                  onChanged: (value) {
                    ref.read(dropdown1Provider.notifier)
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
                padding: EdgeInsets.only(left: 15,right: 15,top: 8),
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.inputBorderColor,width: 0.5)
                ),
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
                  borderSide: const BorderSide(color: AppColors.inputBorderColor, width: 0.0),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Enter Details '
            ),
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
            decoration:
                const InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.inputBorderColor, width: 0.0),
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
                'order_description',
              ),
            ),
            decoration: const InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.inputBorderColor, width: 0.0),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'contact person name', prefixIcon: Icon(Icons.abc)),
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
                'order_phoneNumber',
              ),
            ),
            decoration: const InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.inputBorderColor, width: 0.0),
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
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.inputBorderColor, width: 0.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: InkWell(
                              onTap: () async {
                                await selectDate(context);
                              },
                              child: Image.asset("assets/ic-calendar.png"))),
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
                    SizedBox(height: 10,),
                    TextField(
                      controller:
                          ref.watch(textControllerProvider('end_date')),
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.inputBorderColor, width: 0.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: InkWell(
                              onTap: () async {
                                await selectDate(context);
                              },
                              child: Image.asset("assets/ic-calendar.png"))),
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
                        decoration:
                        BoxDecoration(gradient: kGradientColorBlue),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () {

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
              SizedBox(height: 40,),
              ]),
          ),
        ),
      ),
    );
  }
}
