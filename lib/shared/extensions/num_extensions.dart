import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExtensions on num {
  SizedBox get sbh => SizedBox(height: this.h);
  SizedBox get sbw => SizedBox(width: this.w);
}
