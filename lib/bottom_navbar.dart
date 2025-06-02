import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kivaloop/Features/Screens/games_screen/game_screen.dart';
import 'package:kivaloop/Features/Screens/gift_screen/gift_screen.dart';
import 'package:kivaloop/Features/Screens/home_screen/home_screen.dart';
import 'package:kivaloop/Features/Screens/map_screen/map_screen.dart';
import 'package:kivaloop/Features/Screens/profile_screen/profile_screen.dart';

class BottomNavbarScreen extends StatefulWidget {
  BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int selectedIndex = 0;
  List screensList = [
    HomeScreen(),
    GameScreen(),
    MapScreen(),
    GiftScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
              print(selectedIndex);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff745340),

            unselectedItemColor: Colors.black.withOpacity(0.5),
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Iconsax.game), label: 'Game'),
              BottomNavigationBarItem(icon: Icon(Iconsax.map), label: 'Map'),
              BottomNavigationBarItem(icon: Icon(Iconsax.gift), label: 'Gift'),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.user),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: screensList[selectedIndex],
    );
  }
}
