import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_connection/second_page.dart';
import 'package:socket_connection/websocket_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    final websocketProvider = Provider.of<WebsocketProvider>(context);
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Price:${websocketProvider.price}",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.yellow)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
                    ));
              },
              child: const Text("Second Page"))
        ],
      ),
    );
  }
}
