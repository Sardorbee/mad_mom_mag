import 'package:flutter/material.dart';


import 'chat_page/chat_page.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).unfocus()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04,
              left: MediaQuery.of(context).size.height * 0.025,
              right: MediaQuery.of(context).size.height * 0.025,
            ),
            child: SizedBox(
                child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Text(
                      'Messages',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    IconButton(
                      splashRadius: MediaQuery.of(context).size.width * 0.06,
                      iconSize: MediaQuery.of(context).size.width * 0.06,
                      onPressed: () {},
                      icon: const Icon(Icons.edit_calendar),
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.01,
                    // ),
                    IconButton(
                      iconSize: MediaQuery.of(context).size.width * 0.06,
                      splashRadius: MediaQuery.of(context).size.width * 0.06,
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.015),
                      color: Colors.white),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text('Search message'),
                        prefixIcon: Icon(Icons.search)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const ChatPage()),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.height * 0.05,
                    // backgroundImage: CachedNetworkImageProvider(imageUrl),
                  ),
                  title: Column(
                    children: [
                      const Text('Andrey Robertson'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text('asdf12as1f2sa1f2'),
                    ],
                  ),
                  trailing: const Text('9m ago'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.height * 0.05,
                    // backgroundImage: CachedNetworkImageProvider(imageUrl),
                  ),
                  title: Column(
                    children: [
                      const Text('Andrey Robertson'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text('asdf12as1f2sa1f2'),
                    ],
                  ),
                  trailing: const Text('9m ago'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    maxRadius: MediaQuery.of(context).size.height * 0.05,
                    // backgroundImage: CachedNetworkImageProvider(imageUrl),
                  ),
                  title: Column(
                    children: [
                      const Text('Andrey Robertson'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text('asdf12as1f2sa1f2'),
                    ],
                  ),
                  trailing: const Text('9m ago'),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
