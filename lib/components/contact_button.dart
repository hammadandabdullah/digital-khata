import 'package:digital_khata/screens/add_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:digital_khata/screens/contact_screen.dart';
import 'package:digital_khata/screens/home_screen.dart';

class ContactButton extends StatelessWidget {
  final String contactName;
  int amount;

  ContactButton({required this.contactName, this.amount = 0});

  var day = DateTime.now().day;
  var month = DateTime.now().month;
  var year = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, ContactScreen.id);
        },
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/placeholder_person.png'),
        ),
        title: Text(
          contactName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
            day.toString() + '/' + month.toString() + '/' + year.toString()),
      ),
    );
  }
}
