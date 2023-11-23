import '../../core/notifier/app_change_notifier.dart';
import '../../models/task_filter_enum.dart';

class HomeController extends AppChangeNotifier {
  var filterSelected = TaskFilterEnum.today;

  void setFilter(TaskFilterEnum filter) {
    filterSelected = filter;
    notifyListeners();
  }
}
