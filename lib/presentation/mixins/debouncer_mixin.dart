// ignore_for_file: comment_references

import 'dart:async';
import 'dart:ui';

/// Use this mixin with [StateFulWidget] or [StatelessWidget] to do something after user stops typing in the text field
/// usage in onchange method of textfield: debounce(() => doSomething(), const Duration(milliseconds: 300))
mixin DebouncerMixin {
  Timer? _debounce;

  void debounce(VoidCallback callback, Duration duration) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(duration, callback);
  }

  void manuallyCancel() {
    _debounce?.cancel();
  }
}
