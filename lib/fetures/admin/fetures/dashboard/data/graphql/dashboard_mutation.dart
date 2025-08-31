class DashBoardMutations {
  factory DashBoardMutations() {
    return _instance;
  }
  const DashBoardMutations._();

  static const DashBoardMutations _instance = DashBoardMutations._();

  //Products
  Map<String, dynamic> numberOfProductsMutation() {
    return {
      'query': '''
            {
            products{
              title
            }
          }
      ''',
    };
  }

  //Products
  Map<String, dynamic> numberOfCategoriesMutation() {
    return {
      'query': '''
            {
            categories{
              name
            }
          }
      ''',
    };
  }

  //Products
  Map<String, dynamic> numberOfUsersMutation() {
    return {
      'query': '''
            {
            users{
              name
            }
          }
      ''',
    };
  }
}
