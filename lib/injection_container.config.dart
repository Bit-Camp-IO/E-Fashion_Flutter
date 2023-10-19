// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
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
    as _i33;
import 'package:efashion_flutter/components/authComponent/domain/usecases/reset_password_usecase.dart'
    as _i44;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_login_usecase.dart'
    as _i50;
import 'package:efashion_flutter/components/authComponent/domain/usecases/user_signup_usecase.dart'
    as _i54;
import 'package:efashion_flutter/components/authComponent/domain/usecases/verify_otp_usecase.dart'
    as _i55;
import 'package:efashion_flutter/components/cartComponent/data/datasources/cart_datasource.dart'
    as _i9;
import 'package:efashion_flutter/components/cartComponent/data/repositories/cart_repository_impl.dart'
    as _i11;
import 'package:efashion_flutter/components/cartComponent/domain/repositories/cart_repository.dart'
    as _i10;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/add_product_to_cart_usecase.dart'
    as _i57;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/create_payment_intent_usecase.dart'
    as _i22;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/edit_product_quantity_usecase.dart'
    as _i26;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_cart_products_usecase.dart'
    as _i28;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/get_orders_list_usecase.dart'
    as _i32;
import 'package:efashion_flutter/components/cartComponent/domain/usecases/remove_product_from_cart_usecase.dart'
    as _i42;
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
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/get_chat_stream_usecase.dart'
    as _i29;
import 'package:efashion_flutter/components/chatSupportComponent/domain/usecases/send_message_usecase.dart'
    as _i46;
import 'package:efashion_flutter/components/collectionComponent/data/datasources/collection_remote_datasource.dart'
    as _i18;
import 'package:efashion_flutter/components/collectionComponent/data/repositories/collection_repository_impl.dart'
    as _i20;
import 'package:efashion_flutter/components/collectionComponent/domain/repositories/collection_repository.dart'
    as _i19;
import 'package:efashion_flutter/components/collectionComponent/domain/usecases/get_collection_items_list_usecase.dart'
    as _i30;
import 'package:efashion_flutter/components/collectionComponent/domain/usecases/get_collections_list_usecase.dart'
    as _i31;
import 'package:efashion_flutter/components/mapComponent/data/datasources/map_datasource.dart'
    as _i34;
import 'package:efashion_flutter/components/mapComponent/data/repositories/map_repository_impl.dart'
    as _i36;
import 'package:efashion_flutter/components/mapComponent/domain/repositories/map_repository.dart'
    as _i35;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_place_latitude_and_longitude_usecase.dart'
    as _i71;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_places_suggestions_usecase.dart'
    as _i72;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/get_user_location_usecase.dart'
    as _i78;
import 'package:efashion_flutter/components/mapComponent/domain/usecases/update_user_location_usecase.dart'
    as _i48;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source.dart'
    as _i38;
import 'package:efashion_flutter/components/productComponent/data/datasources/product_remote_data_source_impl.dart'
    as _i39;
import 'package:efashion_flutter/components/productComponent/data/repositories/product_repository_impl.dart'
    as _i41;
import 'package:efashion_flutter/components/productComponent/domain/repositories/product_repository.dart'
    as _i40;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/add_product_to_favorite_list_usecase.dart'
    as _i58;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_favorite_products_usecase.dart'
    as _i70;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/get_user_favorite_products_ids.dart'
    as _i77;
import 'package:efashion_flutter/components/productComponent/domain/usecases/favorite/remove_product_from_favorite_list_usecase.dart'
    as _i43;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/add_or_edit_product_review_usecase.dart'
    as _i56;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_all_brands_products_usecase.dart'
    as _i65;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brand_products_usecase.dart'
    as _i67;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_brands_usecase.dart'
    as _i68;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_categories_usecase.dart'
    as _i69;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_details_usecase.dart'
    as _i73;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_product_reviews_and_ratings_usecase.dart'
    as _i74;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_products_offers_usecase.dart'
    as _i75;
import 'package:efashion_flutter/components/productComponent/domain/usecases/home/get_user_review_usecase.dart'
    as _i79;
import 'package:efashion_flutter/components/productComponent/domain/usecases/search/search_for_product_usecase.dart'
    as _i45;
