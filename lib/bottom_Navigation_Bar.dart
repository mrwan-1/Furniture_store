import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/config.dart';

class BottomNavigationFurnituer extends StatefulWidget {
  const BottomNavigationFurnituer({super.key});

  @override
  State<BottomNavigationFurnituer> createState() =>
      _BottomNavigationFurnituerState();
}

class _BottomNavigationFurnituerState extends State<BottomNavigationFurnituer> {
  var selectedBottomNev = bottomNev.first;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.06, vertical: size.height * 0.02),
        padding: EdgeInsets.all(size.height * 0.01),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppConstantsColor.buttonColor.withOpacity(1),
                  offset: Offset(3, 5))
            ],
            color: AppConstantsColor.buttonColor,
            borderRadius: BorderRadius.circular(29)),
        // width:size.width,
        // height: ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
                bottomNev.length,
                (index) => GestureDetector(
                      onTap: () {
                        if (bottomNev[index] != selectedBottomNev) {
                          setState(() {
                            selectedBottomNev = bottomNev[index];
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25)),
                        child: Opacity(
                          opacity:
                              bottomNev[index] == selectedBottomNev ? 1 : 0.5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.006),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: bottomNev.first.icon),
                                Text(
                                  bottomNev.first.name,
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
          ],
        ),
      )),
    );
  }
}

class IconBottomNB {
  final String name;
  final Icon icon;
  IconBottomNB({required this.icon, required this.name});
}

List<IconBottomNB> bottomNev = [
  IconBottomNB(
      icon: Icon(
        Icons.home_outlined,
        color: Colors.white,
      ),
      name: 'Home'),
  IconBottomNB(
      icon: Icon(
        Icons.chat_outlined,
        color: Colors.white,
      ),
      name: 'Chat'),
  IconBottomNB(
      icon: Icon(
        Icons.account_circle_outlined,
        color: Colors.white,
      ),
      name: 'Account'),
];
