class CustomerViewAllProductsMutation {
  factory CustomerViewAllProductsMutation() {
    return _instance;
  }
  const CustomerViewAllProductsMutation._();

  static const CustomerViewAllProductsMutation _instance =
      CustomerViewAllProductsMutation._();

  //Product Details
  Map<String, dynamic> viewAllProductsMutation({required int offset}) {
    return {
      'query':
          '''
           {
          products(limit: 6, offset:$offset) {
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
