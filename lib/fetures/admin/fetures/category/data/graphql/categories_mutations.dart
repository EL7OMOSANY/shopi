import 'package:shopi/fetures/admin/fetures/category/data/models/create_category_request.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/delete_category.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/update_category_request.dart';

class CategoriesMutations {
  factory CategoriesMutations() {
    return _instance;
  }
  const CategoriesMutations._();

  static const CategoriesMutations _instance = CategoriesMutations._();

  Map<String, dynamic> getAllCategoriesMutation() {
    return {
      'query': '''
            {
            categories{
              id
              name
              image
            }
          }
      ''',
    };
  }

  Map<String, dynamic> createMutation({
    required CreateCategoryRequest createCategoryRequest,
  }) {
    return {
      'query': r'''
          mutation Create($name: String!, $image: String!) {
            addCategory(
              data: {name: $name, image: $image}
            ) {
              id
              name
              image
            }
          }
        ''',
      'variables': {
        'name': createCategoryRequest.name,
        'image': createCategoryRequest.image,
      },
    };
  }

  Map<String, dynamic> deleteMutation({
    required DeleteCategoryRequest deleteCategoryRequest,
  }) {
    return {
      'query': r'''
            mutation DeleteCategory($categoryId: ID!) {
              deleteCategory(id: $categoryId)
            }
      ''',
      'variables': {'categoryId': deleteCategoryRequest.id},
    };
  }

  Map<String, dynamic> updateMutation({
    required UpdateCategoryRequest updateCategoryRequest,
  }) {
    return {
      'query': r'''
            mutation Update($id: ID!, $name: String!, $image: String!) {
            updateCategory(id: $id, changes: { name: $name, image: $image}) {
              id
            }
          }
        ''',
      'variables': {
        'id': updateCategoryRequest.id,
        'name': updateCategoryRequest.name,
        'image': updateCategoryRequest.image,
      },
    };
  }
}
