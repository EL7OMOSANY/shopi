import 'package:shopi/fetures/customer/fetures/search/data/models/customer_search_request_body.dart';

class CustomerSearchMutation {
  factory CustomerSearchMutation() {
    return _instance;
  }
  const CustomerSearchMutation._();

  static const CustomerSearchMutation _instance = CustomerSearchMutation._();

  // Search for product
  Map<String, dynamic> searchProduct({
    required CustomerSearchRequestBody body,
  }) {
    return {
      'query': r'''
        query SearchProducts($searchName: String , $priceMax: Int , $priceMin: Int){
             products(title: $searchName, price_max: $priceMax, price_min:$priceMin){
            id
            title
            images
            description
            price
            category{
                name
                id
            }
          }
        }        
        ''',
      'variables': {
        'searchName': body.searchName,
        'priceMax': body.priceMax,
        'priceMin': body.priceMin,
      },
    };
  }
}
