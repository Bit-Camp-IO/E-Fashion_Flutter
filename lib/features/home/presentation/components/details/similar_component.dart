import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/brand_card.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/section_widget.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarComponent extends StatefulWidget {
  const SimilarComponent({super.key, required this.productId});
  final int productId;

  @override
  State<SimilarComponent> createState() => _SimilarComponentState();
}

class _SimilarComponentState extends State<SimilarComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidget(
          sectionTitle: 'Similar',
          enableTextButton: true,
          sectionButtonTitle: 'See All',
          onTextButtonTap: () {},
        ),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            itemCount: brandProducts.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index != widget.productId) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: BrandCard(
                    productName: brandProducts[index].productName,
                    productImage: brandProducts[index].productImage,
                    productPrice: brandProducts[index].productPrice,
                    isCartActive: false,
                    onTap: () {
                      context.pushRoute(
                        DetailsRoute(
                          productId: brandProducts[index].productId,
                        ),
                      );
                    },
                    onFavoriteTap: () {
                      setState(() {
                        brandProducts[index].isFavorite =
                        !brandProducts[index].isFavorite;
                      });
                    },
                    isFavorite: brandProducts[index].isFavorite,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
