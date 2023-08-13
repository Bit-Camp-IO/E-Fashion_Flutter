import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:efashion_flutter/features/home/presentation/components/section_widget.dart';
import 'package:efashion_flutter/features/home/presentation/components/titled_avatar.dart';
import 'package:efashion_flutter/features/home/presentation/mock/filter_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({super.key});

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  late final ScrollController _filterController;
  double animatedFilterWidth = 145;
  bool isFilterOn = false;
  List selectedFilters = [];
  List selectedGenders = [];

  @override
  void initState() {
    _filterController = ScrollController()..addListener(_onSwipeListener);
    super.initState();
  }

  void _onSwipeListener() {
    final maxScroll = _filterController.position.maxScrollExtent;
    final currentScroll = _filterController.offset;
    final scrollDirection = _filterController.position.userScrollDirection;
    if (_filterController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (animatedFilterWidth != 0) {
        setState(() {
          animatedFilterWidth = 0;
        });
      }
    }
    if (scrollDirection == ScrollDirection.forward &&
        currentScroll < maxScroll * 0.05) {
      if (animatedFilterWidth != 145) {
        setState(() {
          animatedFilterWidth = 145;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
          child: Row(
            children: [
              const SectionWidget(
                sectionTitle: 'Filters',
              ),
              const Spacer(flex: 1),
              AnimatedOpacity(
                opacity:  selectedGenders.isNotEmpty || selectedFilters.isNotEmpty ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 80.w,
                      height: 40.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFF526070),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Iconsax.filter, color: Colors.white, size: 16),
                          Text(
                            'Apply',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.white),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 84.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: _filterController,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                      width: animatedFilterWidth.w,
                      height: 84.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE8E8EB),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 145.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              genders.length,
                              (genderIndex) => TitledAvatar(
                                onTap: () {
                                  setState(() {
                                    if (selectedGenders
                                        .contains(genders[genderIndex].name)) {
                                      selectedGenders.removeWhere((element) =>
                                          element == genders[genderIndex].name);
                                    } else {
                                      selectedGenders.add(genders[genderIndex].name);
                                    }
                                  });
                                },
                                imagePath: genders[genderIndex].picture,
                                title: genders[genderIndex].name,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Container(
                      width: 430.w,
                      height: 84.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE8E8EB),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 6.w,
                            height: 42.h,
                            decoration: const BoxDecoration(
                              color: ColorsManager.lightPrimaryColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 420.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                filters.length,
                                (filterIndex) => TitledAvatar(
                                  onTap: () {
                                    setState(() {
                                      if (selectedFilters.contains(filters[filterIndex].filterName)) {
                                        selectedFilters.removeWhere((element) =>
                                            element == filters[filterIndex].filterName);
                                      } else {
                                        selectedFilters
                                            .add(filters[filterIndex].filterName);
                                      }
                                    });
                                  },
                                  imagePath: filters[filterIndex].filterImageUrl,
                                  title: filters[filterIndex].filterName,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _filterController
      ..dispose()
      ..removeListener(_onSwipeListener);
    super.dispose();
  }
}
