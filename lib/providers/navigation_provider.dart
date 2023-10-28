import 'package:pozik_front/config/router.dart';
import 'abstract_provider.dart';

class NavigationProvider extends AbstractProvider {
  String _currentPage = dashboardRoute;

  String get currentPage => _currentPage;

  void setCurrentPage(String page) {
    _currentPage = page;
    notifyListeners();
  }
}
