import 'package:flutter/material.dart';
import 'package:my_app/screens/auth/profile.dart';
import 'package:my_app/screens/beranda.dart';
import 'package:my_app/screens/jelajahi.dart';
import 'package:my_app/screens/auth/profile.dart';
import 'package:my_app/screens/tugas.dart';
import 'package:permission_handler/permission_handler.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    BerandaScreen(),
    JelajahiScreen(),
    TugasScreen(),
    ProfileScreen(),
  ];

  void _onTabTapper(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () async {
              var status = await Permission.camera.request();

              if(status.isGranted){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Kamera diberi izin'))
                );
              }
              else if (status.isDenied){
                await Permission.camera.request();
              } else if (status.isPermanentlyDenied){
                openAppSettings();
              }
            },
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
        ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
    );
  }

  Widget _buildNavItem(String title, IconData icon, int index) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () => _onTabTapper(index),
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