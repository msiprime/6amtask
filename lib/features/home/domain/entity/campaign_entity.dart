class CampaignEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final String discountType;
  final String imageUrl;
  final String restaurantName;
  final double averageRating;
  final String address;

  const CampaignEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.discountType,
    required this.imageUrl,
    required this.restaurantName,
    required this.averageRating,
    required this.address,
  });

  double getDiscountPercentage() {
    if (discountType == "percent") {
      return discount;
    } else if (discountType == "amount") {
      return (discount / price) * 100;
    }
    return 0.0;
  }

  double getDiscountedPrice() {
    if (discountType == "percent") {
      return price - (price * discount / 100);
    } else if (discountType == "amount") {
      return price - discount;
    }
    return price;
  }
}
