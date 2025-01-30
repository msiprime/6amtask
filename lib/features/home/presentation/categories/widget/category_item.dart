// import 'package:flutter/material.dart';
// import 'package:stackfood/core/global/constants/app_size.dart';
// import 'package:stackfood/core/global/constants/app_spacing.dart';
// import 'package:stackfood/core/global/extension/context_extension.dart';
// import 'package:stackfood/core/global/widgets/image_thumbnail.dart';
// import 'package:stackfood/features/home/domain/entity/category_entity.dart';
//
// class CategoryItem extends StatelessWidget {
//   final CategoryEntity category;
//
//   const CategoryItem({
//     super.key,
//     required this.category,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: AppSpacing.md),
//       child: Column(
//         children: [
//           Container(
//             height: 60,
//             width: 60,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(AppSpacing.lg),
//               boxShadow: const [
//                 BoxShadow(
//                     color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
//               ],
//             ),
//             child: Center(
//               child: CustomImageWidget(
//                 borderRadius: BorderRadius.circular(AppSize.xs),
//                 imageUrl: category.imageFullUrl,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           const SizedBox(height: AppSpacing.md),
//           Text(
//             category.name,
//             softWrap: true,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//             style: context.theme.textTheme.labelLarge,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:stackfood/core/global/constants/app_size.dart';
import 'package:stackfood/core/global/constants/app_spacing.dart';
import 'package:stackfood/core/global/extension/context_extension.dart';
import 'package:stackfood/core/global/widgets/image_thumbnail.dart';
import 'package:stackfood/features/home/domain/entity/category_entity.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight * 0.6;
        return Padding(
          padding: const EdgeInsets.only(left: AppSpacing.md),
          child: Column(
            children: [
              Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSpacing.lg),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2)),
                  ],
                ),
                child: Center(
                  child: CustomImageWidget(
                    borderRadius: BorderRadius.circular(AppSize.xs),
                    imageUrl: category.imageFullUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                category.name,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.labelLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}
