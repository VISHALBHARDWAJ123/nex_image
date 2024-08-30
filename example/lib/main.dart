import 'package:nex_image/nex_image.dart';

import 'generated/assets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const SingleChildScrollView(
        child: Wrap(
          spacing: 8,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text('SVG'),
                NexImage.asset(
                  imagePath: Assets.svgStar,
                ),
              ],
            ),
            Column(
              children: [
                Text('PNG'),
                NexImage.asset(
                  imageType: ImageType.assets,
                  imagePath: Assets.imagesStar,
                ),
              ],
            ),
            Column(
              children: [
                Text('PDF'),
                NexImage.asset(
                  imageType: ImageType.assets,
                  imagePath: Assets.pdfSample,
                ),
              ],
            ),
            Column(
              children: [
                Text('WEBP'),
                NexImage.asset(
                  imageType: ImageType.assets,
                  imagePath: Assets.webp1,
                ),
              ],
            ),
            Column(
              children: [
                Text('BMP'),
                NexImage.asset(
                  imagePath: Assets.bmpSample,
                ),
              ],
            ),
            Column(
              children: [
                Text('GIF'),
                NexImage.asset(
                  imageType: ImageType.assets,
                  imagePath: Assets.gifGif,
                ),
              ],
            ),
            Column(
              children: [
                Text('TIFF'),
                NexImage.asset(
                  imageType: ImageType.assets,
                  imagePath: Assets.tiffTiffSample,
                ),
              ],
            ),
            Column(
              children: [
                Text('HEIC'),
                NexImage.asset(
                  imageType: ImageType.assets,
                  imagePath: Assets.heicSample,
                ),
              ],
            ),
            Column(
              children: [
                Text('Network'),
                NexImage.network(
                  imageUrl: 'https://cdn.myanimelist.net/images/anime/1141/142503.jpg',
                ),
              ],
            ),
            Column(
              children: [
                Text('Lottie Network'),
                NexImage.lottie(
                  imagePath: 'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
                  repeat: true,
                ),
              ],
            ),
            Column(
              children: [
                Text('Lottie Assets'),
                NexImage.lottie(
                  imagePath: Assets.lottieSample,
                  repeat: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
