String baseUrl = 'https://api.escuelajs.co/';
String graphqlUrl = '${baseUrl}graphql/';
String wsUrl = 'wss://www.jasan.net/graphql';

// GraphQL Queries
class GraphQLQueries {
  static const String getUserByUuid = '''
    query GetUserByUuid(\$uuid: String!) {
      getUserByUuid(uuid: \$uuid) {
        code
        message
        data {
          permissions
          first_name
        }
      }
    }
  ''';
}
