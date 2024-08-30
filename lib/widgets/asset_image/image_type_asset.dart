import 'dart:typed_data';

import 'package:nex_image/nex_image.dart';

class ImageTypeAsset extends StatelessWidget {
  const ImageTypeAsset({
    super.key,
    double? width,
    double? height,
    BoxFit? fit = BoxFit.fill,
    Color? color,
    BlendMode? blendMode,
    AlignmentGeometry? alignment = Alignment.center,
    required String imagePath,
    required ImageErrorWidgetBuilder errorWidget,
    required ImageFrameBuilder frameWidget,
    ImageRepeat? repeat,
    FilterQuality? filterQuality,
  })  : _width = width ?? 100,
        _imagePath = imagePath,
        _errorWidget = errorWidget,
        _frameWidget = frameWidget,
        _fit = fit,
        _blendMode = blendMode,
        _color = color,
        _alignment = alignment,
        _repeat = repeat,
        _filterQuality = filterQuality,
        _height = height ?? 100;

  final double _width, _height;
  final String _imagePath;

  final BoxFit? _fit;

  final Color? _color;

  final AlignmentGeometry? _alignment;
  final ImageErrorWidgetBuilder _errorWidget;
  final ImageFrameBuilder _frameWidget;
  final BlendMode? _blendMode;
  final ImageRepeat? _repeat;
  final FilterQuality? _filterQuality;

  @override
  Widget build(BuildContext context) {
    return _imagePath.contains('.svg')
        ? _SvgAssetImage(
            imagePath: _imagePath,
            width: _width,
            height: _height,
            errorWidget: _errorWidget,
            frameWidget: _frameWidget,
            blendMode: _blendMode,
            fit: _fit,
            color: _color,
            alignment: _alignment!,
          )
        : _imagePath.contains('.pdf')
            ? _PdfAssetImage(
                imagePath: _imagePath,
                width: _width,
                height: _height,
                errorWidget: _errorWidget,
                frameWidget: _frameWidget,
                blendMode: _blendMode,
                fit: _fit,
                color: _color,
                alignment: _alignment!,
              )
            : _imagePath.contains('.bmp')
                ? _BitmapAssetImage(
                    imagePath: _imagePath,
                    width: _width,
                    height: _height,
                    errorWidget: _errorWidget,
                    frameWidget: _frameWidget,
                    blendMode: _blendMode,
                    fit: _fit,
                    color: _color,
                    alignment: _alignment!,
                  )
                : _imagePath.contains('.tiff') || _imagePath.contains('.tif')
                    ? _TiffAssetImage(
                        imagePath: _imagePath,
                        width: _width,
                        height: _height,
                        errorWidget: _errorWidget,
                        frameWidget: _frameWidget,
                        blendMode: _blendMode,
                        fit: _fit,
                        color: _color,
                        alignment: _alignment!,
                      )
                    : Image.asset(
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

/// SVG Assets Image

class _SvgAssetImage extends StatelessWidget {
  const _SvgAssetImage({
    double? width,
    double? height,
    BoxFit? fit = BoxFit.fill,
    Color? color,
    BlendMode? blendMode,
    AlignmentGeometry? alignment = Alignment.center,
    required String imagePath,
    required ImageErrorWidgetBuilder errorWidget,
    required ImageFrameBuilder frameWidget,
  })  : _width = width ?? 100,
        _imagePath = imagePath,
        _errorWidget = errorWidget,
        _frameWidget = frameWidget,
        _fit = fit,
        _blendMode = blendMode,
        _color = color,
        _alignment = alignment,
        _height = height ?? 100;

  final double _width, _height;
  final String _imagePath;

  final BoxFit? _fit;

  final Color? _color;

  final AlignmentGeometry? _alignment;
  final ImageErrorWidgetBuilder _errorWidget;
  final ImageFrameBuilder _frameWidget;
  final BlendMode? _blendMode;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: Svg(_imagePath),
      width: _width,
      height: _height,
      fit: _fit,
      color: _color,
      alignment: _alignment!,
      errorBuilder: _errorWidget,
      frameBuilder: _frameWidget,
      colorBlendMode: _blendMode,
    );
  }
}

/// PDF Assets Image
class _PdfAssetImage extends StatelessWidget {
  const _PdfAssetImage({
    double? width,
    double? height,
    BoxFit? fit = BoxFit.fill,
    Color? color,
    BlendMode? blendMode,
    AlignmentGeometry? alignment = Alignment.center,
    required String imagePath,
    required ImageErrorWidgetBuilder errorWidget,
    required ImageFrameBuilder frameWidget,
  })  : _width = width ?? 100,
        _imagePath = imagePath,
        _errorWidget = errorWidget,
        _frameWidget = frameWidget,
        _fit = fit,
        _blendMode = blendMode,
        _color = color,
        _alignment = alignment,
        _height = height ?? 100;

