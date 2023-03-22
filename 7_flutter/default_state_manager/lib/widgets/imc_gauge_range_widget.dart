import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGaugeRangeWidget extends GaugeRange {
  final Color? textColor;

  ImcGaugeRangeWidget({
    // class params
    this.textColor,

    // super params
    super.key,
    required super.startValue,
    required super.endValue,
    required super.color,
    required super.label,
    super.sizeUnit = GaugeSizeUnit.factor,
    super.startWidth = .65,
    super.endWidth = .65,
  }) : super(
          labelStyle: GaugeTextStyle(
            // sending constant params
            fontWeight: FontWeight.w500,
            fontSize: 16,

            // sending a class param [not constant]
            color: textColor,
          ),
        );
}
