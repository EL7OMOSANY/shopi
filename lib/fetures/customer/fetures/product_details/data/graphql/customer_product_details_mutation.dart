class CustomerProductDetailsMutation {
  factory CustomerProductDetailsMutation() {
    return _instance;
  }
  const CustomerProductDetailsMutation._();

  static const CustomerProductDetailsMutation _instance =
      CustomerProductDetailsMutation._();

  //Product Details
  Map<String, dynamic> getProductDetailsMutation({required int id}) {
    return {
      'query':
          '''
           {
          product(id: $id) {
            id
            title
            price
            images
            description
              category{
                name
                }
          }
        },
  
      ''',
    };
  }
}
