import 'dart:io';

import 'package:nex_image/nex_image.dart';
import 'package:nex_image/widgets/file_image/file_image_widget.dart';

import 'lottie_image/lottie_image_widget.dart';

class NexImage extends StatefulWidget {
  /// For Asset Image
  const NexImage.asset({
    super.key,
    ImageType? imageType = ImageType.assets,
    double? width,
    double? height,
    BoxFit? fit = BoxFit.fill,
    Color? color,
    ImageErrorWidgetBuilder? errorWidget,
    ImageFrameBuilder? frameWidget,
    BlendMode? blendMode,
    ImageRepeat? repeat,
    FilterQuality? filterQuality,
    AlignmentGeometry? alignment = Alignment.center,
    required String imagePath,
  })  : _imageType = imageType ?? ImageType.assets,
        _width = width ?? 100,
        _imageFile = null,
        _imagePath = imagePath,
        _errorWidget = errorWidget,
        _frameWidget = frameWidget,
        _fit = fit,
        _blendMode = blendMode,
        _color = color,
        _alignment = alignment,
        _height = height ?? 100,
        _memCacheHeight = null,
        _errorListener = null,
        _errorWidgetForNetwork = null,
        _placeholder = null,
        _filterQuality = filterQuality,
        _repeat = repeat ?? ImageRepeat.noRepeat,
        _memCacheWidth = null,
        _maxWidthDiskCache = null,
        _maxHeightDiskCache = null,
        _matchTextDirection = false,
        _httpHeaders = null,
        _reverse = false,
        _repeatLottie = false,
        _imgAlignment = Alignment.center,
        _useOldImageOnUrlChange = false;

  /// For File Image
  const NexImage.file({
    super.key,
    ImageType? imageType = ImageType.assets,
    double? width,
    double? height,
    BoxFit? fit = BoxFit.fill,
    Color? color,
    ImageErrorWidgetBuilder? errorWidget,
    ImageFrameBuilder? frameWidget,
    BlendMode? blendMode,
    ImageRepeat? repeat,
    FilterQuality? filterQuality,
    AlignmentGeometry? alignment = Alignment.center,
    required File imagePath,
  })  : _imageType = imageType ?? ImageType.file,
        _width = width ?? 100,
        _imageFile = imagePath,
        _imagePath = '',
        _errorWidget = errorWidget,
        _frameWidget = frameWidget,
        _fit = fit,
        _blendMode = blendMode,
        _color = color,
        _alignment = alignment,
        _height = height ?? 100,
        _memCacheHeight = null,
        _errorListener = null,
        _errorWidgetForNetwork = null,
        _placeholder = null,
        _filterQuality = filterQuality,
        _repeat = repeat ?? ImageRepeat.noRepeat,
        _memCacheWidth = null,
        _maxWidthDiskCache = null,
        _reverse = false,
        _repeatLottie = false,
        _maxHeightDiskCache = null,
        _matchTextDirection = false,
        _httpHeaders = null,
        _imgAlignment = Alignment.center,
        _useOldImageOnUrlChange = false;

  /// For Network Image
  const NexImage.network({
    super.key,
    double? width,
    double? height,
    BoxFit? fit = BoxFit.fill,
    Color? color,
    BlendMode? blendMode,
    Alignment? alignment = Alignment.center,
    required String imageUrl,
    LoadingErrorWidgetBuilder? errorWidget,
    Widget? placeholder,
    ImageRepeat? repeat,
    FilterQuality? filterQuality,
    int? memCacheWidth,
    int? memCacheHeight,
    int? maxWidthDiskCache,
    int? maxHeightDiskCache,
    ValueChanged<Object>? errorListener,
    bool? matchTextDirection,
    Map<String, String>? httpHeaders,
    bool? useOldImageOnUrlChange,
  })  : _width = width ?? 100,
        _imagePath = imageUrl,
        _imageFile = null,
        _errorWidgetForNetwork = errorWidget,
        _fit = fit,
        _blendMode = blendMode,
        _color = color,
        _alignment = Alignment.center,
        _imgAlignment = alignment,
        _placeholder = placeholder,
        _height = height ?? 100,
        _reverse = false,
        _repeatLottie = false,
        _repeat = repeat ?? ImageRepeat.noRepeat,
        _filterQuality = filterQuality ?? FilterQuality.low,
        _memCacheWidth = memCacheWidth,
        _memCacheHeight = memCacheHeight,
        _httpHeaders = httpHeaders,
        _errorListener = errorListener,
        _maxHeightDiskCache = maxHeightDiskCache,
        _maxWidthDiskCache = maxWidthDiskCache,
        _matchTextDirection = matchTextDirection ?? false,
        _useOldImageOnUrlChange = useOldImageOnUrlChange ?? false,
        _imageType = ImageType.networkImages,
        _errorWidget = null,
        _frameWidget = null;

