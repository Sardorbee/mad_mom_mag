import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/list_monts.dart';

class MainDrwPage extends StatelessWidget {
  const MainDrwPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      duration: const Duration(seconds: 1),
      child: Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.015),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Member'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        const Text("name")
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.56,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {},
                        child: IconButton(
                            splashRadius: 20,
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.bell_solid,
                            )),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.015),
                            color: Colors.black12),
                        child: TextFormField(
                          onTap: (() {}),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search),
                              labelText: 'Search Your own Mad Mom Mag'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.008,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.height * 0.075,
                        height: MediaQuery.of(context).size.height * 0.075,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.015),
                            color: Colors.black87),
                        child: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                MonthsList(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Exclusively for you',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.02),
                        child: Text(
                          'See more',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.016,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.34,
                                    width: MediaQuery.of(context).size.height *
                                        0.25,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                          ),
                                          child: const SizedBox()),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top:
                                      MediaQuery.of(context).size.height * 0.25,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    child: const Text('MMM May'),
                                  ),
                                ),
                                Positioned(
                                  top:
                                      MediaQuery.of(context).size.height * 0.27,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    child: const Text('Mad Mom Members'),
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Memberships',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.02),
                        child: Text(
                          'See more',
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.016,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ListTile(
                  onTap: () {},
                  leading: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.height * 0.1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.015,
                      ),
                      child: const SizedBox(),
                    ),
                  ),
                  title: Text(
                    'Forum Membership',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03),
                  ),
                  trailing: Column(
                    children: [
                      Text(
                        "\$4.99",
                        style: TextStyle(
                            color: Colors.blue.shade600,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.03),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.035),
                        child: Text(
                          "year",
                          style: TextStyle(
                              color: Colors.blue.shade600,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                // ListTile(
                //   onTap: () {},
                //   leading: SizedBox(
                //     height: MediaQuery.of(context).size.height * 0.1,
                //     width: MediaQuery.of(context).size.height * 0.1,
                //     child: ClipRRect(
                //         borderRadius: BorderRadius.circular(
                //           MediaQuery.of(context).size.height * 0.015,
                //         ),
                //         child: const SizedBox()),
                //   ),
                //   title: Text(
                //     'Forum Membership',
                //     style: TextStyle(
                //         fontSize: MediaQuery.of(context).size.height * 0.03),
                //   ),
                //   trailing: Column(
                //     children: [
                //       Text(
                //         "\$4.99",
                //         style: TextStyle(
                //             color: Colors.blue.shade600,
                //             fontSize:
                //                 MediaQuery.of(context).size.height * 0.03),
                //       ),
                //       Container(
                //         margin: EdgeInsets.only(
                //             left: MediaQuery.of(context).size.height * 0.035),
                //         child: Text(
                //           "year",
                //           style: TextStyle(
                //               color: Colors.blue.shade600,
                //               fontSize:
                //                   MediaQuery.of(context).size.height * 0.018),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
