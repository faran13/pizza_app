/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsJpgGen {
  const $AssetsJpgGen();

  /// File path: assets/jpg/ic_bbq_chicken.jpg
  AssetGenImage get icBbqChicken =>
      const AssetGenImage('assets/jpg/ic_bbq_chicken.jpg');

  /// File path: assets/jpg/ic_beef.jpg
  AssetGenImage get icBeef => const AssetGenImage('assets/jpg/ic_beef.jpg');

  /// File path: assets/jpg/ic_deal.jpg
  AssetGenImage get icDeal => const AssetGenImage('assets/jpg/ic_deal.jpg');

  /// File path: assets/jpg/ic_margherita_pizza.jpg
  AssetGenImage get icMargheritaPizza =>
      const AssetGenImage('assets/jpg/ic_margherita_pizza.jpg');

  /// File path: assets/jpg/ic_pakistani_hot.jpg
  AssetGenImage get icPakistaniHot =>
      const AssetGenImage('assets/jpg/ic_pakistani_hot.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [icBbqChicken, icBeef, icDeal, icMargheritaPizza, icPakistaniHot];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/image_animation.json
  String get imageAnimation => 'assets/lottie/image_animation.json';

  /// List of all assets
  List<String> get values => [imageAnimation];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/app_icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/png/app_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [appIcon];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/ic_add_to_cart.svg
  String get icAddToCart => 'assets/svg/ic_add_to_cart.svg';

  /// File path: assets/svg/ic_close.svg
  String get icClose => 'assets/svg/ic_close.svg';

  /// File path: assets/svg/ic_heart.svg
  String get icHeart => 'assets/svg/ic_heart.svg';

  /// File path: assets/svg/ic_heart_filled.svg
  String get icHeartFilled => 'assets/svg/ic_heart_filled.svg';

  /// File path: assets/svg/ic_search.svg
  String get icSearch => 'assets/svg/ic_search.svg';

  /// List of all assets
  List<String> get values =>
      [icAddToCart, icClose, icHeart, icHeartFilled, icSearch];
}

class Assets {
  Assets._();

  static const $AssetsJpgGen jpg = $AssetsJpgGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
