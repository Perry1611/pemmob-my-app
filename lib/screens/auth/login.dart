import 'package:flutter/material.dart';

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
                Image.asset('lib/assets/images/logo-login.png'),
                const SizedBox(height: 16),
                const Text(
                  'Masuk atau Daftar',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 372,
                  height: 57,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
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
                      backgroundColor: const Color(0xff009421),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      "Selanjutnya",
                      style: TextStyle(
                        color: const Color(0xffffffff),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 9),
                SizedBox(
                  width: 372,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 167, height: 2, color: Colors.black),
                      const SizedBox(width: 3),
                      Text('OR'),
                      const SizedBox(width: 3),
                      Container(width: 167, height: 2, color: Colors.black),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 372,
                  height: 57,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffffff),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('lib/assets/images/google-icon.png'),
                        const SizedBox(width: 4),
                        Text(
                          'Lanjutkan dengan Google',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Container(
                  width: 372,
                  height: 57,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffffff),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('lib/assets/images/facebook-icon.png'),
                        const SizedBox(width: 4),
                        Text(
                          'Lanjutkan dengan Facebook',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
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