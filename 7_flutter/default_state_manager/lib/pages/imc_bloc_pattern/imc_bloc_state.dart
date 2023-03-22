class ImcBlocState {
  final double? imc;

  ImcBlocState({
    this.imc,
  });
}

class ImcBlocStateLoading extends ImcBlocState {}

class ImcBlocStateError extends ImcBlocState {
  final String message;

  ImcBlocStateError({
    required this.message,
  });
}
