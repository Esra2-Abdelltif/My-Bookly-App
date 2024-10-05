import 'package:bookly_project/core/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller ;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  const CustomSearchTextField({super.key,
    required this.controller,
    required this.onChanged,
     this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: AppStrings.searchHint,
        suffixIcon: IconButton(
          onPressed: onTap,
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}