import 'package:flutter/material.dart';


class Datepicker extends StatelessWidget {
  const Datepicker({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DatePickerDialog(initialDate: DateTime.now(), firstDate:DateTime.now(), lastDate: DateTime(2024));
  }
}