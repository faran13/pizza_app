import '../../export.dart';

extension BuildContextX on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  Future<void> showBottomSheet({
    required Widget Function(BuildContext context) builder,
    bool? isScrollControlled,
    bool? enableDrag,
    bool? isDismissible,
    bool scrollUp = false,
    double borderRadius = 10,
    Color? color,
    EdgeInsetsGeometry? padding,
    double? height,
    Color? barrierColor,
  }) {
    return showModalBottomSheet(
      context: this,
      isDismissible: isDismissible ?? false,
      isScrollControlled: isScrollControlled ?? false,
      enableDrag: enableDrag ?? true,
      constraints: BoxConstraints(maxHeight: this.height * 0.92),
      backgroundColor: color ?? Colors.transparent,
      barrierColor: barrierColor,
      builder: (context) => Container(
        height: height,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: color ?? Colors.black,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(borderRadius)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: scrollUp ? MediaQuery.of(context).viewInsets.bottom : 0,
          ),
          child: builder.call(context),
        ),
      ),
    );
  }

  /// This is a scroll bottomsheet
  /// Backdrop Filter is added here we can remove from it everywhere else in the app
  Future<void> showBottomSheetWithScroll({
    required Widget Function(BuildContext context) builder,
    bool? isScrollControlled,
    bool? enableDrag,
    bool? isDismissible,
    bool scrollUp = false,
    double borderRadius = 10,
  }) {
    return showModalBottomSheet(
      context: this,
      isDismissible: isDismissible ?? true,
      isScrollControlled: isScrollControlled ?? false,
      enableDrag: enableDrag ?? true,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        reverse: scrollUp,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: scrollUp ? MediaQuery.of(context).viewInsets.bottom : 0,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(borderRadius)),
            ),
            child: builder.call(context),
          ),
        ),
      ),
    );
  }
}
