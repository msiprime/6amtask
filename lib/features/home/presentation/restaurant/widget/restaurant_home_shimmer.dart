import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stackfood/core/global/effect/static_shimmer_effect.dart';
import 'package:stackfood/features/home/domain/entity/restaurant_entity.dart';
import 'package:stackfood/features/home/presentation/restaurant/widget/restaurant_item_card.dart';

class RestaurantShimmer extends StatelessWidget {
  final bool useSliver;
  final bool isAnimated;

  const RestaurantShimmer(
      {super.key, this.useSliver = true, this.isAnimated = true});

  @override
  Widget build(BuildContext context) {
    final shimmerWidget = Skeletonizer(
      effect: isAnimated ? null : StaticShimmerEffect(),
      child: RestaurantItemCard(
        restaurant: RestaurantEntity(
          id: 0,
          name: "Restaurant Name",
          gstStatus: false,
          gstCode: "GST Code",
          freeDeliveryDistanceStatus: false,
          coverPhotoFullUrl: "https://via.placeholder.com/150",
          characteristics: [],
          email: "",
          status: 0,
          active: false,
          additionalDocuments: "aaa",
          address: "Dhaka, Bangladesh",
          announcement: 0,
          announcementMessage: "asdasds",
          avgRating: 0,
          coverPhoto: "https://via.placeholder.com/150",
          currentOpeningTime: "2021-09-01T00:00:00",
          customerDateOrderStatus: false,
          customerOrderDate: 0,
          cutlery: false,
          delivery: false,
          deliveryFee: "asdasd",
          deliveryTime: "00:00",
          distance: 0,
          extraPackagingAmount: 0,
          extraPackagingStatus: false,
          foodsCount: 0,
          foodSection: false,
          freeDelivery: false,
          freeDeliveryDistanceValue: "asd",
          halalTagStatus: false,
          instantOrder: false,
          isDineInActive: false,
          isExtraPackagingActive: false,
          phone: '1234567890',
          latitude: '',
          longitude: '',
          tax: 0,
          minimumOrder: 0,
          scheduleOrder: false,
          vendorId: 0,
          takeAway: false,
          zoneId: 1,
          reviewsSection: false,
          offDay: '',
          selfDeliverySystem: 0,
          posSystem: false,
          minimumShippingCharge: 0,
          veg: 0,
          nonVeg: 0,
          orderCount: 0,
          totalOrder: 0,
          restaurantModel: '',
          slug: '',
          orderSubscriptionActive: false,
          metaTitle: '',
          metaDescription: '',
          metaImage: '',
          open: 0,
          reviewsCommentsCount: 0,
          restaurantStatus: 0,
          ratingCount: 0,
          logoFullUrl: "",
          metaImageFullUrl: "",
          positiveRating: 0,
          scheduleAdvanceDineInBookingDuration: 0,
          scheduleAdvanceDineInBookingDurationTimeFormat: "",
        ),
      ),
    );

    return useSliver ? SliverToBoxAdapter(child: shimmerWidget) : shimmerWidget;
  }
}
