import 'dart:io';

import 'package:nex_image/nex_image.dart';

class FileImageWidget extends StatelessWidget {
  const FileImageWidget(
      {super.key,
      double? width,
      double? height,
      BoxFit? fit = BoxFit.fill,
      Color? color,
      BlendMode? blendMode,
      AlignmentGeometry? alignment = Alignment.center,
      required File imageFile,
      required ImageErrorWidgetBuilder errorWidget,
      required ImageFrameBuilder frameWidget,
      FilterQuality? filterQuality,
      ImageRepeat? repeat})
      : _width = width ?? 100,
        _imagePath = imageFile,
        _errorWidget = errorWidget,
        _frameWidget = frameWidget,
        _fit = fit,
        _blendMode = blendMode,
        _color = color,
        _filterQuality = filterQuality,
        _repeat = repeat,
        _alignment = alignment,
        _height = height ?? 100;

  final double _width, _height;
  final File _imagePath;

  final BoxFit? _fit;

  final Color? _color;

  final AlignmentGeometry? _alignment;
  final ImageErrorWidgetBuilder _errorWidget;
  final ImageFrameBuilder _frameWidget;
  final BlendMode? _blendMode;
  final FilterQuality? _filterQuality;
  final ImageRepeat? _repeat;

  @override
  Widget build(BuildContext context) {
    return Image.file(
      _imagePath,
      width: _width,
      height: _height,
      errorBuilder: _errorWidget,
      frameBuilder: _frameWidget,
      colorBlendMode: _blendMode,
      fit: _fit,
      color: _color,
      alignment: _alignment!,
      filterQuality: _filterQuality ?? FilterQuality.low,
      repeat: _repeat ?? ImageRepeat.noRepeat,
    );
  }
}
