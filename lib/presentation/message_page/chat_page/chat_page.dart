import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() => FocusScope.of(context).unfocus()),
        child: Scaffold(
          body: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.02),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                                MediaQuery.of(context).size.width * 0.02),
                            topLeft: Radius.circular(
                                MediaQuery.of(context).size.width * 0.02))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_sharp),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            CircleAvatar(
                                maxRadius:
                                    MediaQuery.of(context).size.height * 0.04,
                                // backgroundImage:
                                //     CachedNetworkImageProvider(imageUrl),
                                    ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sardorbee Dev',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '•',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01),
                                        child: const Text('online')),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.19,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    splashRadius:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                    onPressed: (() {}),
                                    icon: const Icon(CupertinoIcons.phone)),
                                IconButton(
                                    splashRadius:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                    onPressed: (() {}),
                                    icon: const Icon(CupertinoIcons.search)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Center(
                          child: Text(
                            DateTime.now().toString(),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.74,
                          width: MediaQuery.of(context).size.width,
                          // child: ChatPageBody()
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
