import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';
import 'package:order_management_system/src/modules/order/provider/functions.dart';
import 'package:order_management_system/src/modules/order/provider/providers.dart';
import 'package:order_management_system/src/provider/providers.dart';
import 'package:order_management_system/src/routing/app_route.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/font_style.dart';

class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ElevatedButton(
                onPressed: () {
                  ref.read(pickImageProvider.notifier).pickImageGallery();
                },
                child: const Text('pick image')),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width / 2,
              child: ref.watch(pickImageProvider) == null
                  ? const Text('')
                  : Row(
                      children: [
                        for (var intem in ref.watch(pickImageProvider))
                          Flexible(child: Image.file(intem!)),
                      ],
                    ),
            ),
            gapH12,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category Name',
                  style: kTextStylePoppinsTitel,
                ),
                gapH16,
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: InputDecorator(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Flexible(child: Text('Category')),
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
                  ),
                ),
                gapH20,
                Text(
                  'Allocated Job',
                  style: kTextStylePoppinsTitel,
                ),
                gapH16,
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: InputDecorator(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
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
              decoration: const InputDecoration(hintText: 'Enter Details '),
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
                  const InputDecoration(hintText: 'Details Description'),
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
                      TextField(
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () async {
                                  await selectDate(context);
                                },
                                child: Icon(Icons.date_range))),
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
                      TextField(
                        controller:
                            ref.watch(textControllerProvider('end_date')),
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () async {
                                  await selectDate(context);
                                },
                                child: Icon(Icons.date_range))),
                      )
                    ],
                  ),
                )

                // ElevatedButton(onPressed: () {}, child: const Text('Submit')),
                // ElevatedButton(
                //     onPressed: () {
                //       context.goNamed(AppRoute.orderList.name);
                //     },
                //     child: const Text('All Orders'))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
