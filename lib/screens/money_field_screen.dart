import 'package:flutter/material.dart';

class MoneyFieldScreen extends StatelessWidget {
  const MoneyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Pengeluaran",
            ),
            elevation: 5,
            backgroundColor: Color(0xFFFEFEFE),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color(0xFFFEFEFE),
              child: Icon(
                Icons.done,
                color: Colors.black,
              ),
            ),
          ),
          body: Column(
            children: [],
          )),
    );
  }
}
