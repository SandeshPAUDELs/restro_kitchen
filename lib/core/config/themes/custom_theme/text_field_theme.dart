import 'package:flutter/material.dart';
import 'package:hive_project/common/style/common_style.dart';
import 'package:hive_project/core/config/themes/custom_theme/text_theme.dart';

class TextFieldsTheme {
  static TextFormField createTextField(
    BuildContext context,
    TextEditingController controller,
    String hintText,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      style: TextThemes.createTextTheme(context).bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(CommonStyle.borderRadius),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: CommonStyle.screenpadding,
          horizontal: CommonStyle.screenpadding,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: validator,
    );
  }

  static TextFormField createSearchField(
    BuildContext context,
    TextEditingController controller,
    String hintText,
    void Function(String)? onSubmitted,
  ) {
    return TextFormField(
      controller: controller,
      style: TextThemes.createTextTheme(context).bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(CommonStyle.borderRadius),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: CommonStyle.screenpadding,
          horizontal: CommonStyle.screenpadding,
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ),
      onFieldSubmitted: onSubmitted,
    );
  }

  static TextFormField createTextFieldwithOnChange(
    BuildContext context,
    TextEditingController controller,
    String hintText,
    void Function(String)? onChanged,
  ) {
    return TextFormField(
      controller: controller,
      style: TextThemes.createTextTheme(context).bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(CommonStyle.borderRadius),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: CommonStyle.screenpadding,
          horizontal: CommonStyle.screenpadding,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: onChanged,
    );
  }
}
