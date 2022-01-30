import 'package:dwalletdemo/homepage.dart';
import 'package:flutter/material.dart';
import 'package:configcat_client/configcat_client.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize ConfigCatClient with your SDK Key
  configCatClient = ConfigCatClient.get(
      sdkKey: "bJnZCNlFH0OIQ8hHYSBFnQ/UgYJJj0RRkuBo2e9A-P5ug",
      options: ConfigCatOptions(
        mode: PollingMode.autoPoll(),
          logger: ConfigCatLogger(level: LogLevel.debug)));

  //Register Singleton
  getit.registerSingleton<ConfigCatClient>(configCatClient,
  dispose: (client)=>ConfigCatClient.close(client: client));
  
  runApp(const MyApp());
}

late ConfigCatClient configCatClient;
final getit = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digi Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}
