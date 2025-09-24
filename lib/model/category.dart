import 'package:news/utils/assets_manager.dart';

class newCategory {
  String id;
  String title;
  String image;
  newCategory({required this.id,
  required this.image, required this.title});
  static List<newCategory> getCategoriesList(bool isDark){
    return[
     newCategory(id: 'general',
       title: 'General',
       image:  isDark?
       AssetsManager.generalLightImage
       :AssetsManager.generalDarkImage
     ),
      newCategory(id: 'business',
        title: 'Business',
        image:  isDark?
        AssetsManager.businessLightImage
            :AssetsManager.businessDarkImage
      ),
      newCategory(id: 'sports',
        title: 'Sports',
        image:  isDark?
        AssetsManager.sportsLightImage
            :AssetsManager.sportsDarkImage
      ),
      newCategory(id: 'technology',
        title: 'Technology',
        image:  isDark?
        AssetsManager.technologyLightImage
            :AssetsManager.technologyDarkImage
      ),

      newCategory(id: 'entertainment',
        title: 'Entertainment',
        image:  isDark?
        AssetsManager.entertainmentLightImage
            :AssetsManager.entertainmentDarkImage
      ),
      newCategory(id: 'health',
          title: 'Health',
          image:  isDark?
          AssetsManager.healthLightImage
              :AssetsManager.healthDarkImage
      ),
      newCategory(id: 'science',
          title: 'Science',
          image:  isDark?
          AssetsManager.scienceLightImage
              :AssetsManager.scienceDarkImage
      ),
    ];
  }
}