import 'package:flutter/material.dart';
import 'package:resala/app.dart';
import 'core/services/services_locator.dart';

void main() {
  ServicesLocator().init();
  runApp(const Resala());
}