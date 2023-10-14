import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<T?> showBlurredBarBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  double elevation = 0,
  ShapeBorder shape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    ),
  ),
  Clip? clipBehavior,
  Curve? animationCurve,
  Duration? duration,
  RouteSettings? settings,
  double? closeProgressThreshold,
  AnimationController? secondAnimation,
  Color? backgroundColor,
  Color? barrierColor,
  bool bounce = false,
  bool useRootNavigator = true,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  final sheetContent = Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 16.h),
      Container(
        height: 3,
        width: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).hintColor,
          borderRadius: BorderRadius.all(Radius.circular(3.r)),
        ),
      ),
      SizedBox(height: 16.h),
      Flexible(
        flex: 1,
        fit: FlexFit.loose,
        child: SizedBox(width: double.infinity, child: builder(context)),
      ),
    ],
  );

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: SafeArea(
        bottom: false,
        child: Material(
          shape: shape,
          clipBehavior: clipBehavior ??
              (Theme.of(context).brightness == Brightness.dark
                  ? Clip.antiAlias
                  : Clip.none),
          color: backgroundColor,
          elevation: elevation,
          child: Theme.of(context).brightness == Brightness.dark
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                  child: sheetContent,
                )
              : Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.r)),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer)
                    ],
                  ),
                  child: sheetContent,
                ),
        ),
      ),
    ),
    elevation: elevation,
    shape: shape,
    clipBehavior: clipBehavior,
    barrierColor: barrierColor,
    backgroundColor: Colors.transparent,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
  );
}
