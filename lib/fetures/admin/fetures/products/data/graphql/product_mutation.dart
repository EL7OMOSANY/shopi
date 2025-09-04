import 'package:shopi/fetures/admin/fetures/products/data/models/create_product_request.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/delete_product.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/update_product_request.dart';

class ProductsMutations {
  factory ProductsMutations() {
    return _instance;
  }
  const ProductsMutations._();

  static const ProductsMutations _instance = ProductsMutations._();

  //Product get all
  Map<String, dynamic> getAllProductsMutation() {
    return {
      'query': '''
            {
            products{
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
          }
      ''',
    };
  }

  //Create Product
  Map<String, dynamic> createProductMutation({
    required CreateProductRequest createProductRequest,
  }) {
    return {
      'query': r'''
          mutation CreateProduct($title: String!, $price: Float!, $description:String!, $categoryId: Float!,$imagesList:[String!]!  ) {
              addProduct(
                data: {
                  title: $title,
                  price: $price
                  description: $description
                  categoryId: $categoryId
                  images: $imagesList
                }
              ) {
                title

              }
            }
        ''',
      'variables': {
        'title': createProductRequest.title,
        'price': createProductRequest.price,
        'description': createProductRequest.description,
        'categoryId': createProductRequest.categoryId,
        'imagesList': createProductRequest.images,
      },
    };
  }

  Map<String, dynamic> deleteMutation({required DeleteProduct deleteProduct}) {
    return {
      'query': r'''
            mutation DeleteCategory($productId: ID!) {
              deleteProduct(id: $productId)
            }
      ''',
      'variables': {'productId': deleteProduct.id},
    };
  }

  //Update Product
  Map<String, dynamic> updateProductMap({
    required UpdateProductRequest updateProductRequest,
  }) {
    return {
      'query': r'''
            mutation UpdateProduct($productId: ID!, $title: String!,$description: String!,$imageList:[String!]!,$price: Float!,$categoryId: Float! ) {
          updateProduct(id: $productId, 
          changes: { 
            title: $title,
            categoryId: $categoryId,
            images:$imageList,
            description: $description,
            price:$price
            }) {
            title
          }
        }
        ''',
      'variables': {
        'productId': updateProductRequest.productId,
        'title': updateProductRequest.title,
        'description': updateProductRequest.description,
        'imageList': updateProductRequest.imageList,
        'categoryId': updateProductRequest.categoryId,
        'price': updateProductRequest.price,
      },
    };
  }
}
