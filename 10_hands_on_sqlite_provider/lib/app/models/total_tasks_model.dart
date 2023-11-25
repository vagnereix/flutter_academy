class TotalTasksModel {
  final int tasksCount;
  final int finishedTasksCount;

  TotalTasksModel({required this.tasksCount, required this.finishedTasksCount});

  TotalTasksModel copyWith({
    int? tasksCount,
    int? finishedTasksCount,
  }) {
    return TotalTasksModel(
      tasksCount: tasksCount ?? this.tasksCount,
      finishedTasksCount: finishedTasksCount ?? this.finishedTasksCount,
    );
  }
}
