import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Function() action;

  const CustomScaffold({
    super.key,
    required this.body,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: action, icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: body,
    );
  }
}
