import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({
    required this.image,
    Key? key,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                Share.share(image);
              });
            },
          )
        ],
      ),
      body: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
      ),
    );
  }
}
