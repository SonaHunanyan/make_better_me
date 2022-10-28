import 'package:flutter/material.dart';

mixin StateAddition<T extends StatefulWidget> on State<T> {
  double get width_ => MediaQuery.of(context).size.width;
  double get height_ => MediaQuery.of(context).size.height;
  double get viewInsetsBottom => MediaQuery.of(context).viewInsets.bottom;
}

mixin StatelessAddition on StatelessWidget {
  double width_(BuildContext context) => MediaQuery.of(context).size.width;
  double height_(BuildContext context) => MediaQuery.of(context).size.height;
}
