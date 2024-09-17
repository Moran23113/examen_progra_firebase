import 'package:examen_progra_firebase/pages/listatickets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'pages/ticketprovider.dart';
import 'pages/ticketedit.dart';
import 'pages/ticketdetail.dart';
import 'pages/ticketdelete.dart';

void main() {
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
    return MaterialApp.router(
      routerDelegate: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => TicketListScreen(),
            routes: [
              GoRoute(
                path: 'edit/:id',
                builder: (context, state) {
                  final id = state.params['id'];
                  return TicketEditScreen(id: id!);
                },
              ),
              GoRoute(
                path: 'detail/:id',
                builder: (context, state) {
                  final id = state.params['id'];
                  return TicketDetailScreen(id: id!);
                },
              ),
              GoRoute(
                path: 'delete/:id',
                builder: (context, state) {
                  final id = state.params['id'];
                  return DeleteConfirmationScreen(id: id!);
                },
              ),
            ],
          ),
        ],
      ).routerDelegate,
      routeInformationParser: GoRouter().routeInformationParser,
    );
  }
}
