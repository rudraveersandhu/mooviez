import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/model.dart';

class ShowItem extends StatefulWidget {
  final Show show;
  const ShowItem({super.key,required this.show});

  @override
  State<ShowItem> createState() => _ShowItemState();
}

class _ShowItemState extends State<ShowItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.show.image.medium.isNotEmpty
          ? Container(
        width: 50.0,
        height: 50.0,
        child: CachedNetworkImage(
          imageUrl: widget.show.image.medium,
          fit: BoxFit.cover,
          placeholder: (context, url) => SizedBox(
            width: 50.0,
            height: 50.0,
            child: Shimmer.fromColors(
              baseColor: Colors.black.withRed(50),
              highlightColor: Colors.black.withRed(150),
              child: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.grey[300],
              ),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),

      )
          : SizedBox(
        width: 50.0,
        height: 50.0,
        child: Image.asset(
          'assets/placeholder.png',
          fit: BoxFit.cover,
        ),
      ),
      title: Text(widget.show.name),
      subtitle: Text(widget.show.language),
      trailing: Text(widget.show.rating.average.toString()),
      onTap: () {
        // Add logic to handle item click
      },
    );
  }
}
