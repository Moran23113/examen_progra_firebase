import 'package:examen_progra_firebase/pages/ticketdelete.dart';
import 'package:go_router/go_router.dart';
import 'package:examen_progra_firebase/pages/listatickets.dart';
import 'package:examen_progra_firebase/pages/ticketdetail.dart';
import 'package:examen_progra_firebase/pages/ticketedit.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const TicketListScreen(),
      routes: [
        GoRoute(
          path: 'edit/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            return TicketEditScreen(id: id);
          },
        ),
        GoRoute(
          path: 'detail/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            return TicketDetailScreen(id: id);
          },
        ),
        GoRoute(
          path: 'delete/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            return DeleteConfirmationScreen(id: id);
          },
        ),
      ],
    ),
  ],
);
