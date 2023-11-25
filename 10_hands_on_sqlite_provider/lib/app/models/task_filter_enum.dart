sealed class TaskFilter {
  final String description;

  TaskFilter({required this.description});
}

final class TaskFilterToday extends TaskFilter {
  TaskFilterToday() : super(description: 'Today');
}

final class TaskFilterTomorrow extends TaskFilter {
  TaskFilterTomorrow() : super(description: 'Tomorrow');
}

final class TaskFilterWeek extends TaskFilter {
  TaskFilterWeek() : super(description: 'Week');
}
