import 'package:coffee_ui/features/cors/colors.dart';
import 'package:coffee_ui/features/model/coffee_model.dart';
import 'package:coffee_ui/features/presentation/pages/coffee_details_page.dart';
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
      padding: EdgeInsets.zero,
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
                    Color(0xFF111111),
                    Color(0xFF313131),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Text(
                            "Bethuadahari, Nadia",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white.withOpacity(0.7),
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search Your Coffee",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 55,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
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
        const SizedBox(height: 15),
        categorySelection(),
        const SizedBox(height: 15),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 0.8,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: listOfCoffee.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final coffee = listOfCoffee[index];
            return coffeeCard(coffee);
          },
        ),
      ],
    );
  }

  Widget categorySelection() {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
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
                right: 15,
              ),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Colors.orangeAccent
                    : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(7),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Text(
                coffeeCategories[index],
                style: TextStyle(
                  fontWeight: selectedIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: 14,
                  color: selectedIndex == index ? Colors.white : Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget coffeeCard(Coffee coffee) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CoffeeDetailsPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                coffee.image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              coffee.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              coffee.type,
              style: TextStyle(color: xsecondaryColor),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${coffee.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: xprimaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
