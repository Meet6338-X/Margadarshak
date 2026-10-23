/// The shared vocabulary that links what a student likes to what they can do.
///
/// Careers and opportunities are written by different people, so they use
/// different words: a career is tagged `machines`, an opportunity is filed
/// under `technical-education`. This taxonomy maps the opportunity wording
/// onto the career wording, so a student who picked "machines" sees both.
library;

/// Maps between the interest vocabulary and the category vocabulary.
abstract final class InterestTaxonomy {
  /// Every interest a student can pick, in the order they are offered.
  static const List<String> allTags = <String>[
    'farming',
    'health',
    'teaching',
    'machines',
    'motors',
    'repair',
    'driving',
    'computers',
    'phones',
    'solar',
    'cooking',
    'food',
    'craft',
    'design',
    'drawing',
    'fashion',
    'beauty',
    'people',
    'books',
    'numbers',
    'animals',
  ];

  /// The interest tags implied by each career category.
  static const Map<String, List<String>> categoryTags = <String, List<String>>{
    'agriculture': <String>['farming', 'animals', 'machines'],
    'business': <String>['numbers', 'people'],
    'digital': <String>['computers', 'phones', 'design'],
    'education': <String>['teaching', 'books', 'people'],
    'green': <String>['solar', 'farming'],
    'health': <String>['health', 'people'],
    'trades': <String>['machines', 'repair', 'craft', 'motors'],
  };

  /// The interest tags implied by each opportunity category.
  static const Map<String, List<String>> opportunityCategoryTags =
      <String, List<String>>{
    'agriculture': <String>['farming', 'animals'],
    'apprenticeship': <String>['machines', 'motors', 'repair', 'computers'],
    'counselling': <String>['people', 'teaching'],
    'defence': <String>['motors', 'driving'],
    'employment': <String>['driving', 'machines', 'cooking'],
    'entrance': <String>['books', 'numbers'],
    'exam': <String>['books', 'numbers'],
    'fee-waiver': <String>['books', 'teaching'],
    'first-generation': <String>['books', 'teaching'],
    'food-processing': <String>['cooking', 'food', 'farming'],
    'girls': <String>['people', 'teaching', 'design'],
    'government': <String>['people'],
    'higher-education': <String>['books', 'numbers', 'teaching'],
    'livelihood': <String>['farming', 'motors', 'driving'],
    'medical': <String>['health', 'people'],
    'research': <String>['books', 'computers'],
    'rural': <String>['farming', 'animals'],
    'scholarship': <String>['books', 'teaching', 'numbers'],
    'school': <String>['books', 'teaching'],
    'science': <String>['books', 'machines'],
    'skill': <String>['machines', 'repair', 'computers', 'solar', 'craft'],
    'teaching': <String>['teaching', 'books'],
    'technical-education': <String>['computers', 'phones', 'machines'],
    'vocational': <String>['craft', 'fashion', 'beauty', 'cooking'],
  };

  /// Returns every interest tag implied by [categories].
  static Set<String> tagsForCategories(Iterable<String> categories) {
    final tags = <String>{};
    for (final category in categories) {
      final key = category.toLowerCase();
      tags.addAll(opportunityCategoryTags[key] ?? const <String>[]);
      tags.addAll(categoryTags[key] ?? const <String>[]);
    }
    return tags;
  }

  /// Returns the localization key for the label of an interest tag.
  static String labelKeyForTag(String tag) => 'interest_$tag';

  /// Returns the localization key for the label of a career category.
  static String labelKeyForCategory(String category) => 'category_$category';
}
