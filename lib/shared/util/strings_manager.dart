class StringsManager {
  //! Navigation Strings
  static const String homeTabLabel = 'Home';
  static const String cartTabLabel = 'Cart';
  static const String favoriteTabLabel = 'Favorite';
  static const String accountTabLabel = 'Account';
  static const String cartLocationError = "You must set your location in ِAccount Tab.";

  //! Auth Strings
  static const String welcomeTitle = "Start your new \nShopping experience";
  static const String welcomeSubtitle = "For fancy clothes and accessories";
  static const String loginTitle = 'Login';
  static const String rememberMe = 'Remember me';
  static const String forgetPasswordTitle = 'Forget Password';
  static const String noAccount = "Don't have an account ?";
  static const String signupTitle = 'Sign Up';
  static const String accountExist = 'Already have an account ?';
  static const String forgetPasswordSubtitle = 'Enter the email address associated\n with your account.';
  static const String recoverPasswordButtonTitle = 'Recover Password';
  static const String otpVerifyTitle = 'OTP Verification';
  static const String emailVerifySubTitle = 'Enter the 6 digital code we sent to\n your email address.';
  static const String emailVerifyButtonTitle = 'Verify and proceed';
  static const String resendOtpIn = 'RESEND OTP IN';
  static const String noOtpCode = "Didn't Receive OTP Code ?";
  static const String resendOtp = 'Resend';
  static const String privacyAndPolicyText1 = "I Agree with";
  static const String privacyAndPolicyText2 = " Privacy";
  static const String privacyAndPolicyText3 =  " and";
  static const String privacyAndPolicyText4 = " policy";
  static const String resetPasswordTitle = "Reset Password";
  static const String resetPasswordSubtitle = "Your new password must be different\n from previous used password.";

  //! Home Strings
  static const String womanCategory = 'Woman';
  static const String menCategory = 'Men';
  static const String categorySectionTitle = 'Categories';
  static const String offersSectionTitle = 'Offers';
  static const String sectionButtonDefaultTitle = 'Discover';
  static const String applyButtonTitle = 'Apply';
  // Collection
  static const String collectionUpperCase = 'COLLECTION';
  static const String collection = 'Collection';
  static const String collectionOff = '%OFF';
  static const String collectionSubTitle = 'For Selected collection';
  static const String collectionShopButton = 'Shop Now';
  static const String buyCollectionButton = 'Buy Collection';
  // Discover
  static String discoverBrand(String name) => 'Discover $name';
  static const String discoverOffers = 'Discover Offers';

  //Product Details
  static String productStock(int stock) => '$stock Pieces Available : ';
  static const String rateSuggestionTitle = 'Rate this product';
  static const String rateSuggestionSubTitle = 'Tell others what you think';
  static String addOrEditReviewTextButton(bool isWriteTitleEnabled) => isWriteTitleEnabled ? 'Write a review' : 'Edit Your review';
  static String addOrEditReviewScreen(bool isAddTitleEnabled) => isAddTitleEnabled ? 'Add Review' : 'Edit Review';
  static String addOrEditReviewButton(bool isAddTitleEnabled) => isAddTitleEnabled ? 'Add Review' : 'Edit Review';
  static const String ratingsAndReviewsTitle = 'Rating and Reviews';
  static const String ratingAndReviewsSubTitle = 'What others think about this product.';
  static const String reviewCardNotice = 'Reviews are public and include your account and device info.';
  static const String seeAllReviewsButton = 'See all reviews';
  static const String emptyReview = "No additional comments available.";
  static String reviewsCount(int reviewsCount) => '$reviewsCount  Reviews';
  static const String allReviewsScreenTitle = 'All Reviews';
  // Search Text
  static const String searchScreenTitle = 'Search';
  static const String searchFiltersTitle = 'Search Filters';
  static const String applyFiltersButtonTitle = 'Apply Filters';
  static const String brandsFilterTitle = 'Brands';
  static const String categoriesFilterTitle = 'Categories';
  static const String priceFilterTitle = 'Price';
  static const String noSearchResults = "We couldn't find any\n search results.";
  static const String noSearchYet = 'No results yet\n try to type something.';

  //! Notifications
  static const String notificationsScreenTitle = 'Notifications';
  static const String messageNotificationTitle = 'You received a message fom chat support';
  static const String notificationPermissionDialog = 'You have to re-enable Notifications\n permissions from settings';
  static const String notificationOpenSettingButton = 'Open Settings';
  static const String notificationDialogCloseButton = 'Close';

  //! Cart
  static const String cartScreenTitle = 'Shopping Bag';
  static const String emptyCartTitle = 'Empty Shopping Bag';
  static const String emptyCartSubTitle = 'Select the product you\n want to purchase.';
  static const String cartSubTotal = 'Sub total :';
  static const String cartCheckOutButtonTitle = 'Check Out';

  //! Favorite
  static const String favoriteScreenTitle = 'Favourites 💙';

  //! Account Tab
  static const String profileTitle = "Profile Settings";
  static const String myProfileTab = "My Profile";
  static const String locationTab = "Location";
  static const String ordersTab = "My Orders";
  static const String chatTab = "Chat Support";
  static const String changePasswordTab = "Change Password";
  static const String notificationSwitch = "Notifications";
  static const String appThemeSwitch = "App Theme";

  //profile
  static const String editProfile = "Edit Profile";
  static const String profileInfoUpdated = "Profile Info Updated Successfully.";
  static const String updateButtonTitle = "Update";

  //map
  static const String markerError = "ERROR! You should set a marker first.";
  static const String confirmLocationButton = 'Confirm Location';
  static const String updateLocationButton = 'Update Location';

  // Chat
  static const String chatScreenTitle = 'Chat Support';
  static const String secureMessage = "Message and calls are secured, \n no one outside of this chat can read them";
  static const String messageFieldHintText = 'Message';
  static const String messageValidationResponse = "Message Can't be empty.";

  // Orders
  static const String orderScreenTitle = 'Orders List';
  static const String orderInProgress = 'In Progress';
  static const String orderInItsWay = "On It's way";
  static const String orderDelivered = 'Delivered';
  static String orderId(String id) => 'OrderId : #${id.length > 10 ? '${id.substring(0, 10)}..' : id}';
  static String orderCost(int cost) => 'Order Price : $currencySign$cost';

  //Order Receipt Screen
  static const String orderReceiptTitle = 'ORDER RECEIPT';
  static const String orderReceiptCongratulations = "Congratulations";
  static const String orderReceiptConfirmation = 'Your order is confirmed';
  static const String orderReceiptOrderedBy = 'Ordered By : ';
  static const String orderReceiptDeliverDate = 'Delivery Date : ';
  static const String orderReceiptDate = 'Date : ';
  static const String orderReceiptTime = 'Time : ';
  static const String orderReceiptPrice = 'Order Price : ';
  static const String orderReceiptGoBackButton =  'Go Back';

  // No Internet Widget

  static const String noInternetTitle = 'No internet connection';
  static const String noInternetSubTitle = 'Please make sure that your are\n connected to the wifi';
  static const String noInternetTryAgainButton = 'Try Again';

  //! Shared
  static const String currencySign = '\$';
  static const String addToBag = 'Add To Bag';
  static const String colorSection = 'Color :';
  static const String sizeSection = 'Size : ';

  static String piecesAvailable(int pieces) => '$pieces Pieces Available';
  static const String emptyFavoriteTitle = 'Empty Favorite List';
  static const String emptyFavoriteSubTitle = 'Tap on product Favorite\n icon to add it.';
  static const String continueButtonTitle = 'Continue';
  static const String searchHint = "Search...";
  // TextFields Text
  static const String email = 'Email';
  static const String newPassword = "New Password";
  static const String currentPassword = 'Current Password';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String phoneNumber = 'Phone Number';
  static const String name = 'Name';
  static const String describeYourOpinion = 'Describe your opinion';

  //! TextField Validation
  static const String textIsRequired = ' is required';
  static const String textIsTooShort = 'is too short';
  static const String phoneNumberValidationMessage = 'Invalid Phone Number ex: 01045678910';
  static const String emailValidationMessage = 'Not a valid email address';
  static const String passwordIsRequiredMessage = 'Password is required';
  static const String passwordNoMatch = "Passwords don't match";
  static const String passwordTooShort = 'Password is too short (minimum 8 chars)';
  static const String passwordMustHaveLowerCaseLetter = 'Password must contain one lowercase letter';
  static const String passwordMustHaveUpperCaseLetter = 'Password must contain one uppercase letter';
  static const String passwordMustHaveOneDigit = 'Password must contain one digit';
  static const String reviewValidationMessage = "The review must be at least 20 Characters.";
}
