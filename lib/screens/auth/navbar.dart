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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: Colors.yellow,
        child: Icon(Icons.qr_code),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){},
                    child: Column(
                      children: [
                        Icon(Icons.home_outlined),
                        Text("Home")
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){},
                    child: Column(
                      children: [
                        Icon(Icons.home_outlined),
                        Text("Home")
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: (){},
                    child: Column(
                      children: [
                        Icon(Icons.home_outlined),
                        Text("Home")
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){},
                    child: Column(
                      children: [
                        Icon(Icons.home_outlined),
                        Text("Home")
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
