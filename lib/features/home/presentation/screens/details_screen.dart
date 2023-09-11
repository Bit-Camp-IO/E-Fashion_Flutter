import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/util/size_manager.dart';
import 'package:efashion_flutter/shared/presentation/widgets/container_button.dart';
import 'package:efashion_flutter/shared/presentation/widgets/rounded_corner_clipper.dart';
import 'package:efashion_flutter/shared/presentation/widgets/rounded_skew_clipper.dart';
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

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
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
            width: SizeManager.screenWidth,
            height: SizeManager.screenHeight * 0.6,
            imageUrl: brandProducts[widget.productId].productImage,
            fit: BoxFit.cover,
          ),
          NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              setState(() {
                isSheetExpanded = notification.extent >= 0.85;
              });
              return false;
            },
            child: DraggableScrollableSheet(
              controller: draggableScrollableController,
              initialChildSize:
                  brandProducts[widget.productId].productColors.isNotEmpty
                      ? 0.68
                      : 0.58,
              minChildSize:
                  brandProducts[widget.productId].productColors.isNotEmpty
                      ? 0.68
                      : 0.58,
              builder: (context, scrollController) {
                return ClipPath(
                  clipper: isSheetExpanded
                      ? RoundedCornerClipper(radius: 60.r)
                      : RoundedSkewClipper(),
                  child: Container(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0).r,
                          child: Stack(
                            children: [
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: isSheetExpanded ? 0.0 : 1.0,
                                child: ClippedContainerButton(
                                  onTap: () {
                                    context.popRoute();
                                  },
                                  icon: Iconsax.arrow_left,
                                ),
                              ),
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: isSheetExpanded ? 1.0 : 0.0,
                                child: IconButton(
                                  onPressed: () {
                                    context.popRoute();
                                  },
                                  icon: Icon(
                                    Iconsax.arrow_left,
                                    color:
                                    Theme.of(context).colorScheme.primary,
                                    size: 26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            controller: scrollController,
                            children: [
                              ProductCartComponent(
                                productName:
                                    brandProducts[widget.productId].productName,
                                productColors: brandProducts[widget.productId]
                                    .productColors,
                                productSizes: brandProducts[widget.productId]
                                    .productSizes,
                                productDescription:
                                    brandProducts[widget.productId]
                                        .productDescription,
                                productPieces: brandProducts[widget.productId]
                                    .avaliblePieces,
                                productPrice: brandProducts[widget.productId]
                                    .productPrice,
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
