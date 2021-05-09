class FoodItemClass {
  int mPrice;
  String mName;
  String mDescription;
  String mImageName;
  bool mSameDayOrder;

  FoodItemClass(
      {this.mPrice,
      this.mName,
      this.mDescription,
      this.mImageName,
      this.mSameDayOrder});

  int get price => mPrice;
  String get name => mName;
  String get description => mDescription;
}
