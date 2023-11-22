import '../../core/notifier/app_change_notifier.dart';
import '../../services/tasks/tasks_service.dart';

class CreateTaskController extends AppChangeNotifier {
  final TasksService _tasksService;
  DateTime? _selectedDate;

  CreateTaskController({required TasksService tasksService})
      : _tasksService = tasksService;

  Future<void> createTask(String description) async {
    showLoaderAndResetState();
    notifyListeners();

    try {
      if (_selectedDate == null) {
        setError('Please, select a date');
      } else {
        await _tasksService.createTask(_selectedDate!, description);
        setSuccess(true);
      }
    } on Exception {
      setError('Error creating task');
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;

    resetState();
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;
}
