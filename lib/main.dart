import 'package:auth/storage/components/avatar.dart';
import 'package:auth/storage/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth/auth_gate.dart';

void main() async{
  await Supabase.initialize(
      url: 'https://nwtkajloprjjiycojjzc.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im53dGthamxvcHJqaml5Y29qanpjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYyOTIxNTEsImV4cCI6MjA2MTg2ODE1MX0.4ZzDrGFr74cps5hn3u4oD-xDT37SgbzjQbKt70OEp00'
  );
  runApp(const MyApp());
}
final supabase=Supabase.instance.client;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: AuthGate(),
    );
  }
}