class GrlProducts {
  static String allProducts = """
  query {
    products_aggregate {
      nodes {
        title
        category_id
        description
        image
        price
        category {
          title
        }
      }
    }
  }  
  """;

  static String products = """
    query {
      products {
        id
        title
        image
        price
        category_id
        description
        status
        category{
          title
        }
        products_stars_aggregate {
          aggregate {
            avg {
              vote
            }
          }
        }
      }
    }
  """;

  static String categories = r'''
  query {
    categories {
      id
      title
      description
    }
  }
  ''';

  static String chooseCategory(value){
    return (
      """
      query chooseCategory {
        products(where: {_or: {category_id: {_eq: $value}}}) {
          category_id
          title
          price
          description
          image
          status
          products_stars_aggregate {
            aggregate {
              avg {
                vote
              }
            }
          }
        }
      }"""
    );  
  }

  static String byCategory = """
    query byCategory(\$code: Int!) {
      products(where: {category_id: {_eq: \$code}}) {
        title
        category_id
        image
        price
        products_stars_aggregate {
          aggregate {
            avg {
              vote
            }
          }
        }
      }
    }""";

  static String voteProduct = r"""
  mutation voteProduct($code: Int!, $vote: numeric!) {
    insert_products_star(objects: {product_id: $code, vote: $vote}) {
      affected_rows
    }
  }
  """;
}