import 'package:efashion_flutter/components/userComponent/data/datasources/local/user_local_data_source.dart'
    as _i49;
import 'package:efashion_flutter/components/userComponent/data/datasources/remote/user_remote_data_source.dart'
    as _i51;
import 'package:efashion_flutter/components/userComponent/data/repositories/user_repository_impl.dart'
    as _i53;
import 'package:efashion_flutter/components/userComponent/domain/repositories/user_repository.dart'
    as _i52;
import 'package:efashion_flutter/components/userComponent/domain/usecases/change_app_theme_usecase.dart'
    as _i60;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_app_theme_usecase.dart'
    as _i66;
import 'package:efashion_flutter/components/userComponent/domain/usecases/get_user_data_usecase.dart'
    as _i76;
import 'package:efashion_flutter/components/userComponent/domain/usecases/update_profile_picture_usecase.dart'
    as _i86;
import 'package:efashion_flutter/components/userComponent/domain/usecases/update_user_data_usecase.dart'
    as _i87;
import 'package:efashion_flutter/presentation/account/bloc/change_password_cubit/change_password_cubit.dart'
    as _i61;
import 'package:efashion_flutter/presentation/account/bloc/chat_support_bloc/chat_support_bloc.dart'
    as _i62;
import 'package:efashion_flutter/presentation/account/bloc/maps_bloc/map_bloc.dart'
    as _i82;
import 'package:efashion_flutter/presentation/account/bloc/orders_cubit/orders_cubit.dart'
    as _i37;
import 'package:efashion_flutter/presentation/account/bloc/profile_cubit/profile_cubit.dart'
    as _i91;
import 'package:efashion_flutter/presentation/auth/cubits/forget_password/forget_password_cubit.dart'
    as _i64;
import 'package:efashion_flutter/presentation/auth/cubits/login/login_cubit.dart'
    as _i81;
import 'package:efashion_flutter/presentation/auth/cubits/signup/signup_cubit.dart'
    as _i84;
import 'package:efashion_flutter/presentation/product/bloc/collections_cubit/collections_cubit.dart'
    as _i63;
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart'
    as _i88;
import 'package:efashion_flutter/presentation/product/bloc/discover_cubit/discover_bloc.dart'
    as _i89;
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart'
    as _i90;
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart'
    as _i80;
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart'
    as _i83;
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart'
    as _i59;
import 'package:efashion_flutter/presentation/shared/bloc/theme_cubit/theme_cubit.dart'
    as _i85;
import 'package:efashion_flutter/presentation/shared/bloc/tokens_cubit/tokens_cubit.dart'
    as _i47;
