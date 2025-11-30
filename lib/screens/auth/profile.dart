import 'package:flutter/material.dart';
import 'package:my_app/components/profile_widget/menu_list.dart';
import 'package:my_app/screens/auth/item_list.dart';
import 'package:my_app/service/auth_service.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const SizedBox(height: 19,),
            Expanded(
                child: Container(
                width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 7),
                      Container(
                        width: 97,
                        height: 99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image.asset('lib/assets/images/pp.png'),
                      ),
                      Text(
                          'Timothy Manuel Chandra',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        'timothystudent',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6)
                        ),
                      ),
                      const SizedBox(height: 26,),
                      Container(
                        width: 372,
                        height: 68,
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.24)
                            )
                          ]
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                Row(
                                  children: [
                                  Image.asset('lib/assets/images/coin_icon.png'),
                                  const SizedBox(width: 5,),
                                  Text(
                                      '9999',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20
                                    ),
                                  ),
                                  Text(
                                      'E-point',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                  ],
                                ),
                                Container(
                                  width: 2,
                                  height: 46,
                                  color: Colors.black.withOpacity(.6),
                                ),
                                Container(
                                  width: 126,
                                  height: 45,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff009421),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)
                                        )
                                      ),
                                      child: Text('Tukarkan')
                                  ),
                                )
                              ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: ListView(
                            children: [
                              MenuList(
                                  title: 'Histori',
                                  image: 'lib/assets/images/history.png'
                              ),
                              const SizedBox(height: 10,),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemListScreen()
                                    )
                                  );
                                },
                                child: MenuList(
                                    title: 'Tugas',
                                    image: 'lib/assets/images/assignment.png'
                                ),
                              ),
                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Peringkat',
                                  image: 'lib/assets/images/peringkat.png'
                              ),
                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Notifikasi',
                                  image: 'lib/assets/images/notifikasi.png'
                              ),
                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Kebijakan Privasi',
                                  image: 'lib/assets/images/kebijakan.png'
                              ),
                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Medali-ku',
                                  image: 'lib/assets/images/medali.png'
                              ),
                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Ganti Password',
                                  image: 'lib/assets/images/gembok.png'
                              ),
                              const SizedBox(height: 10,),
                              MenuList(
                                  title: 'Pusat Bantuan',
                                  image: 'lib/assets/images/qmark.png'
                              ),
                              const SizedBox(height: 10,),
                              InkWell(
                                onTap: () async => await AuthService().signOut(),
                                child: MenuList(
                                    title: 'Logout',
                                    image: 'lib/assets/images/logout.png'
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
            ))
          ],
        ),
      )
    );
  }
}
