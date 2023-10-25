import 'package:efashion_flutter/components/notificationsComponent/data/models/notification_model.dart';
import 'package:efashion_flutter/shared/api/api_consumer.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/shared/error/exception.dart';
import 'package:injectable/injectable.dart';

abstract class NotificationsDataSource {
  Future<List<NotificationModel>> getNotificationsList(
      {required String userAccessToken});

  Future<void> subscripeToNotifications(
      {required String userAccessToken, required String deviceToken});

  Future<void> unSubscripeFromNotifications(
      {required String userAccessToken, required String deviceToken});
}

@LazySingleton(as: NotificationsDataSource)
class NotificationsDataSourceImpl extends NotificationsDataSource {
  final ApiConsumer _apiConsumer;

  NotificationsDataSourceImpl(@Named(ApiConstants.mainConsumerName) this._apiConsumer);

  @override
  Future<List<NotificationModel>> getNotificationsList(
      {required String userAccessToken}) async {
    final response =
        await _apiConsumer.get(ApiConstants.getNotificationsList, headers: {
      'Authorization': 'Bearer $userAccessToken',
    });
    if (response['status'] == ApiCallStatus.success.value) {
      return List<NotificationModel>.from((response['data'] as List)
          .map((notification) => NotificationModel.fromJson(notification)));
    } else {
      throw const FetchDataException();
    }
  }

  @override
  Future<void> subscripeToNotifications({
    required String userAccessToken,
    required String deviceToken,
  }) async {
    final response = await _apiConsumer
        .post(ApiConstants.subscribeToNotifications, headers: {
      'Authorization': 'Bearer $userAccessToken',
    }, body: {
      'device': deviceToken,
    });
    if (response['status'] == ApiCallStatus.error.value) {
      throw const FetchDataException();
    }
  }

  @override
  Future<void> unSubscripeFromNotifications({
    required String userAccessToken,
    required String deviceToken,
  }) async {
    final response = await _apiConsumer
        .delete(ApiConstants.unsubscribeFromNotifications, headers: {
      'Authorization': 'Bearer $userAccessToken',
    }, body: {
      'device': deviceToken,
    });
    if (response['status'] == ApiCallStatus.error.value) {
      throw const FetchDataException();
    }
  }
}
