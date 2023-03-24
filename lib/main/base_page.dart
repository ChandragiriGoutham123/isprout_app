import 'package:flutter/material.dart';

import 'app_styles.dart';

abstract class BasePageState<T> extends State {
  Widget textArea(TextEditingController controller, String label) {
    return Container(
        decoration: BoxDecoration(color: AppStyles.textAreaBackgroundColor,
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(
            vertical: AppStyles.appHorizontalPadding / 2),
        padding: const EdgeInsets.all(AppStyles.appHorizontalPadding),
        child: TextField(
            style: Theme
                .of(context)
                .textTheme
                .caption,
            maxLines: 4,
            textAlign: TextAlign.start,
            controller: controller,
            decoration: new InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: AppStyles.lightTextColor),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            )));
  }
}