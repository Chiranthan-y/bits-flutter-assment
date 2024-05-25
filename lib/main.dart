import 'package:flutter/material.dart';
import 'package:quicktask/screens/login_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Back4App 
  const keyApplicationId = 'YOUR_APP_ID'; 
  const keyClientKey = 'YOUR_CLIENT_KEY'; 
  const keyParseServerUrl = 'https://parseapi.back4app.com'; 

  await Parse().initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClientKey, autoSendSessionId: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickTask',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}