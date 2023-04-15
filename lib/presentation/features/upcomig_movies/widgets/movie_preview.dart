import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mdb_clean_archi/domain/model/movie.dart';

class MoviePreview extends StatelessWidget {
  static const _size = 100.0;

  final Movie movie;
  const MoviePreview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          if (movie.imageUrl != null)
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 8.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: SizedBox(
                width: _size,
                height: _size,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(imageUrl: movie.imageUrl!),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
