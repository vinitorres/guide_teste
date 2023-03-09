import 'package:flutter/services.dart';

const channel = MethodChannel('channel');

void receiveString(String str) {
  print('String received: $str');
}

