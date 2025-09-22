class CustomerHomeMutation {
  factory CustomerHomeMutation() {
    return _instance;
  }
  const CustomerHomeMutation._();

  static const CustomerHomeMutation _instance = CustomerHomeMutation._();

  //Product get all
  Map<String, dynamic> getBannersMutation() {
    return {
      'query': '''
            {
            products{
              title
              images
            }
          }
      ''',
    };
  }
}
