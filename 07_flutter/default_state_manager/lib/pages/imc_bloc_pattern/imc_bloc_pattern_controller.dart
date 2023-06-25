import 'dart:async';
import 'dart:math';

import 'package:default_state_manager/pages/imc_bloc_pattern/imc_bloc_state.dart';

class ImcBlocPatternController {
  final _imcStreamController = StreamController<ImcBlocState>.broadcast()
    ..add(ImcBlocState());

  Stream<ImcBlocState> get stream => _imcStreamController.stream;

  Future<void> calculateIMC({
    required double weight,
    required double height,
  }) async {
    _imcStreamController.add(ImcBlocState(imc: 0));
    _imcStreamController.add(ImcBlocStateLoading());
    await Future.delayed(const Duration(seconds: 1));

    try {
      if (weight > 300 || height > 3) {
        throw Exception('Desculpe, não sabemos calular o IMC de gigantes');
      }

      final imc = weight / pow(height, 2);
      _imcStreamController.add(ImcBlocState(imc: imc));
    } on Exception catch (e) {
      _imcStreamController.add(ImcBlocStateError(message: e.toString()));
    }
  }

  void dispose() => _imcStreamController.close();
}