  final double _width, _height;
  final String _imagePath;

  final BoxFit? _fit;

  final Color? _color;

  final AlignmentGeometry? _alignment;
  final ImageErrorWidgetBuilder _errorWidget;
  final ImageFrameBuilder _frameWidget;
  final BlendMode? _blendMode;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getImage(imagePPath: _imagePath), //<- created image
        builder: (context, AsyncSnapshot<PdfPageImage?> snapshot) {
          // data is ready
          if (snapshot.hasData) {
            PdfPageImage image = snapshot.data!;
            return Image.memory(
              image.bytes,
              width: _width,
              height: _height,
              fit: _fit,
              color: _color,
              alignment: _alignment!,
              errorBuilder: _errorWidget,
              frameBuilder: _frameWidget,
              colorBlendMode: _blendMode,
            );

            // loading
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

/// Bitmap Assets Image
class _BitmapAssetImage extends StatelessWidget {
  const _BitmapAssetImage({
    double? width,
    double? height,
    BoxFit? fit = BoxFit.fill,
    Color? color,
    BlendMode? blendMode,
    AlignmentGeometry? alignment = Alignment.center,
    required String imagePath,
    required ImageErrorWidgetBuilder errorWidget,
    required ImageFrameBuilder frameWidget,
  })  : _width = width ?? 100,
        _imagePath = imagePath,
        _errorWidget = errorWidget,
        _frameWidget = frameWidget,
        _fit = fit,
        _blendMode = blendMode,
        _color = color,
        _alignment = alignment,
        _height = height ?? 100;

  final double _width, _height;
  final String _imagePath;

  final BoxFit? _fit;

  final Color? _color;

  final AlignmentGeometry? _alignment;
  final ImageErrorWidgetBuilder _errorWidget;
  final ImageFrameBuilder _frameWidget;
  final BlendMode? _blendMode;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadBmpImage(_imagePath), //<- created image
        builder: (context, AsyncSnapshot<MemoryImage?> snapshot) {
          // data is ready
          if (snapshot.hasData) {
            return Image(
              image: snapshot.data!,
              width: _width,
              height: _height,
              fit: _fit,
              color: _color,
              alignment: _alignment!,
              errorBuilder: _errorWidget,
              frameBuilder: _frameWidget,
              colorBlendMode: _blendMode,
            );

            // loading
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

/// Tiff Assets Image
class _TiffAssetImage extends StatefulWidget {
  const _TiffAssetImage({
    double? width,
    double? height,
    BoxFit? fit = BoxFit.fill,
    Color? color,
    BlendMode? blendMode,
    AlignmentGeometry? alignment = Alignment.center,
    required String imagePath,
    required ImageErrorWidgetBuilder errorWidget,
    required ImageFrameBuilder frameWidget,
  })  : _width = width ?? 100,
        _imagePath = imagePath,
        _errorWidget = errorWidget,
        _frameWidget = frameWidget,
        _fit = fit,
        _blendMode = blendMode,
        _color = color,
        _alignment = alignment,
        _height = height ?? 100;

  final double _width, _height;
  final String _imagePath;

  final BoxFit? _fit;

  final Color? _color;

  final AlignmentGeometry? _alignment;
  final ImageErrorWidgetBuilder _errorWidget;
  final ImageFrameBuilder _frameWidget;
  final BlendMode? _blendMode;

  @override
  State<_TiffAssetImage> createState() => _TiffAssetImageState();
}

class _TiffAssetImageState extends State<_TiffAssetImage> {
  MemoryImage snapshot = MemoryImage(Uint8List.fromList([]));
  int imageState = 1;

  void setImage() async {
    imageState = 1;
    try {
      snapshot = await loadTiffImage(widget._imagePath);
    } catch (e) {
      snapshot = MemoryImage(Uint8List.fromList([]));
    }
    imageState = 0;
    setState(() {});
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void initState() {
    setImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (imageState == 0) {
      return Image(
        image: snapshot,
        width: widget._width,
        height: widget._height,
        fit: widget._fit,
        color: widget._color,
        alignment: widget._alignment!,
        errorBuilder: widget._errorWidget,
        frameBuilder: widget._frameWidget,
        colorBlendMode: widget._blendMode,
      );

      // loading
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    ;
  }
}
