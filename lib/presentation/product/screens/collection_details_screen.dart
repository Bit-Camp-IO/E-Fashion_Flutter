import 'package:auto_route/annotations.dart';
import 'package:efashion_flutter/presentation/product/bloc/collections_cubit/collections_cubit.dart';
import 'package:efashion_flutter/presentation/product/components/home/collection/collection_item_card.dart';
import 'package:efashion_flutter/presentation/product/components/home/collection/collection_payment_component.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CollectionDetailsScreen extends StatefulWidget {
  final String collectionId;
  final String collectionName;
  final int collectionPrice;

  const CollectionDetailsScreen({
    super.key,
    required this.collectionId,
    required this.collectionName,
    required this.collectionPrice,
  });

  @override
  State<CollectionDetailsScreen> createState() => _CollectionDetailsScreenState();
}

class _CollectionDetailsScreenState extends State<CollectionDetailsScreen> {
  @override
  void initState() {
    context.read<CollectionsCubit>()
      .getCollectionItemsListUseCase(collectionId: widget.collectionId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16).r,
          child: Column(
            children: [
              CustomAppBar(
                appBarTitle: '${widget.collectionName} Collection',
                disableBackButton: false,
                appBarType: AppBarType.normal,
              ),
              BlocBuilder<CollectionsCubit, CollectionsState>(
                buildWhen: (previous, current) =>
                    previous.collectionItemsState !=
                    current.collectionItemsState,
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.collectionItemsList.length,
                      padding: const EdgeInsets.only(bottom: 200).r,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0).r,
                          child: CollectionItemCard(
                            description:
                                state.collectionItemsList[index].description,
                            image: state.collectionItemsList[index].image,
                            title: state.collectionItemsList[index].title,
                            isReversed: index % 2 == 0,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CollectionPaymentComponent(
            collectionPrice: widget.collectionPrice,
            collectionId: widget.collectionId,
          ),
        )
      ],
    );
  }
}
