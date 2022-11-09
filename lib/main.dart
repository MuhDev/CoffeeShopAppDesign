import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/Coffee.dart';
import 'package:new_app/animation.dart';
import 'package:new_app/coffe_detail.dart';
import 'package:new_app/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      if (_controller.value > 0.7) {
        isLoaded = true;
        setState(() {});
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    
  double height =MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: MyColor.backgroundColor,
        systemNavigationBarColor: MyColor.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.light,

      ),
      child: SafeArea(
        child: Stack(children:  [
          const MainPage(),
          AnimatedSplash(isLoaded: isLoaded, height: height, controller: _controller)
        ]),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyColor.backgroundColor,
        selectedItemColor: MyColor.secondColor,
        unselectedItemColor: const Color.fromARGB(255, 129, 125, 125),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "fav"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_rounded), label: "noti"),
        ],
      ),
      backgroundColor: MyColor.backgroundColor,
      body: Container(
        padding: const EdgeInsets.all(8),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const MyAppBar(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 300,
                      height: 100,
                      child: Text(
                        "Find the best coffee for you",
                        style: TextStyle(
                          fontSize: 35,
                          color: MyColor.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SearchBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    CoffeeTypeWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    const CoffeeRow(),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Special for you",
                        style: TextStyle(
                            fontSize: 18,
                            color: MyColor.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [
                              MyColor.ContainerBackground,
                              MyColor.backgroundColor
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: 140,
                                child: Image.asset(
                                  "assets/images/photo-1512568400610-62da28bc8a13.jpeg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                "5 Coffee Beans You Must Try!",
                                style: TextStyle(
                                  color: MyColor.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ]),
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
}

class CoffeeRow extends StatelessWidget {
  const CoffeeRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => CoffeeDetailsScreen(
                        coffee: Coffee.coffee[index],
                      )),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    MyColor.ContainerBackground,
                    MyColor.backgroundColor
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              width: double.infinity,
                              height: 150,
                              child: Image.asset(
                                Coffee.coffee[index]["image"],
                                fit: BoxFit.cover,
                              ),
                            )),
                        Container(
                          width: 60,
                          height: 25,
                          decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      size: 15,
                                      Icons.star,
                                      color: MyColor.secondColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        Coffee.coffee[index]["rate"].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: MyColor.textColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Coffee.coffee[index]["type"],
                          style: TextStyle(
                            color: MyColor.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          Coffee.coffee[index]["disc"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 47,
                    padding: const EdgeInsets.only(left: 20, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '\$ ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: MyColor.secondColor),
                              ),
                              TextSpan(
                                text: Coffee.coffee[index]["price"].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: MyColor.textColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: MyColor.secondColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: MyColor.secondColor.withOpacity(0.2),
                                  offset: const Offset(0, 2),
                                  blurRadius: 5)
                            ],
                          ),
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: MyColor.textColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: Coffee.coffee.length,
      ),
    );
  }
}

class CoffeeTypeWidget extends StatelessWidget {
  CoffeeTypeWidget({
    Key? key,
  }) : super(key: key);
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          final bool FirstOne = isFirst;
          isFirst = false;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Coffee.coffeeType[index],
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: FirstOne
                          ? MyColor.secondColor
                          : const Color.fromARGB(255, 129, 125, 125),
                      fontSize: 20),
                ),
                if (FirstOne)
                  SizedBox(
                      width: 10,
                      height: 10,
                      child: CircleAvatar(
                        backgroundColor: MyColor.secondColor,
                      ))
              ],
            ),
          );
        }),
        itemCount: Coffee.coffeeType.length,
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColor.ContainerBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          enabled: false,
          style: const TextStyle(fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Find your coffee..",
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
            ),
            icon: Icon(
              Icons.search,
              size: 25,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ModrenButton(
          icon: Icons.grid_view_rounded,
        ),
        Container(
          padding: const EdgeInsets.all(6),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MyColor.ContainerBackground,
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/person_kelvin.jpg",
                fit: BoxFit.fill,
              )),
        )
      ],
    );
  }
}

class ModrenButton extends StatelessWidget {
  final IconData? icon;
  final Function? onTap;
  const ModrenButton({
    this.icon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [MyColor.ContainerBackground, MyColor.backgroundColor],
          ),
        ),
        child: Icon(
          icon,
          color: const Color.fromARGB(255, 129, 125, 125),
          size: 30,
        ),
      ),
    );
  }
}
