import 'package:flutter/material.dart';

import 'app_styles.dart';

abstract class BasePageState<T> extends State {
  Widget textArea(TextEditingController controller, String label) {
    return Container(
        decoration: BoxDecoration(color: AppStyles.textAreaBackgroundColor,
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(
            vertical: AppStyles.appHorizontalPadding / 4),
        padding: const EdgeInsets.all(AppStyles.appHorizontalPadding),
        child: TextField(
            style: Theme
                .of(context)
                .textTheme
                .caption,
            maxLines: 2,
            textAlign: TextAlign.start,
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(color: AppStyles.lightTextColor),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            )));
  }
}