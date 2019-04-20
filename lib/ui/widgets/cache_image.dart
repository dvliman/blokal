import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  final String url;

  CacheImage(this.url);

  @override
  Widget build(BuildContext context) {
    try {
      return Image.network(
        url.replaceAll("file://", ""),
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } catch (e) {
      print("CacheImage: build: err: $e");
      return Container();
    }
  }
}
