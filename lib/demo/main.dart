import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void onPress() {
    print("Menu clicked");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          backgroundColor: Colors.blue,

          leading: IconButton(
            onPressed: onPress,
            icon: const Icon(Icons.menu),
          ),

          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),

        body: SafeArea(
          child: Column(
            children: [

              // Text nhiều màu
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                  ),

                  text: "Hello",

                  children: [
                    TextSpan(
                      text: " Cô ",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    TextSpan(
                      text: " Giáo ",
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Hình ảnh
              Image.asset(
                "assets/images/hinhanh.jpg",
                width: 450,
                height: 250,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(

          backgroundColor: Colors.blue,

          items: const [

            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
            ),

            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),

            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
