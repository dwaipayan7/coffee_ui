import 'package:coffee_ui/features/cors/colors.dart';
import 'package:coffee_ui/features/model/icon_model.dart';
import 'package:flutter/material.dart';

class AppMainPage extends StatefulWidget {
  const AppMainPage({super.key});

  @override
  State<AppMainPage> createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  int indexMenu = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: xbackgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: List.generate(
            menu.length,
            (index) {
              Map items = menu[index];
              bool isActive = indexMenu == index;
              return Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      indexMenu = index;
                    });
                  },
                  child: SizedBox(
                    height: 70,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          items['icon'],
                          color: isActive ? xprimaryColor : xsecondaryColor,
                          size: 25,
                        ),
                        if(isActive) const SizedBox(height: 7,),
                        if(isActive) Container(
                          height: 5,
                          width: 10,
                          decoration: BoxDecoration(
                            color: xprimaryColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
