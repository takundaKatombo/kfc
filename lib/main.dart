import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kfc/ui/shared/appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final pages = [HomePage(), Deals(), MenuPage()];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: pages[_counter],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _counter,
        onTap: (index) {
          setState(() {
            _counter = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(children: <Widget>[
            CustomAppBar(),
            TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              tabs: const [
                Tab(text: 'Burgers'),
                Tab(text: 'Twister'),
                Tab(text: 'Chicken'),
                Tab(text: 'Box Club'),
                Tab(text: 'Nuggets'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Add your widgets for each tab here
                  SizedBox(
                    height: double.infinity, // Take up the remaining space
                    child: BurgersPage(),
                  ),
                  SizedBox(
                    height: double.infinity, // Take up the remaining space
                    child: BurgersPage(),
                  ),
                  SizedBox(
                    height: double.infinity, // Take up the remaining space
                    child: BurgersPage(),
                  ),
                  SizedBox(
                    height: double.infinity, // Take up the remaining space
                    child: BurgersPage(),
                  ),
                  SizedBox(
                    height: double.infinity, // Take up the remaining space
                    child: BurgersPage(),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}

class BurgersPage extends StatelessWidget {
  const BurgersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SingleChildScrollView(
          child: Column(
            children: [
              TimeOffers(
                price: 9.5,
                image: "assets/kfcbucket.jpeg",
              ),
              TimeOffers(
                price: 4.5,
                image: "assets/kfcreloaded.jpeg",
              ),
              TimeOffers(
                price: 5.5,
                image: "assets/kfcchipchicken.jpeg",
              )
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              TimeOffers(
                price: 4,
                image: "assets/kfcbucket.jpeg",
              ),
              TimeOffers(
                price: 4.5,
                image: "assets/kfcreloaded.jpeg",
              ),
              TimeOffers(
                price: 5.5,
                image: "assets/kfcchipchicken.jpeg",
              )
            ],
          ),
        )
      ]),
    );
  }
}

class Deals extends StatelessWidget {
  const Deals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          children: <Widget>[
            CustomAppBar(),
            ImagePageview(),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Delivery Deals',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/minicrusher.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/kfcbucket.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/kfcreloaded.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/kfcchipchicken.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Pickup Deals',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/minicrusher.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/kfcbucket.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/kfcreloaded.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/kfcchipchicken.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          children: <Widget>[
            CustomAppBar(),
            ImagePageview(),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Limited Time Offers',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/minicrusher.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/kfcbucket.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/kfcreloaded.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                  TimeOffers(price: 10, image: 'assets/kfcchipchicken.jpeg'),
                  SizedBox(
                    width: 18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Explre our Menu',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Menu(
                          data: "Chicken",
                          image: "assets/kfcbucket.jpeg",
                        ),
                        Menu(
                          data: "Burger",
                          image: "assets/kfcreloaded.jpeg",
                        ),
                        Menu(
                          data: "Twist",
                          image: "assets/kfcchipchicken.jpeg",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Menu(
                          data: "Chicken",
                          image: "assets/kfcbucket.jpeg",
                        ),
                        Menu(
                          data: "Burger",
                          image: "assets/kfcreloaded.jpeg",
                        ),
                        Menu(
                          data: "Twist",
                          image: "assets/kfcchipchicken.jpeg",
                        )
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TimeOffers extends StatelessWidget {
  final double price;
  final String image;
  const TimeOffers({
    super.key,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(image, fit: BoxFit.cover, width: 150, height: 130),
              Text(
                ' \$$price',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Transform.translate(
            offset: Offset(0, -20),
            child: Container(
              height: 40,
              width: 80,
              // margin: EdgeInsets.only(top: -35),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text('Buy Now'),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Menu extends StatelessWidget {
  final String data;
  final String image;
  const Menu({
    super.key,
    required this.data,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(image, fit: BoxFit.cover, width: 150, height: 130),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 40,
              width: 80,
              // margin: EdgeInsets.only(top: -35),
              child: Text(
                data,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ],
    );
  }
}

class ImagePageview extends StatelessWidget {
  const ImagePageview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/kfcbucket.jpeg',
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/kfcchipchicken.jpeg',
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/kfcreloaded.jpeg',
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
