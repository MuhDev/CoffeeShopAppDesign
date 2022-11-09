import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_app/color.dart';
import 'package:new_app/main.dart';

class CoffeeDetailsScreen extends StatelessWidget {
  final Map<String, dynamic>? coffee;
  const CoffeeDetailsScreen({this.coffee, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.backgroundColor,
          body: Container(
            padding: const EdgeInsets.all(8),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          coffee!["image"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: double.infinity,
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              ModrenButton(
                                icon: Icons.arrow_back_ios_new,
                              ),
                              ModrenButton(
                                icon: Icons.favorite,
                              ),
                            ],
                          ),
                        ),
                        GlassMorphism(
                          blur: 20,
                          opacity: 0.2,
                          child: GlassMorphismCHild(coffee: coffee),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Description",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CoffeeDisc(),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Size",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizeRow(),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Price",
                            style: TextStyle(color: Colors.grey),
                          ),
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
                                  text: coffee!["price"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: MyColor.textColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                          height: 60,
                          width: 250,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: MyColor.secondColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: MyColor.secondColor.withOpacity(0.2),
                                  offset: const Offset(0, 2),
                                  blurRadius: 5)
                            ],
                          ),
                          child: Center(
                              child: Text(
                            "Order Now",
                            style: TextStyle(
                                color: MyColor.textColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}

class SizeRow extends StatelessWidget {
  const SizeRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: MyColor.secondColor, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
                child: Text(
              "S",
              style: TextStyle(
                color: MyColor.secondColor,
                fontSize: 20,
              ),
            )),
          ),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyColor.ContainerBackground),
            child: Center(
                child: Text(
              "M",
              style: TextStyle(
                color: MyColor.textColor,
                fontSize: 20,
              ),
            )),
          ),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyColor.ContainerBackground),
            child: Center(
                child: Text(
              "L",
              style: TextStyle(
                color: MyColor.textColor,
                fontSize: 20,
              ),
            )),
          ),
        ],
      ),
    );
  }
}

class CoffeeDisc extends StatelessWidget {
  const CoffeeDisc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text.rich(
        TextSpan(children: [
          const TextSpan(
            text:
                "A cappuccino is a coffe-based drink made primarilly from espresso and milk",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: "...Read More",
            style: TextStyle(
              color: MyColor.secondColor,
              fontSize: 16,
            ),
          ),
        ]),
      ),
    );
  }
}

class GlassMorphismCHild extends StatelessWidget {
  final Map<String, dynamic>? coffee;
  const GlassMorphismCHild({
    this.coffee,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      width: double.infinity,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LeftColumn(coffee: coffee),
          Column(
            children: [
              Row(
                children: const [
                  DetailButton(icon: Icons.blur_on, text: "Coffee"),
                  SizedBox(
                    width: 20,
                  ),
                  DetailButton(icon: Icons.water_drop, text: "Milk"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: 120,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        MyColor.ContainerBackground,
                        MyColor.backgroundColor
                      ],
                    ),
                  ),
                  child: const Center(
                      child: Text(
                    "Medium Roasted",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ))),
            ],
          )
        ],
      ),
    );
  }
}

class DetailButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const DetailButton({
    this.icon,
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: MyColor.secondColor,
          ),
          Text(
            text!,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          )
        ],
      ),
    );
  }
}

class LeftColumn extends StatelessWidget {
  final Map<String, dynamic>? coffee;
  const LeftColumn({
    this.coffee,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coffee!["type"],
          style: TextStyle(
              color: MyColor.textColor,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          coffee!["disc"],
          style: const TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 13,
        ),
        Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                child: Icon(
                  size: 20,
                  Icons.star,
                  color: MyColor.secondColor,
                ),
              ),
              TextSpan(
                text: " ${coffee!['rate']} ",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text: " (6,986)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GlassMorphism extends StatelessWidget {
  final double? blur;
  final double? opacity;
  final Widget? child;
  const GlassMorphism({this.blur, this.opacity, this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur!, sigmaY: blur!),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(opacity!),
            borderRadius: BorderRadius.circular(20),
          ),
          child: child,
        ),
      ),
    );
  }
}
