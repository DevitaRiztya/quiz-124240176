import 'package:flutter/material.dart';

class CulinaryImage extends StatelessWidget {
  final String imageUrl;
  final String culinaryName;
  final BoxFit fit;

  const CulinaryImage({
    super.key,
    required this.imageUrl,
    required this.culinaryName,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
            color: const Color(0xFF8E24AA),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: const Color(0xFFF3E5F5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.image_not_supported_outlined,
                  size: 42,
                  color: Color(0xFF8E24AA),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    culinaryName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF4A148C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
