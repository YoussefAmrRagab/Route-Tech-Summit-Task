import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:route_flutter_task/config/app_colors.dart';
import 'package:route_flutter_task/config/app_styles.dart';
import 'package:route_flutter_task/data/models/product.dart';
import 'package:route_flutter_task/utils/extensions.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
    required this.lastItems,
  });

  final Product product;
  final bool lastItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: lastItems ? 10 : 0),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.darkCerulean.withOpacity(.2),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: buildProductImage(),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: buildFavouriteButton(),
                )
              ],
            ),
          ),
          buildText(product.title),
          buildText(product.description),
          8.0.margin,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EGP ${product.priceAfterDiscount.toStringAsFixed(product.priceAfterDiscount > 999 ? 0 : 2)}',
                  style: TextStyles.normalBlack12spW500,
                ),
                Text(
                  '${product.priceBeforeDiscount.toStringAsFixed(product.priceBeforeDiscount > 999 ? 0 : 2)} EGP',
                  style: TextStyles.lineThroughSteelBlue12spW500,
                ),
              ],
            ),
          ),
          8.0.margin,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildReview(),
                buildAddButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildAddButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.darkCerulean,
        ),
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  Row buildReview() {
    return Row(
      children: [
        Text(
          'Review (${product.rating})',
          style: TextStyles.normalBlack12spW500,
        ),
        const Icon(
          Icons.star_rounded,
          color: Colors.yellow,
        )
      ],
    );
  }

  ClipRRect buildProductImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(9),
        topRight: Radius.circular(9),
      ),
      child: CachedNetworkImage(
        imageUrl: product.thumbnail,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (_, __, ___) => const Center(
          child: CircularProgressIndicator(
            color: AppColors.steelBlue,
          ),
        ),
        errorWidget: (_, __, ___) => const Center(
          child: Icon(
            Icons.error_outline_rounded,
            color: Colors.red,
            size: 50,
          ),
        ),
      ),
    );
  }

  GestureDetector buildFavouriteButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: const Icon(
          Icons.favorite_border_rounded,
          color: AppColors.darkCerulean,
        ),
      ),
    );
  }

  Widget buildText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        text,
        style: TextStyles.normalBlack12spW500,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
