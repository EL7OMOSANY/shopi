class CustomerGetProductsByCategoryMutation {
  factory CustomerGetProductsByCategoryMutation() {
    return _instance;
  }
  const CustomerGetProductsByCategoryMutation._();

  static const CustomerGetProductsByCategoryMutation _instance =
      CustomerGetProductsByCategoryMutation._();

  //Product Details by category id
  Map<String, dynamic> getProductsByCategoryIdMutation({
    required int categoryId,
  }) {
    return {
      'query':
          '''
           {
          products(categoryId: $categoryId) {
              id
              title
              price
              images
              description
              category{
                    id
                    name
                }
          }
        },
  
      ''',
    };
  }
}
