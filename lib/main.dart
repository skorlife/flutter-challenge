import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as crypt;
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This is not a whatsapp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Follow the link'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String secretText =
      "RWnmwZWecREK1ldFmE4iz0gAkSvjIrK9BxwCSyVIy0FZJU/Q1JfKtVJNcJB32DsP";
  final String superSecretText =
      "RWnmwZWecREK1ldFmE4iz0gAkSvjIrK9BxwCSyVIy0FZJU/Q9JfKtVJNcJB32DsP";
  final appKey = crypt.Key.fromUtf8('utestforskorlife');
  final iv = crypt.IV.fromUtf8('encryptionIntVec');
  String decryptedString = "";

  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String decryptedString = "there is something missing here";

  void showTheLink() {
    String result = "";
    try {
      // final decrypter = crypt.Encrypter(
      //     crypt.AES(widget.appKey, mode: crypt.AESMode.cbc, padding: 'PKCS7'));
      // final decrypted = decrypter.decryptBytes(
      //     crypt.Encrypted.from64(widget.secretText),
      //     iv: widget.iv);
      // Future.delayed(Duration(seconds: 2),() {
      //   launchUrl(Uri.parse(utf8.decode(decrypted)));
      // });
      // result = "goodluck";

      result = "why is it commented?";
    } on Exception catch (e) {
      result = "still fail, please fix the code";
    }
    setState(() {
      decryptedString = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              decryptedString,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showTheLink,
        tooltip: 'solve',
        child: const Icon(Icons.question_mark),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
