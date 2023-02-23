import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resala/core/services/services_locator.dart';

import '../controller/ref_bloc.dart';

class RefActivitiesScreen extends StatelessWidget {
  const RefActivitiesScreen({Key? key,required this.categoryId}) : super(key: key);
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<RefBloc>(),
        child: Container(
          child: Text(''),
        ),
      ),
    );
  }
}
