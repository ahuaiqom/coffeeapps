import 'package:flutter/rendering.dart' show ScrollDirection;
import 'package:flutter/widgets.dart';

class NavVisibilityController extends ChangeNotifier {
  bool _show = true;
  bool get show => _show;

  // panggil ini dari NotificationListener
  bool onScroll(UserScrollNotification n) {
    if (n.direction == ScrollDirection.reverse && _show) {
      _show = false; notifyListeners();
    } else if (n.direction == ScrollDirection.forward && !_show) {
      _show = true; notifyListeners();
    }
    return false; // biarkan notifikasi lanjut
  }
}
