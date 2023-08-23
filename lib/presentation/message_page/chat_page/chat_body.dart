// import 'package:flutter/material.dart';

// class ChatPageBody extends StatefulWidget {
//   const ChatPageBody({Key? key}) : super(key: key);

//   @override
//   _ChatPageBodyState createState() => _ChatPageBodyState();
// }

// class _ChatPageBodyState extends State<ChatPageBody> {
//   final List<String> _messages = [];
//   final TextEditingController _textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
      
//       children: [
//         SingleChildScrollView(
//           child: Flexible(
//             child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding:  EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
//                   child: Container(
                    
//                     alignment: index % 2 == 0
//                         ? Alignment.centerLeft
//                         : Alignment.centerRight,
//                     decoration: index % 2 == 0
//                         ? BoxDecoration(
//                           color: Colors.amberAccent,
//                             borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(
//                                 MediaQuery.of(context).size.width * 0.02,
//                               ),
//                               topRight: Radius.circular(
//                                 MediaQuery.of(context).size.width * 0.02,
//                               ),
//                               topLeft: Radius.circular(
//                                 MediaQuery.of(context).size.width * 0.02,
//                               ),
//                             ),
//                           )
//                         : BoxDecoration(
//                           color: Colors.black,
//                             borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(
//                                 MediaQuery.of(context).size.width * 0.02,
//                               ),
//                               topRight: Radius.circular(
//                                 MediaQuery.of(context).size.width * 0.02,
//                               ),
//                               topLeft: Radius.circular(
//                                 MediaQuery.of(context).size.width * 0.02,
//                               ),
//                             ),
//                           ),
//                     height: MediaQuery.of(context).size.height * 0.1,
//                     width: MediaQuery.of(context).size.width * 0.2,
//                     padding:
//                         EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
//                     child: Text(_messages[index], style: TextStyle(color:index % 2 == 0 ?Colors.black:Colors.white ),),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.circular(30),
//           ),
//           margin: const EdgeInsets.all(8),
//           child: Row(
//             children: [
//               const SizedBox(width: 8),
//               Expanded(
//                 child: TextFormField(
//                   controller: _textEditingController,
//                   decoration: const InputDecoration(
//                     hintText: 'Type a message...',
//                     border: InputBorder.none,
//                   ),
//                   textInputAction: TextInputAction.send,
//                   onFieldSubmitted: (value) {
//                     _sendMessage();
//                   },
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   _sendMessage();
//                 },
//                 icon: const Icon(Icons.send),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   void _sendMessage() {
//     String message = _textEditingController.text.trim();
//     if (message.isNotEmpty) {
//       setState(() {
//         _messages.add(message);
//         _textEditingController.clear();
//       });
//     }
//   }
// }
