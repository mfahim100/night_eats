import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropDownMenu extends StatefulWidget {
  final String text;
  final Function(String?)? onChanged;
  final List<String> items;


  const CustomDropDownMenu({
    super.key,
    required this.text,
    required this.items,
    required this.onChanged,
  });

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

String? selectedValue;

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 25 * w,
      child: DropdownButtonFormField2(
        // value: widget.selected,
        decoration: InputDecoration(
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(03.w),
          ),
          //Add more decoration as you want here
          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
        ),
        hint: Text(
          widget.text,
          style:  TextStyle(fontSize: 15.sp, color: Colors.black),
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style:  TextStyle(
                fontSize: 15.sp,
                color: Colors.black
            ),
          ),
        ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select ${widget.text}.';
          }
          return null;
        },
        onChanged: widget.onChanged,
        onSaved: (value) {
          selectedValue = value.toString();
        },
        buttonStyleData:  ButtonStyleData(
          height: 6.h,
          padding: const EdgeInsets.only(left: 20, right: 10),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          iconSize: 30,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
