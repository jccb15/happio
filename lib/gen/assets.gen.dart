/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsMoodIconsGen {
  const $AssetsMoodIconsGen();

  /// File path: assets/mood_icons/angry.svg
  String get angry => 'assets/mood_icons/angry.svg';

  /// File path: assets/mood_icons/bandaged.svg
  String get bandaged => 'assets/mood_icons/bandaged.svg';

  /// File path: assets/mood_icons/calm.svg
  String get calm => 'assets/mood_icons/calm.svg';

  /// File path: assets/mood_icons/confused.svg
  String get confused => 'assets/mood_icons/confused.svg';

  /// File path: assets/mood_icons/coughing.svg
  String get coughing => 'assets/mood_icons/coughing.svg';

  /// File path: assets/mood_icons/crying.svg
  String get crying => 'assets/mood_icons/crying.svg';

  /// File path: assets/mood_icons/dizzy.svg
  String get dizzy => 'assets/mood_icons/dizzy.svg';

  /// File path: assets/mood_icons/expectorate.svg
  String get expectorate => 'assets/mood_icons/expectorate.svg';

  /// File path: assets/mood_icons/fever.svg
  String get fever => 'assets/mood_icons/fever.svg';

  /// File path: assets/mood_icons/frown.svg
  String get frown => 'assets/mood_icons/frown.svg';

  /// File path: assets/mood_icons/glasses.svg
  String get glasses => 'assets/mood_icons/glasses.svg';

  /// File path: assets/mood_icons/happy.svg
  String get happy => 'assets/mood_icons/happy.svg';

  /// File path: assets/mood_icons/loudly_crying.svg
  String get loudlyCrying => 'assets/mood_icons/loudly_crying.svg';

  /// File path: assets/mood_icons/nauseous.svg
  String get nauseous => 'assets/mood_icons/nauseous.svg';

  /// File path: assets/mood_icons/nervous.svg
  String get nervous => 'assets/mood_icons/nervous.svg';

  /// File path: assets/mood_icons/neutral.svg
  String get neutral => 'assets/mood_icons/neutral.svg';

  /// File path: assets/mood_icons/sad.svg
  String get sad => 'assets/mood_icons/sad.svg';

  /// File path: assets/mood_icons/sleepy.svg
  String get sleepy => 'assets/mood_icons/sleepy.svg';

  /// File path: assets/mood_icons/smile.svg
  String get smile => 'assets/mood_icons/smile.svg';

  /// File path: assets/mood_icons/sweating.svg
  String get sweating => 'assets/mood_icons/sweating.svg';

  /// File path: assets/mood_icons/tongue.svg
  String get tongue => 'assets/mood_icons/tongue.svg';

  /// File path: assets/mood_icons/vomitting.svg
  String get vomitting => 'assets/mood_icons/vomitting.svg';

  /// File path: assets/mood_icons/woozy.svg
  String get woozy => 'assets/mood_icons/woozy.svg';

  /// List of all assets
  List<String> get values => [
        angry,
        bandaged,
        calm,
        confused,
        coughing,
        crying,
        dizzy,
        expectorate,
        fever,
        frown,
        glasses,
        happy,
        loudlyCrying,
        nauseous,
        nervous,
        neutral,
        sad,
        sleepy,
        smile,
        sweating,
        tongue,
        vomitting,
        woozy
      ];
}

class Assets {
  Assets._();

  static const $AssetsMoodIconsGen moodIcons = $AssetsMoodIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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
