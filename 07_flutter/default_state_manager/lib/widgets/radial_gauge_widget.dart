import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'imc_gauge_range_widget.dart';

class RadialGaugeWidget extends StatelessWidget {
  const RadialGaugeWidget({
    super.key,
    required double imc,
  }) : _imc = imc;

  final double _imc;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 12.5,
          maximum: 47.9,
          ranges: [
            ImcGaugeRangeWidget(
              startValue: 12.5,
              endValue: 18.5,
              color: Colors.blue,
              label: 'Magreza',
            ),
            ImcGaugeRangeWidget(
              startValue: 18.5,
              endValue: 24.5,
              color: Colors.purple,
              label: 'Normal',
            ),
            ImcGaugeRangeWidget(
              startValue: 24.5,
              endValue: 29.9,
              color: Colors.amber.shade600,
              label: 'Sobrepeso',
              textColor: Colors.white,
            ),
            ImcGaugeRangeWidget(
              startValue: 29.9,
              endValue: 39.9,
              color: Colors.red,
              label: 'Obesidade',
            ),
            ImcGaugeRangeWidget(
              startValue: 39.9,
              endValue: 47.9,
              color: Colors.red.shade900,
              label: 'Obesidade grave',
            ),
          ],
          pointers: [
            NeedlePointer(
              value: _imc,
              needleLength: .5,
              enableAnimation: true,
              needleColor: Colors.black,

              // alrgura do ponteiro
              needleStartWidth: 1,
              needleEndWidth: 6,

              // borda contrária ao ponteiro
              tailStyle: const TailStyle(),

              // circulo central
              // radius = 1 é o tamanho total do RadialAxis
              knobStyle: const KnobStyle(
                borderWidth: .1,
                knobRadius: 0.06,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
