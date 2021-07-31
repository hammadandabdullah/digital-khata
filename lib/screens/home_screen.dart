import 'package:flutter/material.dart';
import 'package:digital_khata/screens/add_contact_screen.dart';
import 'package:digital_khata/components/contact_button.dart';
import 'package:digital_khata/components/transaction_widget.dart';

List<ContactButton> contactsWidgets = [];
List<TransactionWidget> allTransactions = [];

class HomeScreen extends StatefulWidget {
  static String id = 'homescreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _buisnessName = 'HeyGamez';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
          icon: Icon(Icons.search),
        ),
        title: Text(_buisnessName),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.help),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddContact.id);
        },
        child: Icon(
          (Icons.person_add),
        ),
      ),
      body: ListView(
        children: contactsWidgets,
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    'Bhalwal',
    'Sargodha',
    'Rawalpindi',
    'Islamabad',
  ];

  final recentCities = [
    'Bhalwal',
    'Sargodha',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.red,
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: Text(
          suggestionList[index],
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
