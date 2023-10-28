import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/home/categories/categories_button.dart';
import 'package:efashion_flutter/presentation/product/components/home/categories/categories_shimmer_loading.dart';
import 'package:efashion_flutter/presentation/product/components/home/categories/genders_categories.dart';
import 'package:efashion_flutter/presentation/product/components/shared/section_widget.dart';
import 'package:efashion_flutter/presentation/product/components/home/categories/titled_avatar.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesComponent extends StatefulWidget {
  const CategoriesComponent({super.key});

  @override
  State<CategoriesComponent> createState() => _CategoriesComponentState();
}

class _CategoriesComponentState extends State<CategoriesComponent> {
  late final ScrollController _categoriesController;
  ValueNotifier<double> animatedGendersWidth = ValueNotifier(145);
  List selectedCategories = [];
  ValueNotifier<bool> isApplyButtonActiveNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    _categoriesController = ScrollController()..addListener(_onSwipeListener);
    super.initState();
  }

  void _onSwipeListener() {
    final maxScroll = _categoriesController.position.maxScrollExtent;
    final currentScroll = _categoriesController.offset;
    final scrollDirection = _categoriesController.position.userScrollDirection;
    if (_categoriesController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (animatedGendersWidth.value != 0) {
        animatedGendersWidth.value = 0;
      }
    }
    if (scrollDirection == ScrollDirection.forward &&
        currentScroll < maxScroll * 0.05) {
      if (animatedGendersWidth.value != 145) {
        animatedGendersWidth.value = 145;
      }
    }
  }

  void _handelCategories({required String categoryId}) {
    if (selectedCategories.contains(categoryId)) {
      selectedCategories.removeWhere((element) => element == categoryId);
    } else {
      selectedCategories.add(categoryId);
    }
    if (selectedCategories.isNotEmpty) {
      isApplyButtonActiveNotifier.value = selectedCategories.isNotEmpty;
    } else {
      isApplyButtonActiveNotifier.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.categoriesState != current.categoriesState,
      builder: (context, state) {
        if (state.categories.isEmpty) {
          return const CategoriesShimmerLoading();
        } else {
          return Column(
            children: [
              SizedBox(
                height: 40.h,
                child: Row(
                  children: [
                    const SectionWidget(
                      sectionTitle: StringsManager.categorySectionTitle,
                    ),
                    const Spacer(flex: 1),
                    ValueListenableBuilder(
                      valueListenable: isApplyButtonActiveNotifier,
                      builder: (context, isApplyButtonActive, child) =>
                          CategoriesButton(
                        isActive: isApplyButtonActive,
                        onTap: () {
                          isApplyButtonActiveNotifier.value = false;
                          final categories = selectedCategories.join(',');
                          context.read<HomeBloc>()
                            ..add(GetProductOffersEvent(categories: categories))
                            ..add(
                                GetBrandsProductsEvent(categories: categories));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 84.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _categoriesController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16).r,
                    child: Row(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: animatedGendersWidth,
                          builder: (context, value, child) => GendersCategories(
                            width: value.w,
                            selectedGenders: (genderId) {
                              context
                                  .read<HomeBloc>()
                                  .add(GetCategoriesEvent(genderId: genderId));
                            },
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Container(
                          height: 84.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ).r,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 6.w,
                                height: 42.h,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ).r,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              BlocBuilder<HomeBloc, HomeState>(
                                buildWhen: (previous, current) =>
                                    previous.categories != current.categories,
                                builder: (context, state) {
                                  return ListView.builder(
                                    itemCount: state.categories.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 10.0).r,
                                        child: TitledAvatar(
                                          onTap: () {
                                            _handelCategories(
                                              categoryId:
                                                  state.categories[index].id,
                                            );
                                          },
                                          imagePath:
                                              state.categories[index].imageUrl,
                                          title: state.categories[index].name,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _categoriesController
      ..dispose()
      ..removeListener(_onSwipeListener);
    animatedGendersWidth.dispose();
    isApplyButtonActiveNotifier.dispose();
    super.dispose();
  }
}
