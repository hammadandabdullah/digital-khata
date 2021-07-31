import 'package:digital_khata/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:digital_khata/components/transaction_widget.dart';
import 'you_got_screen.dart';
import 'add_contact_screen.dart';
import 'you_gave_screen.dart';

class ContactScreen extends StatelessWidget {
  static String id = 'contactscreen';
  String contactName = newContactName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/placeholder_person.png'),
            ),
            SizedBox(
              width: 12,
            ),
            Text(contactName),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: allTransactions,
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
                        youGot_contactName: contactName,
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
                        youGave_contactName: contactName,
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
    );
  }
}
