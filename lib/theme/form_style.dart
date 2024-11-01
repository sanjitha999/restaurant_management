// class FRTextStyle {
//   FRTextStyle() {
//     appColor = Components.instance.themeData.appColors;
//   }
//
//   late FRColors appColor;
//
//   TextStyle getErrorStyle() {
//     return TextStyle(
//       fontSize: FontSize.small,
//       fontWeight: AppFontWeight.normal,
//       color: appColor.red,
//     );
//   }
//
//   TextStyle getCaptionStyle() {
//     return TextStyle(
//       color: appColor.gray,
//       fontWeight: AppFontWeight.normal,
//       fontSize: FontSize.small,
//     );
//   }
//
//   InputDecoration getInputDecoration({
//     required String? errorText,
//     required bool isFocussed,
//     required bool enabled,
//     required bool alignLabelWithHint,
//     Color? primaryColor,
//     Widget? suffixIcon,
//     String? prefixText,
//     String? labelText,
//     String? hintText,
//     TextStyle? prefixTextStyle,
//   }) {
//     return InputDecoration(
//       counterText: "",
//       contentPadding: const EdgeInsets.all(Spacing.defaultMargin),
//       filled: true,
//       fillColor: !enabled ? appColor.grayLightest : appColor.white,
//       errorText: errorText,
//       errorStyle: const TextStyle(height: 0, fontSize: 0),
//       labelText: labelText,
//       labelStyle: TextStyle(
//         fontSize: FontSize.subtitle,
//         color: _computeLabelColor(
//           isFocussed,
//           errorText != null,
//           enabled,
//           primaryColor: primaryColor,
//         ),
//       ),
//       hintText: hintText,
//       hintStyle: TextStyle(
//         color: appColor.grayLight,
//         fontWeight: AppFontWeight.normal,
//         fontSize: FontSize.normal,
//       ),
//       prefixText: prefixText,
//       prefixStyle: prefixTextStyle,
//       suffixIcon: suffixIcon,
//       suffixIconConstraints: BoxConstraints(
//         minHeight: Dimensions.iconDimensions24.height,
//         minWidth: Dimensions.iconDimensions24.width,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: appColor.grayLighter),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: appColor.redError,
//           width: Dimensions.textFieldBorderWidth2,
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: primaryColor ?? appColor.primary,
//           width: Dimensions.textFieldBorderWidth2,
//         ),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: appColor.redError,
//           width: Dimensions.textFieldBorderWidth2,
//         ),
//       ),
//       disabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: appColor.grayLighter),
//       ),
//       alignLabelWithHint: alignLabelWithHint,
//     );
//   }
//
//   Color _computeLabelColor(
//     bool isFocussed,
//     bool isShowingError,
//     bool enabled, {
//     Color? primaryColor,
//   }) {
//     if (!enabled) {
//       return appColor.gray;
//     } else if (isShowingError) {
//       return appColor.redError;
//     } else if (isFocussed) {
//       return primaryColor ?? appColor.primary;
//     } else {
//       return appColor.gray;
//     }
//   }
// }
