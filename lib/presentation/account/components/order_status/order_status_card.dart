import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({
    super.key,
    required this.orderId,
    required this.orderCost,
    required this.orderStatus,
  });

  final String orderId;
  final int orderCost;
  final int orderStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0).r,
      child: Container(
        width: 320.w,
        height: 120.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                _buildOrderImage(),
                width: 90.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'OrderId : #${orderId.length > 10 ? '${orderId.substring(0, 10)}..' : orderId}',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await Clipboard.setData(ClipboardData(text: orderId));
                          },
                          icon: Icon(
                            Iconsax.copy,
                            color: Theme.of(context).colorScheme.primary,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Order Price : \$$orderCost',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      _orderStatusText(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: _orderStatusColor(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _orderStatusText(){
    if(orderStatus == 1){
      return 'In Progress';
    }else if (orderStatus == 2){
      return  "On It's way";
    }else{
      return  'Delivered';
    }
  }

  Color _orderStatusColor(BuildContext context){
    if(orderStatus == 1){
      return Theme.of(context).colorScheme.error;
    }else if (orderStatus == 2){
      return Theme.of(context).colorScheme.primary;
    }else{
      return  ColorsManager.successColor;
    }
  }
  String _buildOrderImage() {
    if (orderStatus == 1) {
      return AssetsManager.deliveryImage1;
    } else if (orderStatus == 2) {
      return AssetsManager.deliveryImage2;
    } else {
      return AssetsManager.deliveryImage3;
    }
  }
}
