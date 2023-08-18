import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/widgets/rounded_corner_clipper.dart';
import 'package:efashion_flutter/core/widgets/rounded_skew_clipper.dart';
import 'package:efashion_flutter/features/home/presentation/components/details/product_cart_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/details/rating_and_reviews_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/details/similar_component.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with TickerProviderStateMixin{
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  int productPieces = 0;
  bool isSheetExpanded = false;
  late DraggableScrollableController draggableScrollableController;

  @override
  void initState() {
    draggableScrollableController = DraggableScrollableController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            width: MediaQuery.sizeOf(context).width,
            height: 450.h,
            imageUrl: brandProducts[widget.productId].productImage,
            fit: BoxFit.cover,
          ),
          NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              setState(() {
                isSheetExpanded = notification.extent >= 0.75;
              });
              return false;
            },
            child: DraggableScrollableSheet(
              controller: draggableScrollableController,
              initialChildSize:
                  brandProducts[widget.productId].productColors.isNotEmpty
                      ? 0.65
                      : 0.55,
              minChildSize:
                  brandProducts[widget.productId].productColors.isNotEmpty
                      ? 0.65
                      : 0.55,
              builder: (context, scrollController) {
                    return ClipPath(
                      clipper: isSheetExpanded ? RoundedCornerClipper(radius: 60.r) : RoundedSkewClipper(),
                      child: Container(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        child: Column(
                          children: [
                            SizedBox(height: 30.h),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10).r,
                                child: IconButton(
                                  onPressed: () {
                                    context.popRoute();
                                  },
                                  icon: Icon(
                                    Iconsax.arrow_left,
                                    color: Theme.of(context).colorScheme.primary,
                                    size: 26,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                controller: scrollController,
                                children: [
                                  ProductCartComponent(
                                    productName:
                                    brandProducts[widget.productId].productName,
                                    productColors:
                                    brandProducts[widget.productId].productColors,
                                    productSizes:
                                    brandProducts[widget.productId].productSizes,
                                    productDescription: brandProducts[widget.productId]
                                        .productDescription,
                                    productPieces:
                                    brandProducts[widget.productId].avaliblePieces,
                                    productPrice:
                                    brandProducts[widget.productId].productPrice,
                                  ),
                                  RatingAndReviewsComponent(
                                    productId: widget.productId,
                                  ),
                                  SimilarComponent(productId: widget.productId),
                                  SizedBox(height: 10.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}