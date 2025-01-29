import 'package:flutter/material.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/image_thumbnail.dart';

class CategoryItem extends StatelessWidget {
  final String imageURL;
  final String title;

  const CategoryItem({
    super.key,
    required this.imageURL,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 2, offset: Offset(0, 2)),
            ],
          ),
          child: Center(
            child: CustomImageWidget(
              imageUrl: imageURL,
              height: 40,
              width: 40,
            ), // Load the icon
          ),
        ),
        SizedBox(height: 6),
        Text(
          title,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          textWidthBasis: TextWidthBasis.parent,
          style: context.theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
