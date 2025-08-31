// import 'package:shopi/fetures/admin/fetures/products/data/models/product_request.dart';

// class ProductMutation {
//   factory ProductMutation() {
//     return instance;
//   }
//   const ProductMutation._();
//   static const ProductMutation instance = ProductMutation._();

//   Future<Map<String, dynamic>> productMutation({
//     required ProductRequest productRequest,
//   }) async {
//     return {
//       'query': r'''
//           mutation products($id: String!, $title: String!, $description: String!, $images: String!, $price: String!) {
//             products(
//             id: $id,
//              title: $title,
//              description: $description,
//               images: $images:,
//               price: $price
//               ) {
//                   category : {
//                   id
//                   name
//                   image

//                 }
//             }
//           }
//         ''',
//       'variables': {
//         'id': productRequest.id,
//         'title': productRequest.title,
//         'description':productRequest.description,
//         'images':productRequest.image,
//         'price':productRequest.price,
//       },
//     };
//   }
// }
