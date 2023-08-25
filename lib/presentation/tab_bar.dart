import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/tab_bar_cubit/tabbar_cubit.dart';
import 'package:mad_mom_mag/presentation/articles/articles.dart';

import 'package:mad_mom_mag/presentation/profile_page/profile_page.dart';
import 'package:mad_mom_mag/presentation/websites/websites.dart';

import 'bookmark_page/bookmark_page.dart';
import 'home_page/drawer_page.dart';
import 'message_page/message_page.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  final List<Widget> _pages = [
    const HomePage(),
    const WebsitesScreen(),
    const ArticlesScreen(),
    const MessagePage(),
    const BookmarkPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      child: Scaffold(
        body: IndexedStack(
          index: context.watch<NavbarCubit>().state,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          unselectedItemColor: Colors.black12,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.teal,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.web,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.article,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.view_cozy,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: '',
            ),
          ],
          currentIndex: context.watch<NavbarCubit>().state,
          onTap: (index) {
            context.read<NavbarCubit>().updateScreen(index);
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:madmagazine/screens/profile_page/profile_page.dart';

// import '../bookmark_page/bookmark_page.dart';
// import '../home_page/home_page.dart';
// import '../message_page/message_page.dart';

// class TabBarScreen extends StatefulWidget {
//   TabBarScreen({super.key});

//   @override
//   State<TabBarScreen> createState() => _TabBarScreenState();
// }

// class _TabBarScreenState extends State<TabBarScreen> {
//   int _selectedIndex = 3;

//   final List<Widget> _pages =  [
//     const HomePage(),
//     MessagePage(),
//     const BookmarkPage(),
//     const ProfilePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;

//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         elevation: 10,
//         unselectedItemColor: Colors.black12,
//         selectedItemColor: Colors.black,
//         backgroundColor: Colors.teal,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.view_cozy,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.bookmark,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//             ),
//             label: '',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:madmagazine/screens/profile_page/profile_page.dart';

// import '../bookmark_page/bookmark_page.dart';
// import '../home_page/home_page.dart';
// import '../message_page/message_page.dart';

// class TabBarScreen extends StatefulWidget {
//   TabBarScreen({super.key});

//   @override
//   State<TabBarScreen> createState() => _TabBarScreenState();
// }

// class _TabBarScreenState extends State<TabBarScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages =  [
//    const HomePage(),
//     MessagePage(),
//    const BookmarkPage(),
//    const  ProfilePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       print(_selectedIndex);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),
//       child: BottomNavigationBar(
//         elevation: 10,
//         unselectedItemColor: Colors.black12,
//         selectedItemColor: Colors.black,
//         backgroundColor: Colors.teal,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.view_cozy,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.bookmark,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.person,
//               ),
//               label: ''),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
