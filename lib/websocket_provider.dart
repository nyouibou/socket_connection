import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebsocketProvider extends ChangeNotifier {
  final channel = IOWebSocketChannel.connect(
      'wss://stream.binance.com:9443/ws/btcusdt@trade');
  String _price = "Loading...";
  String get price => _price;
  WebsocketProvider() {
    listenToStream();
  }
  void listenToStream() {
    channel.stream.listen((message) {
      Map getData = jsonDecode(message);
      _price = getData["p"];
      print(_price);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    channel.sink.close();
    super.dispose();
  }
}
