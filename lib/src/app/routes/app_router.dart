import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common_libs.dart';
import '../../features/home/presentation/screens/home_screen.dart';

part 'app_router.g.dart';
part 'app_routes.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.home.name,
      builder: (_, s) => const HomeScreen(),
    ),
  ]);
  ref.onDispose(router.dispose);
  return router;
}
