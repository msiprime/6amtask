import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/features/home/domain/entity/category_entity.dart';
import 'package:stackfood/features/home/presentation/categories/widget/category_item.dart';

class CategoryShimmerWidget extends StatelessWidget {
  const CategoryShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Skeletonizer(
      justifyMultiLineText: false,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: context.isMobile ? 100 : 150),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CategoryItem(
            category: CategoryEntity(
              parentId: 0,
              childesCount: 0,
              createdAt: '',
              imageFullUrl: '',
              orderCount: 0,
              priority: 0,
              productsCount: 0,
              slug: '',
              status: 0,
              updatedAt: '',
              position: 0,
              id: 0,
              name: 'something',
              image: '',
            ),
          ),
          itemCount: 5,
        ),
      ),
    ));
  }
}
