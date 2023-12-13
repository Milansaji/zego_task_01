import 'package:flutter/material.dart';
import 'dart:math';

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class home_screen extends StatelessWidget {
  home_screen({super.key});
  static ValueNotifier<int> selectedIndex = ValueNotifier(0);

  final List<String> contacts = [
    'Milan Saji',
    'Sidharath s',
    'joel joseph',
    'joe abraham k',
    'raveen k pillai',
  ];
  final List<String> contacts_number = [
    '999999999999',
    '999999999999',
    '999999999999',
    '999999999999',
    '999999999999',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CallPage(callID: 'milan')),
                    );
                  },
                  icon: Icon(Icons.video_call),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.call),
                ),
              ],
            ),
            leading: Icon(Icons.person),
            title: Text(contacts[index]),
            onTap: () {
              _navigateToContactDetails(context, contacts[index]);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 10,
          );
        },
      ),
    );
  }
}

void _navigateToContactDetails(BuildContext context, String contactName) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Tapped on $contactName'),
    ),
  );
}

String user_id = Random().nextInt(10000).toString();

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID:
            0000000, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign:
            'use yours', // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: 'user_id',
        userName: 'user_1',
        callID: callID,
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall());
  }
}
