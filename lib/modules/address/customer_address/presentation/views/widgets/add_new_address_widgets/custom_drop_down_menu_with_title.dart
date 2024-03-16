import 'package:flutter/material.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

// ignore: must_be_immutable
class CustomDrowDownMenuWithTitle extends StatefulWidget {
  final String title;
  final String dropDownMenuTitle;
  String? value;
  List<DropdownMenuItem<String>> items;
  Function(String value) onChanged;

  CustomDrowDownMenuWithTitle({
    super.key,
    required this.title,
    required this.dropDownMenuTitle,
    required this.items,
    required this.onChanged,
    required this.value,
  });

  @override
  State<CustomDrowDownMenuWithTitle> createState() =>
      _CustomDrowDownMenuWithTitleState();
}

class _CustomDrowDownMenuWithTitleState
    extends State<CustomDrowDownMenuWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppSizes.regularTextStyle(context),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 15, top: 15),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            ),
            child: DropdownButton<String>(
              underline: const SizedBox(),
              isExpanded: true,
              value: widget.value,
              padding: const EdgeInsets.all(10),
              icon: Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
              disabledHint: Text(
                widget.dropDownMenuTitle,
                style: const TextStyle(color: Colors.grey),
              ),
              hint: Text(
                widget.dropDownMenuTitle,
                style: const TextStyle(color: Colors.grey),
              ),
              items: widget.items,
              onChanged: (v) {
                AppUtilities.vibration();
                setState(() {
                  widget.value = v!;
                });
                print('>>>> ${widget.value}');
                print('>> $v');
                widget.onChanged(widget.value!);
              },
            ),
          ),
        )
      ],
    );
  }
}
