import 'package:nex_image/nex_image.dart';

class LottieImageWidget extends StatelessWidget {
  const LottieImageWidget({
    super.key,
    double? width,
    double? height,
    BoxFit? fit = BoxFit.fill,
    BlendMode? blendMode,
    AlignmentGeometry? alignment = Alignment.center,
    required String imageFile,
    required ImageErrorWidgetBuilder errorWidget,
    FilterQuality? filterQuality,
    bool? repeat,
    bool? reverse,
  })  : _width = width ?? 100,
        _imagePath = imageFile,
        _errorWidget = errorWidget,
        _fit = fit,
        _repeat = repeat,
        _reverse = reverse,
        _filterQuality = filterQuality,
        _alignment = alignment,
        _height = height ?? 100;

  final double _width, _height;
  final String _imagePath;

  final BoxFit? _fit;

  final bool? _repeat, _reverse;

  final AlignmentGeometry? _alignment;
  final ImageErrorWidgetBuilder _errorWidget;

  final FilterQuality? _filterQuality;

  @override
  Widget build(BuildContext context) {
    return _imagePath.contains('https') || _imagePath.contains('http')
        ? LottieBuilder.network(
            _imagePath,
            width: _width,
            height: _height,
            options: LottieOptions(),
            errorBuilder: _errorWidget,
            fit: _fit,
            decoder: LottieComposition.decodeGZip,
            repeat: _repeat,
            reverse: _reverse,
            alignment: _alignment!,
            animate: true,
            filterQuality: _filterQuality ?? FilterQuality.low,
          )
        : LottieBuilder.asset(
            _imagePath,
            width: _width,
            height: _height,
            errorBuilder: _errorWidget,
            fit: _fit,
            repeat: _repeat,
            reverse: _reverse,
            animate: true,
            alignment: _alignment!,
            filterQuality: _filterQuality ?? FilterQuality.low,
          );
  }
}
