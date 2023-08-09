import 'package:efashion_flutter/app.dart';
import 'package:efashion_flutter/bloc_observer.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const EfashionApp());
}