  /// For Lottie Animation
  const NexImage.lottie({
    super.key,
    double? width,
    double? height,
    BoxFit? fit = BoxFit.fill,
    Color? color,
    ImageErrorWidgetBuilder? errorWidget,
    ImageFrameBuilder? frameWidget,
    BlendMode? blendMode,
    FilterQuality? filterQuality,
    bool? repeat,
    bool? reverse,
    AlignmentGeometry? alignment = Alignment.center,
    required String imagePath,
  })  : _imageType = ImageType.lottie,
        _width = width ?? 100,
        _imagePath = imagePath,
        _errorWidget = errorWidget,
        _frameWidget = frameWidget,
        _fit = fit,
        _blendMode = blendMode,
        _color = color,
        _alignment = alignment,
        _height = height ?? 100,
        _repeatLottie = repeat ?? false,
        _memCacheHeight = null,
        _errorListener = null,
        _errorWidgetForNetwork = null,
        _placeholder = null,
        _filterQuality = filterQuality,
        _repeat = ImageRepeat.noRepeat,
        _memCacheWidth = null,
        _maxWidthDiskCache = null,
        _maxHeightDiskCache = null,
        _reverse = reverse ?? false,
        _matchTextDirection = false,
        _httpHeaders = null,
        _imgAlignment = Alignment.center,
        _imageFile = null,
        _useOldImageOnUrlChange = false;
  final ImageType? _imageType;

  final double _width, _height;
  final String _imagePath;

  final BoxFit? _fit;

  final Color? _color;

  final AlignmentGeometry? _alignment;
  final ImageErrorWidgetBuilder? _errorWidget;
  final ImageFrameBuilder? _frameWidget;
  final BlendMode? _blendMode;

  final LoadingErrorWidgetBuilder? _errorWidgetForNetwork;

  final Widget? _placeholder;
  final FilterQuality? _filterQuality;

  final int? _memCacheWidth;

  final int? _memCacheHeight;

  final int? _maxWidthDiskCache;
  final Alignment? _imgAlignment;

  final int? _maxHeightDiskCache;

  final ValueChanged<Object>? _errorListener;
  final ImageRepeat _repeat;
  final bool _repeatLottie;

  final bool _matchTextDirection;

  final Map<String, String>? _httpHeaders;

  final bool _useOldImageOnUrlChange;

  final File? _imageFile;

  final bool _reverse;

  @override
  State<NexImage> createState() => _NexImageState();
}

class _NexImageState extends State<NexImage> {
  @override
  Widget build(BuildContext context) {
    return widget._imageType == ImageType.networkImages
        ? NetworkImageWidget(
            imageUrl: widget._imagePath,
            width: widget._width,
            matchTextDirection: widget._matchTextDirection,
            height: widget._height,
            fit: widget._fit,
            color: widget._color,
            alignment: widget._imgAlignment,
            errorWidget: widget._errorWidgetForNetwork ?? defaultNetworkImageErrorBuilder,
            placeholder: widget._placeholder ?? defaultPlaceholder,
            errorListener: widget._errorListener,
            maxHeightDiskCache: widget._maxHeightDiskCache,
            maxWidthDiskCache: widget._maxWidthDiskCache,
            httpHeaders: widget._httpHeaders,
            memCacheHeight: widget._memCacheHeight,
            memCacheWidth: widget._memCacheWidth,
            repeat: widget._repeat,
            useOldImageOnUrlChange: widget._useOldImageOnUrlChange,
            filterQuality: widget._filterQuality,
          )
        : widget._imageType == ImageType.file
            ? FileImageWidget(
                imageFile: widget._imageFile!,
                alignment: widget._alignment,
                color: widget._color,
                fit: widget._fit,
                width: widget._width,
                height: widget._height,
                filterQuality: widget._filterQuality,
                repeat: widget._repeat,
                errorWidget: widget._errorWidget ?? defaultImageErrorBuilder,
                frameWidget: widget._frameWidget ?? defaultImageFrameBuilder,
                blendMode: widget._blendMode,
              )
            : widget._imageType == ImageType.lottie
                ? LottieImageWidget(
                    imageFile: widget._imagePath,
                    alignment: widget._alignment,
                    fit: widget._fit,
                    width: widget._width,
                    height: widget._height,
                    filterQuality: widget._filterQuality,
                    repeat: widget._repeatLottie,
                    errorWidget: widget._errorWidget ?? defaultImageErrorBuilder,
                    reverse: widget._reverse,
                    blendMode: widget._blendMode,
                  )
                : ImageTypeAsset(
                    imagePath: widget._imagePath,
                    alignment: widget._alignment,
                    color: widget._color,
                    fit: widget._fit,
                    width: widget._width,
                    height: widget._height,
                    filterQuality: widget._filterQuality,
                    repeat: widget._repeat,
                    errorWidget: widget._errorWidget ?? defaultImageErrorBuilder,
                    frameWidget: widget._frameWidget ?? defaultImageFrameBuilder,
                    blendMode: widget._blendMode,
                  );
  }
}
