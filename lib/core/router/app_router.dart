
import 'package:go_router/go_router.dart';
import 'package:ongere/core/Shared/presentation/pages/Home.dart';

final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => Home()
      ),
    ]
);