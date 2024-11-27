enum ProductCategory {
  electronics(
    subcategories: [
      SubCategory.smartphones,
      SubCategory.laptops,
      SubCategory.tablets,
      SubCategory.cameras,
      SubCategory.audioDevices,
      SubCategory.gamingConsoles,
      SubCategory.tvAndHomeTheater,
    ],
  ),
  fashion(
    subcategories: [
      SubCategory.womensWear,
      SubCategory.mensWear,
      SubCategory.kidsWear,
      SubCategory.accessories,
      SubCategory.footwear,
      SubCategory.jewelry,
    ],
  ),
  homeAndKitchen(
    subcategories: [
      SubCategory.furniture,
      SubCategory.kitchenware,
      SubCategory.homeDecor,
      SubCategory.bedding,
      SubCategory.outdoor,
    ],
  ),
  beautyAndPersonalCare(
    subcategories: [
      SubCategory.skincare,
      SubCategory.haircare,
      SubCategory.makeup,
      SubCategory.fragrance,
      SubCategory.personalCare,
    ],
  ),
  grocery(
    subcategories: [
      SubCategory.freshProduce,
      SubCategory.dairyAndEggs,
      SubCategory.meatAndPoultry,
      SubCategory.seafood,
      SubCategory.bakery,
      SubCategory.snacks,
      SubCategory.beverages,
    ],
  ),
  booksAndMedia(
    subcategories: [
      SubCategory.books,
      SubCategory.magazines,
      SubCategory.music,
      SubCategory.movies,
      SubCategory.digitalMedia,
    ],
  ),
  toysAndGames(
    subcategories: [
      SubCategory.boardGames,
      SubCategory.videoGames,
      SubCategory.toys,
      SubCategory.collectibles,
    ],
  );

  final List<SubCategory> subcategories;
  const ProductCategory({required this.subcategories});
}

enum SubCategory {
  smartphones,
  laptops,
  tablets,
  cameras,
  audioDevices,
  gamingConsoles,
  tvAndHomeTheater,
  womensWear,
  mensWear,
  kidsWear,
  accessories,
  footwear,
  jewelry,
  furniture,
  kitchenware,
  homeDecor,
  bedding,
  outdoor,
  skincare,
  haircare,
  makeup,
  fragrance,
  personalCare,
  freshProduce,
  dairyAndEggs,
  meatAndPoultry,
  seafood,
  bakery,
  snacks,
  beverages,
  books,
  magazines,
  music,
  movies,
  digitalMedia,
  boardGames,
  videoGames,
  toys,
  collectibles,
}

enum AdditionalEnum {
  productColor,
  productSize,
  productType,
}
