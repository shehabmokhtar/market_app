import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

// ignore: must_be_immutable
class CustomDrowDownMenuWithTitle extends StatefulWidget {
  final String title;
  String value;
  List<DropdownMenuItem<String>> items;
  Function onChanged;

  CustomDrowDownMenuWithTitle({
    super.key,
    required this.title,
    required this.value,
    required this.items,
    required this.onChanged,
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
          padding: const EdgeInsetsDirectional.only(bottom: 10, top: 10),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            ),
            child: DropdownButton<String>(
              dropdownColor: AppColors.fifthColor,
              elevation: 100,
              isExpanded: true,
              value: widget.value,
              padding: const EdgeInsets.all(10),
              icon: Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
              disabledHint: Text(
                widget.title,
                style: TextStyle(color: AppColors.primaryColor),
              ),
              hint: Text(
                widget.title,
                style: TextStyle(color: AppColors.primaryColor),
              ),
              items: widget.items,
              onChanged: (v) {
                setState(() {
                  widget.value = v!;
                });
                widget.onChanged();
              },
            ),
          ),
        )
      ],
    );
  }
}
