import 'package:flutter/material.dart';
import 'package:resala/core/utils/assets_manager.dart';

generalWidgetShowErrorMessage(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              fontFamily: FontAssets.sansFont), textAlign: TextAlign.end),
      backgroundColor: Colors.black));
}