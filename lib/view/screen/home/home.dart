import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data_furniture.dart';
import 'package:flutter_application_1/model/show_model.dart';
import 'package:flutter_application_1/utils/config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndexOfCategory = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarHome(),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Furniture in \nUnique Style',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: size.height * 0.006,
              ),
              Text(
                'We have wind range of Furniture',
                style: TextStyle(color: Colors.grey),
              ),
              _categoriesHome(size),
              Container(
                width: size.width,
                height: size.height * 0.13,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(15)),
                child: ListView.builder(
                  itemCount: furniture.length,
                  itemBuilder: (context, index) {
                    ShowModel model = furniture[index];
                    return Row(
                      children: [
                        Container(
                          width: size.width * 0.25,
                          height: size.height * 0.13,
                          decoration: const BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))
                              // image: DecorationImage(image: )
                              ),
                        )
                      ],
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
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndexOfCategory = index;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
                width: size.width * 0.2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: selectedIndexOfCategory == index
                        ? Colors.grey[300]
                        : Colors.transparent),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      color: selectedIndexOfCategory == index
                          ? Colors.black
                          : Colors.grey[300]),
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
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
