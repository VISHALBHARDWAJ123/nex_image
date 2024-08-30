import 'package:nex_image/nex_image.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget(
      {super.key,
      double? width,
      double? height,
      BoxFit? fit = BoxFit.fill,
      Color? color,
      BlendMode? blendMode,
      Alignment? alignment = Alignment.center,
      required String imageUrl,
      required LoadingErrorWidgetBuilder errorWidget,
      required Widget placeholder,
      ImageRepeat? repeat,
      FilterQuality? filterQuality,
      int? memCacheWidth,
      int? memCacheHeight,
      int? maxWidthDiskCache,
      int? maxHeightDiskCache,
      ValueChanged<Object>? errorListener,
      bool? matchTextDirection,
      Map<String, String>? httpHeaders,
      bool? useOldImageOnUrlChange})
      : _width = width ?? 100,
        _imageUrl = imageUrl,
        _errorWidget = errorWidget,
        _fit = fit,
        _blendMode = blendMode,
        _color = color,
        _alignment = alignment ?? Alignment.center,
        _placeholder = placeholder,
        _height = height ?? 100,
        _repeat = repeat ?? ImageRepeat.noRepeat,
        _filterQuality = filterQuality ?? FilterQuality.low,
        _memCacheWidth = memCacheWidth,
        _memCacheHeight = memCacheHeight,
        _httpHeaders = httpHeaders,
        _errorListener = errorListener,
        _maxHeightDiskCache = maxHeightDiskCache,
        _maxWidthDiskCache = maxWidthDiskCache,
        _matchTextDirection = matchTextDirection ?? false,
        _useOldImageOnUrlChange = useOldImageOnUrlChange ?? false;

  final double _width, _height;
  final String _imageUrl;

  final BoxFit? _fit;

  final Color? _color;

  final Alignment _alignment;
  final LoadingErrorWidgetBuilder _errorWidget;

  final BlendMode? _blendMode;
  final Widget _placeholder;
  final FilterQuality _filterQuality;

  final int? _memCacheWidth;

  final int? _memCacheHeight;

  final int? _maxWidthDiskCache;

  final int? _maxHeightDiskCache;

  final ValueChanged<Object>? _errorListener;
  final ImageRepeat _repeat;

  final bool _matchTextDirection;

  final Map<String, String>? _httpHeaders;

  final bool _useOldImageOnUrlChange;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _imageUrl,
      width: _width,
      matchTextDirection: _matchTextDirection,
      height: _height,
      fit: _fit,
      color: _color,
      alignment: _alignment,
      errorWidget: _errorWidget,
      placeholder: (ctx, _) => _placeholder,
      colorBlendMode: _blendMode,
      errorListener: _errorListener,
      maxHeightDiskCache: _maxHeightDiskCache,
      maxWidthDiskCache: _maxWidthDiskCache,
      httpHeaders: _httpHeaders,
      memCacheHeight: _memCacheHeight,
      memCacheWidth: _memCacheWidth,
      repeat: _repeat,
      useOldImageOnUrlChange: _useOldImageOnUrlChange,
      filterQuality: _filterQuality,
    );
  }
}
