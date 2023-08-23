import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/presentation/app_routes.dart';
import 'package:mad_mom_mag/presentation/forget_password/create_new_pass.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Text(
            "Profile",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.033,
                fontFamily: 'Fjalla'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(
            children: [
              CircleAvatar(
                maxRadius: MediaQuery.of(context).size.height * 0.05,
                backgroundImage: const AssetImage('assets/images/mad_mom.png'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nasick Nadeer',
                    style: TextStyle(
                        fontFamily: 'Fjalla',
                        fontSize: MediaQuery.of(context).size.height * 0.024),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'nasicknadeer@uvd.com',
                    style: TextStyle(
                        fontFamily: 'Fjalla',
                        fontSize: MediaQuery.of(context).size.height * 0.020),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          Column(
            children: [
              Card(
                color: Colors.black12,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                    onTap: () {},
                    leading: const Text(
                      'Notifications',
                      style: TextStyle(fontFamily: 'Fjalla'),
                    ),
                    trailing: CupertinoSwitch(
                      activeColor: Colors.black,
                      value: ischecked,
                      onChanged: (value) {
                        setState(() {
                          ischecked = !ischecked;
                        });
                      },
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Card(
                color: Colors.black12,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                  onTap: () {},
                  leading: const Text(
                    'MAGAZINES',
                    style: TextStyle(fontFamily: 'Fjalla'),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Card(
                color: Colors.black12,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => CreateNewPasswordPage()),
                      ),
                    );
                  },
                  leading: const Text(
                    'Change Password',
                    style: TextStyle(fontFamily: 'Fjalla'),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Card(
                color: Colors.black12,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                  onTap: () {},
                  leading: const Text(
                    'Privacy',
                    style: TextStyle(fontFamily: 'Fjalla'),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Card(
                color: Colors.black12,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                  onTap: () {},
                  leading: const Text(
                    'Terms & Conditions',
                    style: TextStyle(fontFamily: 'Fjalla'),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Card(
                color: Colors.black12,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                  onTap: () async{
                    await context.read<AuthCubit>().logOutUser();
                    if(context.mounted){
                      if (context.read<AuthCubit>().state
                        is AuthUnAuthenticatedState) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RouteNames.authStates, (route) => false);
                    }
                    }
                  },
                  leading: const Text(
                    'Sign Out',
                    style: TextStyle(fontFamily: 'Fjalla'),
                  ),
                  trailing: const Icon(Icons.login_outlined),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
