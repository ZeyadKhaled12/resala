import 'package:flutter/material.dart';
import '../../../../features/referee/presentation/screens/ref_categories_screen.dart';
import '../../../../features/team/presentation/screens/categories_screen.dart';

class GeneralWidgetBottom extends StatelessWidget {
  const GeneralWidgetBottom(
      {Key? key, required this.token, required this.isRef})
      : super(key: key);
  final String token;
  final bool isRef;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: isRef
                  ? RefCategoriesScreen(token: token)
                  : CategoriesScreen(token: token)),
          const Padding(padding: EdgeInsets.only(bottom: 5)),
          Container(
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_outlined,
                        size: 32,
                        color: Colors.black,
                      )),
                  const SizedBox(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home_outlined,
                        size: 50,
                        color: Colors.black,
                      )),
                  const SizedBox(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_outline,
                        size: 32,
                        color: Colors.black,
                      )),
                  const SizedBox(),
                ],
              ))
        ],
      ),
    );
  }
}
