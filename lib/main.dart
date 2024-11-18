import 'common_libs.dart';
import 'src/app/app.dart';

void main() {
  runApp(
    const ProviderScope(child: MyPortfolioApp()),
  );
}
