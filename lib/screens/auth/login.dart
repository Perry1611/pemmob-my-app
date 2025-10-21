import 'package:flutter/material.dart';
// import 'package:my_app/partials/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xffffffff),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('lib/assets/images/login-ornament-top.png'),
            Column(
              children: [
                Image.asset('lib/assets/images/logo_secondary.png', width: 113),
                const SizedBox(height: 16),
                Text(
                  "Masuk atau Daftar",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 17),
                Container(
                  width: 372,
                  height: 57,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      contentPadding: EdgeInsets.only(
                        left: 17,
                        top: 17,
                        bottom: 17,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 370,
                  height: 57,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      "Selanjutnya",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                SizedBox(
                  width: 372,
                  child: Row(
                    children: [
                      Container(width: 160, height: 2, color: Colors.black),
                      const SizedBox(width: 3),
                      const Text('OR'),
                      const SizedBox(width: 3),
                      Container(width: 160, height: 2, color: Colors.black),
                    ],
                  ),
                ),
                Container(
                  width: 372,
                  height: 57,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(child: Text("Lanjutkan dengan Google")),
                ),
              ],
            ),
            Image.asset('lib/assets/images/login-ornament-bottom.png'),
          ],
        ),
      ),
    );
  }
}