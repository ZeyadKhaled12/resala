import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../domain/usecases/set_data_activity_uc.dart';
import '../../../controller/team_bloc.dart';

class ActivityWidgetTextField extends StatelessWidget {
  const ActivityWidgetTextField(
      {Key? key,
      required this.hintText,
      this.controller,
      this.height,
      this.maxLines = 1,
      this.isDate = false})
      : super(key: key);
  final String hintText;
  final double? height;
  final int maxLines;
  final bool isDate;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    String? pickDate;
    return BlocBuilder<TeamBloc, TeamState>(
      builder: (context, state) => InkWell(
        onTap: isDate
            ? () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now())
                    .then((pickedDate) {
                  if (pickedDate == null) return;
                  pickDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  context.read<TeamBloc>().add(SetDateActivityEvent(
                      parameters: SetDateActivityParameters(date: pickDate!)));
                })
            : () {},
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
              width: double.infinity,
              height: height,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                maxLines: maxLines,
                enabled: !isDate,
                textAlign: TextAlign.center,
                controller: controller,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: FontAssets.sansFont),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: isDate
                        ? context.watch<TeamBloc>().state.date.isEmpty
                            ? hintText:context.watch<TeamBloc>().state.date

                        : hintText,
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        fontFamily: FontAssets.sansFont)),
              )),
        ),
      ),
    );
  }
}
