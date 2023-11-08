// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i24;
import 'package:efashion_flutter/components/authComponent/data/datasources/local/auth_local_data_source.dart'
    as _i5;
import 'package:efashion_flutter/components/authComponent/data/datasources/remote/auth_data_source.dart'
    as _i6;
import 'package:efashion_flutter/components/authComponent/data/repositories/auth_repository_impl.dart'
    as _i8;
import 'package:efashion_flutter/components/authComponent/domain/repositories/auth_repository.dart'
    as _i7;
import 'package:efashion_flutter/components/authComponent/domain/usecases/change_password_usecase.dart'
    as _i12;
import 'package:efashion_flutter/components/authComponent/domain/usecases/check_if_tokens_exist_use_case.dart'
    as _i16;
import 'package:efashion_flutter/components/authComponent/domain/usecases/delete_tokens_use_case.dart'
    as _i23;
import 'package:efashion_flutter/components/authComponent/domain/usecases/forget_password_usecase.dart'
    as _i27;
import 'package:efashion_flutter/components/authComponent/domain/usecases/get_user_access_token_usecase.dart'
    as _i34;
import 'package:efashion_flutter/components/authComponent/domain/usecases/reset_password_usecase.dart'
    as _i48;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_login_usecase.dart'
    as _i56;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_signup_usecase.dart'
    as _i60;
import 'package:efashion_flutter/components/authComponent/domain/usecases/verify_otp_usecase.dart'
    as _i61;
import 'package:efashion_flutter/components/cartComponent/data/datasources/cart_datasource.dart'
    as _i9;
import 'package:efashion_flutter/components/cartComponent/data/repositories/cart_repository_impl.dart'
    as _i11;
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart'
    as _i10;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/add_product_to_cart_usecase.dart'
    as _i63;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/create_payment_intent_usecase.dart'
    as _i22;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/edit_product_quantity_usecase.dart'
    as _i26;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_cart_products_usecase.dart'
    as _i28;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_orders_list_usecase.dart'
    as _i33;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/remove_product_from_cart_usecase.dart'
    as _i46;
import 'package:efashion_flutter/components/chatSupportComponent/data/datasources/chat_remote_datasource.dart'
    as _i13;
import 'package:efashion_flutter/components/chatSupportComponent/data/repositories/chat_support_repository_impl.dart'
    as _i15;
import 'package:efashion_flutter/components/chatSupportComponent/domain/repositories/chat_support_repository.dart'
    as _i14;
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/close_socket_connection.dart'
    as _i17;
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/create_or_join_existing_chat_usecase.dart'
    as _i21;
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/get_chat_messages_usecase.dart'
    as _i29;
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/get_chat_stream_usecase.dart'
    as _i30;
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/send_message_usecase.dart'
    as _i50;
import 'package:efashion_flutter/components/collectionComponent/data/datasources/collection_remote_datasource.dart'
    as _i18;
import 'package:efashion_flutter/components/collectionComponent/data/repositories/collection_repository_impl.dart'
    as _i20;
import 'package:efashion_flutter/components/collectionComponent/domain/repositories/collection_repository.dart'
    as _i19;
import 'package:efashion_flutter/components/collectionComponent/domain/usecases/get_collection_items_list_usecase.dart'
    as _i31;
import 'package:efashion_flutter/components/collectionComponent/domain/usecases/get_collections_list_usecase.dart'
    as _i32;
import 'package:efashion_flutter/components/mapComponent/data/datasources/map_datasource.dart'
    as _i35;
import 'package:efashion_flutter/components/mapComponent/data/repositories/map_repository_impl.dart'
    as _i37;
import 'package:efashion_flutter/components/mapComponent/domain/repositories/map_repository.dart'
    as _i36;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_place_latitude_and_longitude_usecase.dart'
    as _i79;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_places_suggestions_usecase.dart'
    as _i80;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_user_location_usecase.dart'
    as _i86;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/update_user_location_usecase.dart'
    as _i54;
import 'package:efashion_flutter/components/notificationsComponent/data/datasources/notifications_datasource.dart'
    as _i38;
