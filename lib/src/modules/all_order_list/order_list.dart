import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order List'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    leading: Image.asset('assets/ekopii.png'),
                    title: const Text('hello my friend'),
                  ),
                ),
              );
            }, childCount: 10),
          )
        ],
      ),
    );
  }
}
