import 'package:flutter/material.dart';
import '../homepage/body.dart';

class TabbarPage extends StatelessWidget {
  const TabbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            color: Colors.lightBlue,
            child: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.list),
                  text: "Products",
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: "Cart",
                ),
                Tab(
                  icon: Icon(Icons.info),
                  text: "Info",
                ),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              children: [
                HomePageBody(),

                Center(
                  child: Text(
                    "Cart Page",
                    style: TextStyle(fontSize: 24),
                  ),
                ),

                Center(
                  child: Text(
                    "This is TabBar demo page",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}