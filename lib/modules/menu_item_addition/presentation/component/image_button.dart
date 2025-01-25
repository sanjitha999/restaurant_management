import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadButton extends StatelessWidget {
  final ImageSource source;
  final void Function() onTap;

  const ImageUploadButton({
    super.key,
    required this.source,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String src = source == ImageSource.camera ? "Camera" : "Gallery";
    IconData srcIcon =
        source == ImageSource.camera ? Icons.camera_alt : Icons.image_outlined;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            srcIcon,
            size: 30,
          ),
          Text(src)
        ],
      ),
    );
  }
}
