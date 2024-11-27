import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.form});
  final Map form;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: widget.form.keys.length,
          itemBuilder: (BuildContext context, int index) {
            var item = widget.form.keys.toList();
            return ListTile(
              title: Text("${item[index]} : ${widget.form[item[index]]}"),
            );
          },
        ),
      ),
    );
  }
}
