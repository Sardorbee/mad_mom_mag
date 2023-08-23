import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:mad_mom_mag/presentation/home_page/widgets/drawer_data.dart';
import 'package:mad_mom_mag/presentation/home_page/home_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ZoomDrawerController _conttrol = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ZoomDrawer(
        menuScreen: const DrawerConst(),
        mainScreen: const MainDrwPage(),
        mainScreenScale: 0.17,
        borderRadius: MediaQuery.of(context).size.height * 0.03,
        angle: 0,
        controller: _conttrol,
        slideWidth: MediaQuery.of(context).size.width * 0.6,
      ),
    );
  }
}
