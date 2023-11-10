import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data_furniture.dart';
import 'package:flutter_application_1/model/show_model.dart';
import 'package:flutter_application_1/utils/config.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndexOfCategory = 0;
  void Function(BuildContext)? onPressed;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarHome(),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Furniture in \nUnique Style',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: size.height * 0.006,
              ),
              const Text(
                'We have wind range of Furniture',
                style: TextStyle(color: Colors.grey),
              ),
              _categoriesHome(size),
              Container(
                width: size.width,
                height: size.height * 0.60,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: furniture.length,
                  itemBuilder: (context, index) {
                    ShowModel model = furniture[index];
                    return Slidable(
                      dragStartBehavior: DragStartBehavior.start,
                      endActionPane: const ActionPane(
                        motion: DrawerMotion(),
                        children: [
                          SlidableAction(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            // An action can be bigger than the others.
                            onPressed: doNothing,
                            backgroundColor: AppConstantsColor.buttonColor,
                            foregroundColor: Colors.white,
                            icon: Icons.favorite_border,
                          ),
                          SlidableAction(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            onPressed: doNothing,
                            backgroundColor: AppConstantsColor.button2Color,
                            foregroundColor: Colors.white,
                            icon: Icons.shopping_cart_outlined,
                          ),
                        ],
                      ),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height * 0.006),
                        width: size.width,
                        height: size.height * 0.13,
                        decoration: BoxDecoration(
                          // border: Border.all(width: 0.1, color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                          // color: AppConstantsColor.backgroundColor,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.25,
                              height: size.height * 0.13,
                              decoration: const BoxDecoration(
                                // image: DecorationImage(image: FileImage(model.imageUrl)),
                                // color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                              ),
                              child: Image.asset(
                                model.imageUrl,
                                fit: BoxFit.cover,
                                height: size.height * 0.001,
                                width: size.width * 0.1,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.02),
                              width: size.width * 0.60,
                              height: size.height * 0.12,
                              // color: Colors.pink,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    model.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    model.subTitle,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey[500]),
                                  ),
                                  Text(
                                    '\$${model.price}',
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//categoriesHome
  Widget _categoriesHome(Size size) {
    return Container(
      margin:
          EdgeInsets.only(bottom: size.height * 0.009, top: size.height * 0.03),
      alignment: Alignment.center,
      width: size.width,
      height: size.height * 0.06,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndexOfCategory = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
                width: size.width * 0.2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: selectedIndexOfCategory == index
                        ? Colors.grey[200]
                        : Colors.transparent),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      color: selectedIndexOfCategory == index
                          ? Colors.black
                          : Colors.grey[500]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//AppBar
class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading:
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}

void doNothing(BuildContext context) {}

class MyCustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(w / 2, h * 0.5, 0, h);

    // path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
