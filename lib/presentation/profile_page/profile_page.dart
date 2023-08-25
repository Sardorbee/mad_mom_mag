import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/auth_cubit/auth_cubit.dart';
import 'package:mad_mom_mag/cubitss/users_cubit/users_cubit.dart';
import 'package:mad_mom_mag/data/models/user_model/user_model.dart';
import 'package:mad_mom_mag/presentation/app_routes.dart';
import 'package:mad_mom_mag/presentation/profile_page/custom_profile_card.dart';
import 'package:mad_mom_mag/utils/constants/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileCubit>().getUserData();
    super.initState();
  }

  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<ProfileCubit, UserProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProfileSuccessState) {
          UserModel user = state.userModel;
          debugPrint(user.avatar);
          return Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    backgroundImage:
                        CachedNetworkImageProvider("$baseUrl${user.avatar}"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.username,
                        style: TextStyle(
                            fontFamily: 'Fjalla',
                            fontSize:
                                MediaQuery.of(context).size.height * 0.024),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        user.email,
                        style: TextStyle(
                            fontFamily: 'Fjalla',
                            fontSize:
                                MediaQuery.of(context).size.height * 0.020),
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
                  CustomCardProfile(
                    leadingText: 'Notifications',
                    onTap: () {},
                    widget: CupertinoSwitch(
                      activeColor: Colors.black,
                      value: ischecked,
                      onChanged: (value) {
                        setState(() {
                          ischecked = !ischecked;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  CustomCardProfile(
                    leadingText: 'MAGAZINES',
                    onTap: () {},
                    widget: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  CustomCardProfile(
                    leadingText: 'Change Password',
                    onTap: () {},
                    widget: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CustomCardProfile(
                    leadingText: 'Privacy',
                    onTap: () {},
                    widget: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  CustomCardProfile(
                    leadingText: 'Terms & Conditions',
                    onTap: () {},
                    widget: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CustomCardProfile(
                    leadingText: 'Sign Out',
                    onTap: () async {
                      await context.read<AuthCubit>().logOutUser();
                      if (context.mounted) {
                        if (context.read<AuthCubit>().state
                            is AuthUnAuthenticatedState) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, RouteNames.authStates, (route) => false);
                        }
                      }
                    },
                    widget: const Icon(Icons.login_outlined),
                  ),
                ],
              )
            ]),
          );
        } else if (state is ProfileLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Text("something went wrong");
        }
      },
    ));
  }
}
