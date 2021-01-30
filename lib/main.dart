import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/app.dart' deferred as app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final loaded = Future.wait([
    app.loadLibrary(),
    Firebase.initializeApp(),
  ]);

  runApp(
    FutureBuilder(
      future: loaded,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error.toString());
        }

        if (snapshot.hasData) {
          return app.FriendlyEatsApp();
        }

        return Container(color: Colors.white);
      },
    ),
  );
}
