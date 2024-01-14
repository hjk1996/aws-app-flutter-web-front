import 'package:flutter/material.dart';
import 'package:flutter_web/providers/app_auth_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _queryController = TextEditingController();

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Home",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "My Photo",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _queryController,
                            decoration: const InputDecoration(
                              hintText: "Search",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Selector<AppAuthProvider, bool>(
                  builder: (context, loading, child) => loading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async =>
                                await context.read<AppAuthProvider>().signOut(),
                            child: const Text(
                              "Sign Out",
                            ),
                          ),
                        ),
                  selector: (context, authProvider) =>
                      authProvider.state.loading,
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [Text("CICD testing")],
              ),
            )
          ],
        ),
      ),
    );
  }
}
