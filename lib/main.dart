import 'package:bookly_project/bloc_observer.dart';
import 'package:bookly_project/core/services/singletones/registered_singletones.dart';
import 'package:bookly_project/features/book_app/presentation/view/my_bookly_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await RegisteredSingleton.registerInstances();
  Bloc.observer = MyBlocObserver();
  runApp((DevicePreview(
    enabled: true,
    builder: (context) => const MyBooklyApp(),
  )));
}

