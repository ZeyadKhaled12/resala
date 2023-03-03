
import 'package:flutter/material.dart';
import '../../../../features/login/domain/entities/login.dart';
import '../../../../features/referee/presentation/screens/ref_categories_screen.dart';
import '../../../../features/team/presentation/screens/categories_screen.dart';
import '../../../../features/login/presentation/screens/profile_screen.dart';

class GeneralWidgetBottom extends StatefulWidget {
  const GeneralWidgetBottom(
      {Key? key, required this.login})
      : super(key: key);
  final Login login;

  @override
  _GeneralWidgetBottomState createState() => _GeneralWidgetBottomState();
}

class _GeneralWidgetBottomState extends State<GeneralWidgetBottom> {

  List<Widget> screens = [];
  int index = 1;

  @override
  void initState() {
    screens = [
      const Text(''),
      widget.login.isReferee
          ? RefCategoriesScreen(token: widget.login.token)
          : CategoriesScreen(token: widget.login.token),
      ProfileScreen(login: widget.login)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: screens[index]),
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
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });

                      },
                      icon: Icon(
                        index == 0
                            ? Icons.notifications
                            : Icons.notifications_outlined,
                        size: index == 0 ? 50 : 32,
                        color: Colors.black,
                      )),
                  const SizedBox(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      icon: Icon(
                        Icons.home_outlined,
                        size: index == 1 ? 50 : 32,
                        color: Colors.black,
                      )),
                  const SizedBox(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      icon: Icon(
                        index == 2 ? Icons.person : Icons.person_outline,
                        size: index == 2 ? 50 : 32,
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