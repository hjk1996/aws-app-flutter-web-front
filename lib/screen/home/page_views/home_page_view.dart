import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final _queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: [
          TextField(
            controller: _queryController,
            decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
          ),
          const SizedBox(height: 10.0),
          Expanded(child: Container(color: Colors.red)),
        ],
      ),
    );
  }
}
