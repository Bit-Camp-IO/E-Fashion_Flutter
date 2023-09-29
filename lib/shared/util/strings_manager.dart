class StringsManager {
  //! Navigation Strings
  static const String homeTabLabel = 'Home';
  static const String cartTabLabel = 'Cart';
  static const String favoriteTabLabel = 'Favorite';
  static const String accountTabLabel = 'Account';

  //! Auth Strings
  static const String welcomeTitle = "Start your new \nShopping experience";
  static const String welcomeSubtitle = "For fancy clothes and accessories";
  static const String loginTitle = 'Login';
  static const String rememberMe = 'Remember me';
  static const String forgetPasswordTitle = 'Forget Password';
  static const String noAccount = "Don't have an account ?";
  static const String signupTitle = 'Sign Up';
  static const String accountExist = 'Already have an account ?';
  static const String forgetPasswordSubtitle =
      'Enter the email address associated\n with your account.';
  static const String recoverPasswordButtonTitle = 'Recover Password';
  static const String otpVerifyTitle = 'OTP Verification';
  static const String emailVerifySubTitle =
      'Enter the 6 digital code we sent to\n your email address.';
  static const String emailVerifyButtonTitle = 'Verify and proceed';

  //! Home Strings
  static const String womanCategory = 'Woman';
  static const String menCategory = 'Men';
  static const String categorySectionTitle = 'Categories';
  static const String offersSectionTitle = 'Offers';
  static const String colorSection = 'Color :';
  static const String sizeSection = 'Size : ';
  static String productStock(int stock) => '$stock Pieces Available : ';
  static const String rateSuggestionTitle = 'Rate this product';
  static const String rateSuggestionSubTitle = 'Tell others what you think';
  static String addOrEditReviewTextButton(bool isWriteTitleEnabled) =>
      isWriteTitleEnabled ? 'Write a review' : 'Edit Your review';
  static String addOrEditReviewScreen(bool isAddTitleEnabled) =>
      isAddTitleEnabled ? 'Add Review' : 'Edit Review';
  static String addOrEditReviewButton(bool isAddTitleEnabled) =>
      isAddTitleEnabled ? 'Add Review' : 'Edit Review';
  static const String ratingsAndReviewsTitle = 'Rating and Reviews';
  static const String ratingAndReviewsSubTitle = 'What others think about this product.';
  static String reviewsCount(int reviewsCount) => '$reviewsCount  Reviews';
  static const String allReviewsScreenTitle = 'All Reviews';

  //! TextFields Text
  static const String email = 'Email';
  static const String currentPassword = 'Current Password';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String phoneNumber = 'Phone Number';
  static const String name = 'Name';
  static const String passwordIsRequired = 'Password is required';
  static const String passwordNoMatch = "Passwords don't match";

  //! Shared
  static const String addToBag = 'Add To Bag';
}
