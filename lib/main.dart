// ignore_for_file: use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'pages/ticketprovider.dart'; 
import 'pages/ticketedit.dart'; 
import 'pages/ticketdetail.dart'; 
import 'pages/ticketdelete.dart'; 
import 'pages/listatickets.dart'; 

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized(); 

  await Firebase.initializeApp(); 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TicketProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => TicketListScreen(),
          routes: [
            GoRoute(
              path: 'edit/:id',
              builder: (context, state) {
                final id = state.pathParameters['id'];
                return TicketEditScreen(id: id!);
              },
            ),
            GoRoute(
              path: 'detail/:id',
              builder: (context, state) {
                final id = state.pathParameters['id'];
                return TicketDetailScreen(id: id!);
              },
            ),
            GoRoute(
              path: 'delete/:id',
              builder: (context, state) {
                final id = state.pathParameters['id'];
                return DeleteConfirmationScreen(id: id!);
              },
            ),
          ],
        ),
      ],
    );

    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}
