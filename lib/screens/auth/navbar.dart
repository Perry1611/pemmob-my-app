import 'package:flutter/material.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {},
            shape: CircleBorder(),
            backgroundColor: Colors.yellow,
            tooltip: "E-Scan",
            child: Icon(Icons.qr_code_scanner, size: 45,),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 7,
          color: Colors.white,
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Navbar Kiri
                  Row(
                    children: [
                      _buildNavItem("Beranda", Icons.home_outlined, 0),
                      _buildNavItem("Jelajahi", Icons.travel_explore_outlined, 1),
                    ],
                  ),

                  // Navbar Kanan
                  Row(
                    children: [
                      _buildNavItem("Tugas", Icons.assignment, 2),
                      _buildNavItem("Profile", Icons.person, 3),
                    ],
                  ),
                ]
            ),
          ),
        )
    );
  }

  Widget _buildNavItem(String title, IconData icon, int index) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {},
      child: Column(
          children: [
            Icon(icon, size: 30,),
            Text(title,
              style: TextStyle(
                  fontSize: 15
              ),
            )
          ]
      ),
    );
  }
}