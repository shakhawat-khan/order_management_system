import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:order_management_system/src/constants/app_sizes.dart';
import 'package:order_management_system/src/modules/order/provider/providers.dart';
import 'package:order_management_system/src/provider/providers.dart';
import 'package:order_management_system/src/routing/app_route.dart';

class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                  : Image.file(ref.watch(pickImageProvider)!, fit: BoxFit.fill),
            ),
            gapH12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: SizedBox(
                    height: 70,
                    width: 170,
                    child: InputDecorator(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: const Text('Category Name'),
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
                ),
                Flexible(
                  child: SizedBox(
                    height: 70,
                    width: 170,
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
                ),
              ],
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
            gapH12,
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
            gapH12,
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
            gapH12,
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Submit')),
                ElevatedButton(
                    onPressed: () {
                      context.goNamed(AppRoute.orderList.name);
                    },
                    child: const Text('All Orders'))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