import 'package:efashion_flutter/components/notificationsComponent/data/repositories/notifications_repository_impl.dart'
    as _i40;
import 'package:efashion_flutter/components/notificationsComponent/domain/repositories/notifications_repository.dart'
    as _i39;
import 'package:efashion_flutter/components/notificationsComponent/domain/usecases/get_notifications_list_usecase.dart'
    as _i78;
import 'package:efashion_flutter/components/notificationsComponent/domain/usecases/subscribe_to_notifications_usecase.dart'
    as _i51;
import 'package:efashion_flutter/components/notificationsComponent/domain/usecases/unsubscribe_from_notifications_usecase.dart'
    as _i53;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source.dart'
    as _i42;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source_impl.dart'
    as _i43;
import 'package:efashion_flutter/components/productComponent/data/repositories/product_repository_impl.dart'
    as _i45;
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart'
    as _i44;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/add_product_to_favorite_list_usecase.dart'
    as _i64;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_favorite_products_usecase.dart'
    as _i77;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_user_favorite_products_ids.dart'
    as _i85;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/remove_product_from_favorite_list_usecase.dart'
    as _i47;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/add_or_edit_product_review_usecase.dart'
    as _i62;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_all_brands_products_usecase.dart'
    as _i72;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brand_products_usecase.dart'
    as _i74;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brands_usecase.dart'
    as _i75;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_categories_usecase.dart'
    as _i76;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_details_usecase.dart'
    as _i81;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_reviews_and_ratings_usecase.dart'
    as _i82;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_products_offers_usecase.dart'
    as _i83;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_user_review_usecase.dart'
    as _i87;
import 'package:efashion_flutter/components/productComponent/domain/usecases/search/search_for_product_usecase.dart'
    as _i49;
import 'package:efashion_flutter/components/userComponent/data/datasources/local/user_local_data_source.dart'
    as _i55;
import 'package:efashion_flutter/components/userComponent/data/datasources/remote/user_remote_data_source.dart'
    as _i57;
import 'package:efashion_flutter/components/userComponent/data/repositories/user_repository_impl.dart'
    as _i59;
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart'
    as _i58;
import 'package:efashion_flutter/components/userComponent/domain/usecases/change_app_theme_usecase.dart'
    as _i67;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_app_theme_usecase.dart'
    as _i73;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_user_data_usecase.dart'
    as _i84;
import 'package:efashion_flutter/components/userComponent/domain/usecases/update_profile_picture_usecase.dart'
    as _i95;
import 'package:efashion_flutter/components/userComponent/domain/usecases/update_user_data_usecase.dart'
    as _i96;
import 'package:efashion_flutter/presentation/account/bloc/change_password_cubit/change_password_cubit.dart'
    as _i68;
import 'package:efashion_flutter/presentation/account/bloc/chat_support_cubit/chat_support_cubit.dart'
    as _i69;
import 'package:efashion_flutter/presentation/account/bloc/maps_bloc/map_bloc.dart'
    as _i89;
import 'package:efashion_flutter/presentation/account/bloc/orders_cubit/orders_cubit.dart'
    as _i41;
import 'package:efashion_flutter/presentation/account/bloc/profile_cubit/profile_cubit.dart'
    as _i101;
import 'package:efashion_flutter/presentation/auth/cubits/forget_password/forget_password_cubit.dart'
    as _i71;
import 'package:efashion_flutter/presentation/auth/cubits/login/login_cubit.dart'
    as _i100;
import 'package:efashion_flutter/presentation/auth/cubits/signup/signup_cubit.dart'
    as _i92;
import 'package:efashion_flutter/presentation/product/bloc/collections_cubit/collections_cubit.dart'
    as _i70;
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart'
    as _i97;
import 'package:efashion_flutter/presentation/product/bloc/discover_cubit/discover_bloc.dart'
    as _i98;
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart'
    as _i88;
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart'
    as _i91;
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart'
    as _i66;
import 'package:efashion_flutter/presentation/shared/bloc/favorite_cubit/favorite_cubit.dart'
    as _i99;
