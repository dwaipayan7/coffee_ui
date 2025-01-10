import 'package:coffee_ui/features/cors/colors.dart';
import 'package:coffee_ui/features/model/coffee_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 17, 17, 17),
                    Color.fromARGB(255, 49, 49, 49),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(color: xsecondaryColor),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                          Text(
                            "Bethuadahari, Nadia",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: xsecondaryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xff2a2a2a),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/ic_search.png",
                                color: Colors.white,
                                height: 35,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search Your Coffee",
                                    hintStyle: TextStyle(
                                        color: xsecondaryColor, fontSize: 18),
                                    contentPadding: EdgeInsets.all(0),
                                    isDense: true,
                                  ),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 60,
                        width: 55,
                        decoration: BoxDecoration(
                          color: xprimaryColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(
                          Icons.tune,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/banner.png",
                      width: double.infinity,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        categorySelection(),
        SizedBox(
          height: 15,
        ),
        GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: listOfCoffee.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final coffee = listOfCoffee[index];

            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        coffee.image,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget categorySelection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: coffeeCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 25 : 10,
                right: index == coffeeCategories.length - 1 ? 25 : 10,
              ),
              decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? xprimaryColor
                      : xsecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(7)),
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                coffeeCategories[index],
                style: TextStyle(
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 15,
                    color:
                        selectedIndex == index ? Colors.white : Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
