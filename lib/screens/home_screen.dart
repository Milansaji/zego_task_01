import 'package:flutter/material.dart';
import 'package:zego_task_01/screens/audio_call_screen.dart';
import 'package:zego_task_01/screens/video_call_screen.dart';

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
                          builder: (context) => video_call_screen(
                                name: contacts[index],
                                number: contacts_number[index],
                              )),
                    );
                  },
                  icon: Icon(Icons.video_call),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => audio_call_screen(
                              name: contacts[index],
                              number: contacts_number[index])),
                    );
                  },
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