import 'package:efashion_flutter/register_module.dart' as _i92;
import 'package:efashion_flutter/shared/api/api_consumer.dart' as _i3;
import 'package:efashion_flutter/shared/api/dio_interceptor.dart' as _i24;
import 'package:efashion_flutter/shared/api/dio_logger.dart' as _i25;
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
      () => registerModule.mainApiConsumer,
      instanceName: 'mainApiConsumer',
    );
    gh.singleton<_i4.AppRouter>(_i4.AppRouter());
    gh.lazySingleton<_i5.AuthLocalDataSource>(
        () => _i5.AuthLocalDataSourceImpl());
    gh.lazySingleton<_i6.AuthRemoteDataSource>(() => _i6.AuthDataSourceImpl(
        gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i7.AuthRepository>(() => _i8.AuthRepositoryImpl(
          gh<_i6.AuthRemoteDataSource>(),
          gh<_i5.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i9.CartDataSource>(() => _i9.CartDataSourceImpl(
        gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i10.CartRepository>(
        () => _i11.CartRepositoryImpl(gh<_i9.CartDataSource>()));
    gh.lazySingleton<_i12.ChangePasswordUseCase>(
        () => _i12.ChangePasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i13.ChatRemoteDataSource>(() =>
        _i13.ChatRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i14.ChatSupportRepository>(
        () => _i15.ChatSupportRepositoryImpl(gh<_i13.ChatRemoteDataSource>()));
    gh.lazySingleton<_i16.CheckIfTokensExistUseCase>(
        () => _i16.CheckIfTokensExistUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i17.CloseSocketConnectionUseCase>(() =>
        _i17.CloseSocketConnectionUseCase(gh<_i14.ChatSupportRepository>()));
    gh.lazySingleton<_i18.CollectionRemoteDataSource>(() =>
        _i18.CollectionRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i19.CollectionRepository>(() =>
        _i20.CollectionRepositoryImpl(gh<_i18.CollectionRemoteDataSource>()));
    gh.lazySingleton<_i21.CreateOrJoinChatUseCase>(
        () => _i21.CreateOrJoinChatUseCase(gh<_i14.ChatSupportRepository>()));
    gh.lazySingleton<_i22.CreatePaymentIntentUseCase>(
        () => _i22.CreatePaymentIntentUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i23.DeleteTokensUseCase>(
        () => _i23.DeleteTokensUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i24.DioInterceptor>(() => _i24.DioInterceptor());
    gh.lazySingleton<_i25.DioLogInterceptor>(() => _i25.DioLogInterceptor());
    gh.lazySingleton<_i26.EditProductQuantityUseCase>(
        () => _i26.EditProductQuantityUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i27.ForgetPasswordUseCase>(
        () => _i27.ForgetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i28.GetCartProductsUseCase>(
        () => _i28.GetCartProductsUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i29.GetChatStreamUseCase>(
        () => _i29.GetChatStreamUseCase(gh<_i14.ChatSupportRepository>()));
    gh.lazySingleton<_i30.GetCollectionItemsListUseCase>(() =>
        _i30.GetCollectionItemsListUseCase(gh<_i19.CollectionRepository>()));
    gh.lazySingleton<_i31.GetCollectionsListUseCase>(
        () => _i31.GetCollectionsListUseCase(gh<_i19.CollectionRepository>()));
    gh.lazySingleton<_i32.GetOrdersListUseCase>(
        () => _i32.GetOrdersListUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i33.GetUserAccessTokenUseCase>(
        () => _i33.GetUserAccessTokenUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i34.MapDataSource>(() => _i34.MapDataSourceImpl(
          gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer'),
          gh<_i3.ApiConsumer>(instanceName: 'mapsApiConsumer'),
        ));
    gh.lazySingleton<_i35.MapRepository>(
        () => _i36.MapRepositoryImpl(gh<_i34.MapDataSource>()));
    gh.factory<_i37.OrdersCubit>(() => _i37.OrdersCubit(
          gh<_i33.GetUserAccessTokenUseCase>(),
          gh<_i32.GetOrdersListUseCase>(),
        ));
    gh.lazySingleton<_i38.ProductRemoteDataSource>(() =>
        _i39.ProductRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i40.ProductRepository>(
        () => _i41.ProductRepositoryImpl(gh<_i38.ProductRemoteDataSource>()));
    gh.lazySingleton<_i42.RemoveProductFromCartUseCase>(
        () => _i42.RemoveProductFromCartUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i43.RemoveProductFromFavoriteListUseCase>(() =>
        _i43.RemoveProductFromFavoriteListUseCase(
            gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i44.ResetPasswordUseCase>(
        () => _i44.ResetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i45.SearchForProductsUseCase>(
        () => _i45.SearchForProductsUseCase(gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i46.SendMessageUseCase>(
        () => _i46.SendMessageUseCase(gh<_i14.ChatSupportRepository>()));
    gh.factory<_i47.TokensCubit>(() => _i47.TokensCubit(
          gh<_i16.CheckIfTokensExistUseCase>(),
          gh<_i23.DeleteTokensUseCase>(),
        ));
    gh.lazySingleton<_i48.UpdateUserLocationUseCase>(
        () => _i48.UpdateUserLocationUseCase(gh<_i35.MapRepository>()));
    gh.lazySingleton<_i49.UserLocalDataSource>(
        () => _i49.UserLocalDataSourceImpl());
    gh.lazySingleton<_i50.UserLoginUseCase>(
        () => _i50.UserLoginUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i51.UserRemoteDataSource>(() =>
        _i51.UserRemoteDataSourceImpl(
            gh<_i3.ApiConsumer>(instanceName: 'mainApiConsumer')));
    gh.lazySingleton<_i52.UserRepository>(() => _i53.UserRepositoryImpl(
          gh<_i49.UserLocalDataSource>(),
          gh<_i51.UserRemoteDataSource>(),
        ));
    gh.lazySingleton<_i54.UserSignUpUseCase>(
        () => _i54.UserSignUpUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i55.VerifyOtpUseCase>(
        () => _i55.VerifyOtpUseCase(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i56.AddOrEditProductReviewUseCase>(
        () => _i56.AddOrEditProductReviewUseCase(gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i57.AddProductToCartUseCase>(
        () => _i57.AddProductToCartUseCase(gh<_i10.CartRepository>()));
    gh.lazySingleton<_i58.AddProductToFavoriteListUseCase>(() =>
        _i58.AddProductToFavoriteListUseCase(gh<_i40.ProductRepository>()));
    gh.factory<_i59.CartCubit>(() => _i59.CartCubit(
          gh<_i57.AddProductToCartUseCase>(),
          gh<_i42.RemoveProductFromCartUseCase>(),
          gh<_i28.GetCartProductsUseCase>(),
          gh<_i26.EditProductQuantityUseCase>(),
          gh<_i33.GetUserAccessTokenUseCase>(),
          gh<_i22.CreatePaymentIntentUseCase>(),
        ));
    gh.lazySingleton<_i60.ChangeAppThemeUseCase>(() =>
        _i60.ChangeAppThemeUseCase(themeRepository: gh<_i52.UserRepository>()));
    gh.factory<_i61.ChangePasswordCubit>(() => _i61.ChangePasswordCubit(
          gh<_i33.GetUserAccessTokenUseCase>(),
          gh<_i12.ChangePasswordUseCase>(),
        ));
    gh.factory<_i62.ChatSupportBloc>(() => _i62.ChatSupportBloc(
          gh<_i33.GetUserAccessTokenUseCase>(),
          gh<_i21.CreateOrJoinChatUseCase>(),
          gh<_i46.SendMessageUseCase>(),
          gh<_i29.GetChatStreamUseCase>(),
          gh<_i17.CloseSocketConnectionUseCase>(),
        ));
    gh.factory<_i63.CollectionsCubit>(() => _i63.CollectionsCubit(
          gh<_i33.GetUserAccessTokenUseCase>(),
          gh<_i31.GetCollectionsListUseCase>(),
          gh<_i30.GetCollectionItemsListUseCase>(),
          gh<_i22.CreatePaymentIntentUseCase>(),
        ));
    gh.factory<_i64.ForgetPasswordCubit>(() => _i64.ForgetPasswordCubit(
          gh<_i27.ForgetPasswordUseCase>(),
          gh<_i55.VerifyOtpUseCase>(),
          gh<_i44.ResetPasswordUseCase>(),
        ));
    gh.lazySingleton<_i65.GetAllBrandsProductsUseCase>(
        () => _i65.GetAllBrandsProductsUseCase(gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i66.GetAppThemeUseCase>(() =>
        _i66.GetAppThemeUseCase(themeRepository: gh<_i52.UserRepository>()));
    gh.lazySingleton<_i67.GetBrandProductsUseCase>(
        () => _i67.GetBrandProductsUseCase(gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i68.GetBrandsUseCase>(
        () => _i68.GetBrandsUseCase(gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i69.GetCategoriesUseCase>(
        () => _i69.GetCategoriesUseCase(gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i70.GetFavoriteProductsUseCase>(
        () => _i70.GetFavoriteProductsUseCase(gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i71.GetPlaceLatitudeAndLongitudeUseCase>(() =>
        _i71.GetPlaceLatitudeAndLongitudeUseCase(gh<_i35.MapRepository>()));
    gh.lazySingleton<_i72.GetPlacesSuggestionsUseCase>(
        () => _i72.GetPlacesSuggestionsUseCase(gh<_i35.MapRepository>()));
    gh.lazySingleton<_i73.GetProductDetailsUseCase>(
        () => _i73.GetProductDetailsUseCase(gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i74.GetProductReviewsAndRatingsUseCase>(() =>
        _i74.GetProductReviewsAndRatingsUseCase(gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i75.GetProductsOffersUseCase>(
        () => _i75.GetProductsOffersUseCase(gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i76.GetUserDataUseCase>(
        () => _i76.GetUserDataUseCase(gh<_i52.UserRepository>()));
    gh.lazySingleton<_i77.GetUserFavoriteProductsIdsUseCase>(() =>
        _i77.GetUserFavoriteProductsIdsUseCase(gh<_i40.ProductRepository>()));
    gh.lazySingleton<_i78.GetUserLocationUseCase>(
        () => _i78.GetUserLocationUseCase(gh<_i35.MapRepository>()));
    gh.lazySingleton<_i79.GetUserProductReviewUseCase>(
        () => _i79.GetUserProductReviewUseCase(gh<_i40.ProductRepository>()));
    gh.factory<_i80.HomeBloc>(() => _i80.HomeBloc(
          gh<_i69.GetCategoriesUseCase>(),
          gh<_i75.GetProductsOffersUseCase>(),
          gh<_i68.GetBrandsUseCase>(),
          gh<_i65.GetAllBrandsProductsUseCase>(),
        ));
    gh.factory<_i81.LoginCubit>(
        () => _i81.LoginCubit(gh<_i50.UserLoginUseCase>()));
    gh.factory<_i82.MapBloc>(() => _i82.MapBloc(
          gh<_i72.GetPlacesSuggestionsUseCase>(),
          gh<_i71.GetPlaceLatitudeAndLongitudeUseCase>(),
          gh<_i78.GetUserLocationUseCase>(),
          gh<_i48.UpdateUserLocationUseCase>(),
          gh<_i33.GetUserAccessTokenUseCase>(),
        ));
    gh.factory<_i83.SearchBloc>(
        () => _i83.SearchBloc(gh<_i45.SearchForProductsUseCase>()));
    gh.factory<_i84.SignupCubit>(
        () => _i84.SignupCubit(gh<_i54.UserSignUpUseCase>()));
    gh.factory<_i85.ThemeCubit>(() => _i85.ThemeCubit(
          gh<_i66.GetAppThemeUseCase>(),
          gh<_i60.ChangeAppThemeUseCase>(),
        ));
    gh.lazySingleton<_i86.UpdateProfilePictureUseCase>(
        () => _i86.UpdateProfilePictureUseCase(gh<_i52.UserRepository>()));
    gh.lazySingleton<_i87.UpdateUserDataUseCase>(
        () => _i87.UpdateUserDataUseCase(gh<_i52.UserRepository>()));
    gh.factory<_i88.DetailsCubit>(() => _i88.DetailsCubit(
          gh<_i73.GetProductDetailsUseCase>(),
          gh<_i74.GetProductReviewsAndRatingsUseCase>(),
          gh<_i56.AddOrEditProductReviewUseCase>(),
          gh<_i79.GetUserProductReviewUseCase>(),
          gh<_i33.GetUserAccessTokenUseCase>(),
        ));
    gh.factory<_i89.DiscoverBloc>(() => _i89.DiscoverBloc(
          gh<_i67.GetBrandProductsUseCase>(),
          gh<_i75.GetProductsOffersUseCase>(),
        ));
    gh.factory<_i90.FavoriteCubit>(() => _i90.FavoriteCubit(
          gh<_i33.GetUserAccessTokenUseCase>(),
          gh<_i77.GetUserFavoriteProductsIdsUseCase>(),
          gh<_i58.AddProductToFavoriteListUseCase>(),
          gh<_i43.RemoveProductFromFavoriteListUseCase>(),
          gh<_i73.GetProductDetailsUseCase>(),
          gh<_i70.GetFavoriteProductsUseCase>(),
        ));
    gh.factory<_i91.ProfileCubit>(() => _i91.ProfileCubit(
          gh<_i76.GetUserDataUseCase>(),
          gh<_i33.GetUserAccessTokenUseCase>(),
          gh<_i86.UpdateProfilePictureUseCase>(),
          gh<_i87.UpdateUserDataUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i92.RegisterModule {}
