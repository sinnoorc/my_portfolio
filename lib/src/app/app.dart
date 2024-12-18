import 'package:responsive_builder/responsive_builder.dart';

import '../../common_libs.dart';
import '../../gen/fonts.gen.dart';

class MyPortfolioApp extends HookConsumerWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return ResponsiveApp(
      builder: (context) {
        return MaterialApp.router(
          title: 'Sinnoor C | Flutter Innovator',
          theme: ThemeData(
            fontFamily: FontFamily.helveticaNow,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
          ),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
