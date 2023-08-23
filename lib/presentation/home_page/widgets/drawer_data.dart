import 'package:flutter/material.dart';
import 'package:mad_mom_mag/presentation/home_page/widgets/custom_listtile.dart';

class DrawerConst extends StatelessWidget {
  const DrawerConst({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: SizedBox(
        width: 200,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            CustomDrawerListTile(onTap: () {}, label: "Home", icon: Icons.home),
            CustomDrawerListTile(
                onTap: () {},
                label: "Profile",
                icon: Icons.person_outline_rounded),
            CustomDrawerListTile(
                onTap: () {}, label: "Forum", icon: Icons.forum),
            const Divider(
              color: Colors.white,
            ),
            CustomDrawerListTile(
                onTap: () {}, label: "Bookmark", icon: Icons.bookmark),
            CustomDrawerListTile(
                onTap: () {},
                label: "Notification",
                icon: Icons.notifications_none),
            CustomDrawerListTile(
                onTap: () {}, label: "Message", icon: Icons.message),
            const Divider(
              color: Colors.white,
            ),
            CustomDrawerListTile(
                onTap: () {}, label: "Settings", icon: Icons.settings),
            CustomDrawerListTile(
                onTap: () {}, label: "Help", icon: Icons.help_center_outlined),
            CustomDrawerListTile(
                onTap: () {},
                label: "Log Out",
                icon: Icons.power_settings_new_rounded),
          ],
        ),
      ),
    );
  }
}
