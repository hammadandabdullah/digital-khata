import 'package:digital_khata/screens/you_got_screen.dart';
import 'package:flutter/material.dart';
import 'contact_screen.dart';
import 'home_screen.dart';
import 'package:digital_khata/components/contact_button.dart';
import 'you_gave_screen.dart';

String newContactName = '';
String newContactNumber = '';

class AddContact extends StatelessWidget {
  static String id = 'addcontact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
        actions: [
          IconButton(
            onPressed: () {
              contactsWidgets.add(
                ContactButton(contactName: newContactName),
              );
              Navigator.pop(context);
              Navigator.pushNamed(context, ContactScreen.id);
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Name ',
              ),
              autofocus: true,
              onChanged: (newValue) {
                newContactName = newValue;
              },
            ),
            SizedBox(
              height: 60,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Phone Number ',
              ),
              onChanged: (newValue) {
                newContactNumber = newValue;
              },
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YouGotScreen(
                          youGot_contactName: newContactName,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text('You Got'),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YouGaveScreen(
                          youGave_contactName: newContactName,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text('You Gave'),
                      Icon(Icons.remove),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
