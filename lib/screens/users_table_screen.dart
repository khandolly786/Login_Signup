import 'package:flutter/material.dart';
import 'db_helper.dart';

class UsersTableScreen extends StatefulWidget {
  @override
  _UsersTableScreenState createState() => _UsersTableScreenState();
}

class _UsersTableScreenState extends State<UsersTableScreen> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  void fetchUsers() async {
    final dbHelper = DBHelper();
    final db = await dbHelper.database;
    final result = await db.query('users');
    setState(() {
      users = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users List")),
      body: users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text("ID")),
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Phone")),
            DataColumn(label: Text("Email")),
          ],
          rows: users.map((user) {
            return DataRow(cells: [
              DataCell(Text(user['id'].toString())),
              DataCell(Text(user['name'])),
              DataCell(Text(user['phone'])),
              DataCell(Text(user['email'])),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
