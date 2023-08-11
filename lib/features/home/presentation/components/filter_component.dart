import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:efashion_flutter/features/home/presentation/components/titled_avatar.dart';
import 'package:efashion_flutter/features/home/presentation/mock/filter_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({super.key});

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  late final ScrollController _filterController;
  double animatedFilterWidth = 145;
  bool isFilterOn = false;

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
    return  Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: 84.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          controller: _filterController,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0).r,
              child: Row(
                children: [
                  Visibility(
                    visible: false,
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF526070),
                      ),
                      child: Center(
                        child: Text(
                          'Go',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
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
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            genders.length,
                                (index) => TitledAvatar(
                              onTap: () {},
                              imagePath: genders[index].picture,
                              title: genders[index].name,
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
                              )),
                        ),
                        SizedBox(
                          width: 420.w,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              filters.length,
                                  (index) => TitledAvatar(
                                onTap: () {},
                                imagePath: filters[index].filterImageUrl,
                                title: filters[index].filterName,
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