import 'package:efashion_flutter/presentation/shared/bloc/notifications_cubit/notifications_cubit.dart'
    as _i90;
import 'package:efashion_flutter/presentation/shared/bloc/theme_cubit/theme_cubit.dart'
    as _i93;
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart'
    as _i94;
import 'package:efashion_flutter/register_module.dart' as _i102;
import 'package:efashion_flutter/shared/api/api_consumer.dart' as _i3;
import 'package:efashion_flutter/shared/api/authenticated_interceptor.dart'
    as _i65;
import 'package:efashion_flutter/shared/api/dio_logger.dart' as _i25;
import 'package:efashion_flutter/shared/api/unauthenticated_interceptor.dart'
    as _i52;
import 'package:efashion_flutter/shared/router/app_router.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.ApiConsumer>(
      () => registerModule.mapsApiConsumer,
      instanceName: 'mapsApiConsumer',
    );
    gh.lazySingleton<_i3.ApiConsumer>(
      () => registerModule.authenticatedApiConsumer,
      instanceName: 'authenticatedConsumer',
    );
    gh.lazySingleton<_i3.ApiConsumer>(
      () => registerModule.mainApiConsumer,
      instanceName: 'unAuthenticatedConsumer',
    );
    gh.singleton<_i4.AppRouter>(_i4.AppRouter());
    gh.lazySingleton<_i5.AuthLocalDataSource>(
        () => _i5.AuthLocalDataSourceImpl());
    gh.lazySingleton<_i6.AuthRemoteDataSource>(() => _i6.AuthDataSourceImpl(
        gh<_i3.ApiConsumer>(instanceName: 'unAuthenticatedConsumer')));
    gh.lazySingleton<_i7.AuthRepository>(() => _i8.AuthRepositoryImpl(
          gh<_i6.AuthRemoteDataSource>(),
          gh<_i5.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i9.CartDataSource>(() => _i9.CartDataSourceImpl(
        gh<_i3.ApiConsumer>(instanceName: 'authenticatedConsumer')));
    gh.lazySingleton<_i10.CartRepository>(
        () => _i11.CartRepositoryImpl(gh<_i9.CartDataSource>()));
    gh.lazySingleton<_i12.ChangePasswordUseCase>(
        () => _i12.ChangePasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i13.ChatRemoteDataSource>(() =>
        _i13.ChatRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'authenticatedConsumer')));
    gh.lazySingleton<_i14.ChatSupportRepository>(
        () => _i15.ChatSupportRepositoryImpl(gh<_i13.ChatRemoteDataSource>()));
    gh.lazySingleton<_i16.CheckIfTokensExistUseCase>(
        () => _i16.CheckIfTokensExistUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i17.CloseSocketConnectionUseCase>(() =>
        _i17.CloseSocketConnectionUseCase(gh<_i14.ChatSupportRepository>()));
    gh.lazySingleton<_i18.CollectionRemoteDataSource>(() =>
        _i18.CollectionRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'unAuthenticatedConsumer')));
    gh.lazySingleton<_i19.CollectionRepository>(() =>
        _i20.CollectionRepositoryImpl(gh<_i18.CollectionRemoteDataSource>()));
    gh.lazySingleton<_i21.CreateOrJoinChatUseCase>(
        () => _i21.CreateOrJoinChatUseCase(gh<_i14.ChatSupportRepository>()));
    gh.lazySingleton<_i22.CreatePaymentIntentUseCase>(
        () => _i22.CreatePaymentIntentUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i23.DeleteTokensUseCase>(
        () => _i23.DeleteTokensUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i24.Dio>(() => registerModule.dioClient);
    gh.lazySingleton<_i25.DioLogInterceptor>(() => _i25.DioLogInterceptor());
    gh.lazySingleton<_i26.EditProductQuantityUseCase>(
        () => _i26.EditProductQuantityUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i27.ForgetPasswordUseCase>(
        () => _i27.ForgetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i28.GetCartProductsUseCase>(
        () => _i28.GetCartProductsUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i29.GetChatMessagesUseCase>(
        () => _i29.GetChatMessagesUseCase(gh<_i14.ChatSupportRepository>()));
    gh.lazySingleton<_i30.GetChatStreamUseCase>(
        () => _i30.GetChatStreamUseCase(gh<_i14.ChatSupportRepository>()));
    gh.lazySingleton<_i31.GetCollectionItemsListUseCase>(() =>
        _i31.GetCollectionItemsListUseCase(gh<_i19.CollectionRepository>()));
    gh.lazySingleton<_i32.GetCollectionsListUseCase>(
        () => _i32.GetCollectionsListUseCase(gh<_i19.CollectionRepository>()));
    gh.lazySingleton<_i33.GetOrdersListUseCase>(
        () => _i33.GetOrdersListUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i34.GetUserAccessTokenUseCase>(
        () => _i34.GetUserAccessTokenUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i35.MapDataSource>(() => _i35.MapDataSourceImpl(
          gh<_i3.ApiConsumer>(instanceName: 'authenticatedConsumer'),
          gh<_i3.ApiConsumer>(instanceName: 'mapsApiConsumer'),
        ));
    gh.lazySingleton<_i36.MapRepository>(
        () => _i37.MapRepositoryImpl(gh<_i35.MapDataSource>()));
    gh.lazySingleton<_i38.NotificationsDataSource>(() =>
        _i38.NotificationsDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'authenticatedConsumer')));
    gh.lazySingleton<_i39.NotificationsRepository>(() =>
        _i40.NotificationsRepositoryImpl(gh<_i38.NotificationsDataSource>()));
    gh.factory<_i41.OrdersCubit>(
        () => _i41.OrdersCubit(gh<_i33.GetOrdersListUseCase>()));
    gh.lazySingleton<_i42.ProductRemoteDataSource>(() =>
        _i43.ProductRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'authenticatedConsumer')));
    gh.lazySingleton<_i44.ProductRepository>(
        () => _i45.ProductRepositoryImpl(gh<_i42.ProductRemoteDataSource>()));
    gh.lazySingleton<_i46.RemoveProductFromCartUseCase>(
        () => _i46.RemoveProductFromCartUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i47.RemoveProductFromFavoriteListUseCase>(() =>
        _i47.RemoveProductFromFavoriteListUseCase(
            gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i48.ResetPasswordUseCase>(
        () => _i48.ResetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i49.SearchForProductsUseCase>(
        () => _i49.SearchForProductsUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i50.SendMessageUseCase>(
        () => _i50.SendMessageUseCase(gh<_i14.ChatSupportRepository>()));
    gh.lazySingleton<_i51.SubscribeToNotificationsUseCase>(() =>
        _i51.SubscribeToNotificationsUseCase(
            gh<_i39.NotificationsRepository>()));
    gh.lazySingleton<_i52.UnAuthenticatedInterceptor>(
        () => _i52.UnAuthenticatedInterceptor());
    gh.lazySingleton<_i53.UnSubscribeFromNotificationsUseCase>(() =>
        _i53.UnSubscribeFromNotificationsUseCase(
            gh<_i39.NotificationsRepository>()));
    gh.lazySingleton<_i54.UpdateUserLocationUseCase>(
        () => _i54.UpdateUserLocationUseCase(gh<_i36.MapRepository>()));
    gh.lazySingleton<_i55.UserLocalDataSource>(
        () => _i55.UserLocalDataSourceImpl());
    gh.lazySingleton<_i56.UserLoginUseCase>(
        () => _i56.UserLoginUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i57.UserRemoteDataSource>(() =>
        _i57.UserRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'authenticatedConsumer')));
    gh.lazySingleton<_i58.UserRepository>(() => _i59.UserRepositoryImpl(
          gh<_i55.UserLocalDataSource>(),
          gh<_i57.UserRemoteDataSource>(),
        ));
    gh.lazySingleton<_i60.UserSignUpUseCase>(
        () => _i60.UserSignUpUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i61.VerifyOtpUseCase>(
        () => _i61.VerifyOtpUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i62.AddOrEditProductReviewUseCase>(
        () => _i62.AddOrEditProductReviewUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i63.AddProductToCartUseCase>(
        () => _i63.AddProductToCartUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i64.AddProductToFavoriteListUseCase>(() =>
        _i64.AddProductToFavoriteListUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i65.AuthenticatedInterceptor>(() =>
        _i65.AuthenticatedInterceptor(gh<_i34.GetUserAccessTokenUseCase>()));
    gh.factory<_i66.CartCubit>(() => _i66.CartCubit(
          gh<_i63.AddProductToCartUseCase>(),
          gh<_i46.RemoveProductFromCartUseCase>(),
          gh<_i28.GetCartProductsUseCase>(),
          gh<_i26.EditProductQuantityUseCase>(),
          gh<_i22.CreatePaymentIntentUseCase>(),
        ));
    gh.lazySingleton<_i67.ChangeAppThemeUseCase>(() =>
        _i67.ChangeAppThemeUseCase(themeRepository: gh<_i58.UserRepository>()));
    gh.factory<_i68.ChangePasswordCubit>(() => _i68.ChangePasswordCubit(
          gh<_i34.GetUserAccessTokenUseCase>(),
          gh<_i12.ChangePasswordUseCase>(),
        ));
    gh.factory<_i69.ChatSupportCubit>(() => _i69.ChatSupportCubit(
          gh<_i34.GetUserAccessTokenUseCase>(),
          gh<_i21.CreateOrJoinChatUseCase>(),
          gh<_i29.GetChatMessagesUseCase>(),
          gh<_i50.SendMessageUseCase>(),
          gh<_i30.GetChatStreamUseCase>(),
          gh<_i17.CloseSocketConnectionUseCase>(),
        ));
    gh.factory<_i70.CollectionsCubit>(() => _i70.CollectionsCubit(
          gh<_i32.GetCollectionsListUseCase>(),
          gh<_i31.GetCollectionItemsListUseCase>(),
          gh<_i22.CreatePaymentIntentUseCase>(),
        ));
    gh.factory<_i71.ForgetPasswordCubit>(() => _i71.ForgetPasswordCubit(
          gh<_i27.ForgetPasswordUseCase>(),
          gh<_i61.VerifyOtpUseCase>(),
          gh<_i48.ResetPasswordUseCase>(),
        ));
    gh.lazySingleton<_i72.GetAllBrandsProductsUseCase>(
        () => _i72.GetAllBrandsProductsUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i73.GetAppThemeUseCase>(() =>
        _i73.GetAppThemeUseCase(themeRepository: gh<_i58.UserRepository>()));
    gh.lazySingleton<_i74.GetBrandProductsUseCase>(
        () => _i74.GetBrandProductsUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i75.GetBrandsUseCase>(
        () => _i75.GetBrandsUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i76.GetCategoriesUseCase>(
        () => _i76.GetCategoriesUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i77.GetFavoriteProductsUseCase>(
        () => _i77.GetFavoriteProductsUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i78.GetNotificationsListUseCase>(() =>
        _i78.GetNotificationsListUseCase(gh<_i39.NotificationsRepository>()));
    gh.lazySingleton<_i79.GetPlaceLatitudeAndLongitudeUseCase>(() =>
        _i79.GetPlaceLatitudeAndLongitudeUseCase(gh<_i36.MapRepository>()));
    gh.lazySingleton<_i80.GetPlacesSuggestionsUseCase>(
        () => _i80.GetPlacesSuggestionsUseCase(gh<_i36.MapRepository>()));
    gh.lazySingleton<_i81.GetProductDetailsUseCase>(
        () => _i81.GetProductDetailsUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i82.GetProductReviewsAndRatingsUseCase>(() =>
        _i82.GetProductReviewsAndRatingsUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i83.GetProductsOffersUseCase>(
        () => _i83.GetProductsOffersUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i84.GetUserDataUseCase>(
        () => _i84.GetUserDataUseCase(gh<_i58.UserRepository>()));
    gh.lazySingleton<_i85.GetUserFavoriteProductsIdsUseCase>(() =>
        _i85.GetUserFavoriteProductsIdsUseCase(gh<_i44.ProductRepository>()));
    gh.lazySingleton<_i86.GetUserLocationUseCase>(
        () => _i86.GetUserLocationUseCase(gh<_i36.MapRepository>()));
    gh.lazySingleton<_i87.GetUserProductReviewUseCase>(
        () => _i87.GetUserProductReviewUseCase(gh<_i44.ProductRepository>()));
    gh.factory<_i88.HomeBloc>(() => _i88.HomeBloc(
          gh<_i76.GetCategoriesUseCase>(),
          gh<_i83.GetProductsOffersUseCase>(),
          gh<_i75.GetBrandsUseCase>(),
          gh<_i72.GetAllBrandsProductsUseCase>(),
        ));
    gh.factory<_i89.MapBloc>(() => _i89.MapBloc(
          gh<_i80.GetPlacesSuggestionsUseCase>(),
          gh<_i86.GetUserLocationUseCase>(),
          gh<_i54.UpdateUserLocationUseCase>(),
          gh<_i79.GetPlaceLatitudeAndLongitudeUseCase>(),
        ));
    gh.singleton<_i90.NotificationsCubit>(_i90.NotificationsCubit(
      gh<_i78.GetNotificationsListUseCase>(),
      gh<_i51.SubscribeToNotificationsUseCase>(),
      gh<_i53.UnSubscribeFromNotificationsUseCase>(),
      gh<_i16.CheckIfTokensExistUseCase>(),
    ));
    gh.factory<_i91.SearchBloc>(
        () => _i91.SearchBloc(gh<_i49.SearchForProductsUseCase>()));
    gh.factory<_i92.SignupCubit>(() => _i92.SignupCubit(
          gh<_i60.UserSignUpUseCase>(),
          gh<_i90.NotificationsCubit>(),
        ));
    gh.factory<_i93.ThemeCubit>(() => _i93.ThemeCubit(
          gh<_i73.GetAppThemeUseCase>(),
          gh<_i67.ChangeAppThemeUseCase>(),
        ));
    gh.factory<_i94.TokensCubit>(() => _i94.TokensCubit(
          gh<_i16.CheckIfTokensExistUseCase>(),
          gh<_i23.DeleteTokensUseCase>(),
          gh<_i90.NotificationsCubit>(),
        ));
    gh.lazySingleton<_i95.UpdateProfilePictureUseCase>(
        () => _i95.UpdateProfilePictureUseCase(gh<_i58.UserRepository>()));
    gh.lazySingleton<_i96.UpdateUserDataUseCase>(
        () => _i96.UpdateUserDataUseCase(gh<_i58.UserRepository>()));
    gh.factory<_i97.DetailsCubit>(() => _i97.DetailsCubit(
          gh<_i81.GetProductDetailsUseCase>(),
          gh<_i82.GetProductReviewsAndRatingsUseCase>(),
          gh<_i62.AddOrEditProductReviewUseCase>(),
          gh<_i87.GetUserProductReviewUseCase>(),
        ));
    gh.factory<_i98.DiscoverBloc>(() => _i98.DiscoverBloc(
          gh<_i74.GetBrandProductsUseCase>(),
          gh<_i83.GetProductsOffersUseCase>(),
        ));
    gh.factory<_i99.FavoriteCubit>(() => _i99.FavoriteCubit(
          gh<_i85.GetUserFavoriteProductsIdsUseCase>(),
          gh<_i64.AddProductToFavoriteListUseCase>(),
          gh<_i47.RemoveProductFromFavoriteListUseCase>(),
          gh<_i81.GetProductDetailsUseCase>(),
          gh<_i77.GetFavoriteProductsUseCase>(),
        ));
    gh.factory<_i100.LoginCubit>(() => _i100.LoginCubit(
          gh<_i56.UserLoginUseCase>(),
          gh<_i90.NotificationsCubit>(),
        ));
    gh.factory<_i101.ProfileCubit>(() => _i101.ProfileCubit(
          gh<_i84.GetUserDataUseCase>(),
          gh<_i95.UpdateProfilePictureUseCase>(),
          gh<_i96.UpdateUserDataUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i102.RegisterModule {}
