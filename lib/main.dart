import 'package:appsolutely/service/auth_service.dart';
import 'package:appsolutely/service/contact_service.dart';
import 'package:appsolutely/service/log_service.dart';
import 'package:appsolutely/service/prepare_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => ContactService()),
        ChangeNotifierProvider(create: (context) => PrepareService()),
        ChangeNotifierProvider(create: (context) => LogService()),
      ],
      child: const Appsolutely(),
    ),
  );
}
