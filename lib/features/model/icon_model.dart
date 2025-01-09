import 'package:coffee_ui/features/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


final menu = [
  {
    'icon': Iconsax.home5,
    'destination': const HomePage(),
  },
  {
    'icon': Iconsax.heart ,
    'destination': const Center(child: Text('Favorite')),
  },
  {
    'icon': Iconsax.shopping_bag,
    'destination': const Center(child: Text('Shopping')),
  },
  {
    'icon':Iconsax.notification,
    'destination': const Center(child: Text('Notification')),
  },
];