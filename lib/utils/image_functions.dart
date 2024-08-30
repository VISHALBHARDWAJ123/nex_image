import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:nex_image/nex_image.dart';

ImageFrameBuilder get defaultImageFrameBuilder => (BuildContext context,
        Widget child, int? frame, bool wasSynchronouslyLoaded) {
      // If the image is loaded synchronously (e.g., a local asset), show the image directly
      if (wasSynchronouslyLoaded) {
        return child;
      }
      // If the image is still loading (frame is null), show a loading spinner
      if (frame == null) {
        return const Center(
          child: CircularProgressIndicator(), // Loading spinner
        );
      }
      // Otherwise, return the loaded image
      return child;
    };

ImageErrorWidgetBuilder get defaultImageErrorBuilder =>
    (context, error, stackTrace) {
      print('[NexImage] Error>>>>>$error');
      // Error fallback
      return const Center(
        child: Icon(
          Icons.error,
          color: Colors.red,
          size: 25,
        ),
      );
    };

ImageFrameBuilder get defaultNetworkImageFrameBuilder => (BuildContext context,
        Widget child, int? frame, bool wasSynchronouslyLoaded) {
      // If the image is loaded synchronously (e.g., a local asset), show the image directly
      if (wasSynchronouslyLoaded) {
        return child;
      }
      // If the image is still loading (frame is null), show a loading spinner
      if (frame == null) {
        return const Center(
          child: CircularProgressIndicator(), // Loading spinner
        );
      }
      // Otherwise, return the loaded image
      return child;
    };

Widget get defaultPlaceholder => const Center(
      child: CircularProgressIndicator(), // Loading spinner
    );

LoadingErrorWidgetBuilder get defaultNetworkImageErrorBuilder =>
    (context, error, stackTrace) {
      print(error.toString());
      // Error fallback
      return const Center(
        child: Icon(
          Icons.error,
          color: Colors.red,
          size: 25,
        ),
      );
    };

Future<PdfPageImage?> getImage({required String imagePPath}) async {
  print('[PDF Image]');
  final document = await PdfDocument.openAsset(imagePPath);

  final page = await document.getPage(1);

  final image = await page.render(
    width: page.width * 2, //decrement for less quality
    height: page.height * 2,
    format: PdfPageImageFormat.jpeg,
    backgroundColor: '#ffffff',

    // Crop rect in image for render
    //cropRect: Rect.fromLTRB(left, top, right, bottom),
  );

  return image;
}

Future<MemoryImage> loadBmpImage(String path) async {
  try {
    print('[BMP Image]');
    // Load BMP file data from assets
    final data = await rootBundle.load(path);
    print(data);
    final bytes = data.buffer.asUint8List();

    // Decode BMP image to Image using the image package
    final img.Image? decodedImage = img.decodeBmp(bytes);

    // Convert decoded Image to a format that Flutter can display
    if (decodedImage != null) {
      final List<int> pngBytes = img.encodePng(decodedImage);
      return MemoryImage(Uint8List.fromList(pngBytes));
    } else {
      throw Exception('Failed to decode BMP image');
    }
  } catch (e) {
    print(e.toString());
    return MemoryImage(Uint8List.fromList([])); // Return
  }
}

Future<MemoryImage> loadTiffImage(String path) async {
  try {
    // Load the TIFF file as a byte array
    final ByteData data = await rootBundle.load(path);
    final Uint8List bytes = data.buffer.asUint8List();

    // Debugging output
    print('Loaded TIFF image with length: ${bytes.length} bytes');

    // Verify that the length of the bytes is reasonable
    if (bytes.isEmpty) {
      throw Exception('The TIFF image is empty or could not be loaded.');
    }

    // Decode the TIFF image using the image package
    final img.Image? decodedImage = img.decodeTiff(bytes);

    // Check if the image was decoded successfully
    if (decodedImage != null) {
      // Convert the decoded image to a PNG for display in Flutter
      final List<int> pngBytes = img.encodePng(decodedImage);
      return MemoryImage(Uint8List.fromList(pngBytes));
    } else {
      throw Exception('Failed to decode TIFF image');
    }
  } catch (e) {
    print('Error loading TIFF image: $e');
    // Fallback to a placeholder image or handle error as needed
    return MemoryImage(
        Uint8List.fromList([])); // Return an empty image as fallback
  }
}
