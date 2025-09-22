import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopi/core/app/upload_image_cubit/models/upload_image_resourse.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/create_category_response.dart';
import 'package:shopi/fetures/admin/fetures/category/data/models/get_all_categories_response.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/data/models/category_nums_response.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/data/models/products_nums_response.dart';
import 'package:shopi/fetures/admin/fetures/dashboard/data/models/users_nums_response.dart';
import 'package:shopi/fetures/admin/fetures/products/data/models/get_all_products_response.dart';
import 'package:shopi/fetures/admin/fetures/users/data/models/get_all_users_response.dart';
import 'package:shopi/fetures/auth/login/data/models/login_response.dart';
import 'package:shopi/fetures/auth/login/data/models/user%20role/models/user_role_response.dart';
import 'package:shopi/fetures/auth/signup/data/models/signup_response.dart';
import 'package:shopi/fetures/customer/fetures/home/data/models/banners_response.dart';
import 'package:shopi/fetures/customer/fetures/product_details/data/models/product_details_reponse.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<Map<String, dynamic>> login(@Body() Map<String, dynamic> mutation);

  @GET('/api/v1/auth/profile')
  Future<UserRoleResponse> userRole();

  @POST('/api/v1/files/upload')
  Future<UploadImageResourse> uploadImage(@Body() FormData file);

  @POST(graphql)
  Future<SignupResponse> signUp(@Body() Map<String, dynamic> mutation);

  @POST(graphql)
  Future<ProductsNumsResponse> numberOfProducts(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphql)
  Future<CategoryNumsResponse> numberOfCategories(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphql)
  Future<UsersNumsResponse> numberOfUsers(@Body() Map<String, dynamic> query);

  @POST(graphql)
  Future<GetAllCategoriesResponse> getAllCategories(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphql)
  Future<CreateCategoryResponse> createCategory(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(graphql)
  Future<void> deleteCategory(@Body() Map<String, dynamic> mutation);

  @POST(graphql)
  Future<void> updateCategory(@Body() Map<String, dynamic> mutation);

  @POST(graphql)
  Future<GetAllProductsResponse> getAllProduct(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphql)
  Future<Map<String, dynamic>> createProduct(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(graphql)
  Future<void> deleteProduct(@Body() Map<String, dynamic> mutation);

  @POST(graphql)
  Future<void> updateProduct(@Body() Map<String, dynamic> mutation);

  @POST(graphql)
  Future<GetAllUsersResponse> getAllUsers(@Body() Map<String, dynamic> query);

  @POST(graphql)
  Future<void> deleteUser(@Body() Map<String, dynamic> mutation);

  @POST(graphql)
  Future<BannersResponse> getBanners(@Body() Map<String, dynamic> query);

  @POST(graphql)
  Future<CustomerProductDetailsResponse> productDetails(
    @Body() Map<String, dynamic> query,
  );

  // @POST(graphql)
  // Future<GetAllProductResponse> getCategory(
  //   @Body() Map<String, dynamic> query,
  // );

  @POST(graphql)
  Future<GetAllProductsResponse> getProductsViewAll(
    @Body() Map<String, dynamic> query,
  );

  // @POST(graphql)
  // Future<GetAllProductResponse> searchProduct(
  //   @Body() Map<String, dynamic> query,
  // );
}
