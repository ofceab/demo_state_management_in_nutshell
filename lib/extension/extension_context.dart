import 'package:flutter/material.dart';

import '../provider/todo_inherited_widget.dart';

extension BuildContextExtension on BuildContext {
  TodoInheritedWidget get() => TodoInheritedWidget.of(this);
}
