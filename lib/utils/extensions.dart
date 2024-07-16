import 'package:flutter/material.dart';

extension Space on double {
  SizedBox get margin => SizedBox(height: this, width: this);
}
