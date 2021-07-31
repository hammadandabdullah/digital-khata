import 'package:digital_khata/screens/add_contact_screen.dart';
import 'package:flutter/material.dart';
import 'contact_screen.dart';
import 'package:digital_khata/components/transaction_widget.dart';
import 'home_screen.dart';
import 'package:digital_khata/components/contact_button.dart';

class YouGaveScreen extends StatelessWidget {
  String youGave_contactName;

  YouGaveScreen({this.youGave_contactName = ''});
  int amount = 0;

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
            Text(youGave_contactName),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: TextField(
          autofocus: true,
          keyboardType: TextInputType.number,
          onChanged: (newValue) {
            amount = int.parse(newValue);
          },
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.red,
          ),
          decoration: InputDecoration(
            prefix: Text(
              'Rs. ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.red,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            hintText: '',
            suffix: IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.red,
              ),
              onPressed: () {
                allTransactions.add(
                  TransactionWidget(amount: amount, youGot: false),
                );

                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactScreen(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
