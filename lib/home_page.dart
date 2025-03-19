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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("HOME PAGE"),
        //
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "BALANCE:${websocketProvider.price}",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: 40,
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
