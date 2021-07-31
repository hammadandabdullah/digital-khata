import 'package:flutter/material.dart';
import 'package:digital_khata/screens/home_screen.dart';

class TransactionWidget extends StatelessWidget {
  final int amount;
  final bool youGot;

  TransactionWidget({required this.amount, required this.youGot});

  var day = DateTime.now().day;
  var month = DateTime.now().month;
  var year = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(
          'Rs. ' + amount.toString(),
          style: TextStyle(
            color: youGot ? Colors.green : Colors.red,
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
