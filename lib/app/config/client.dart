import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hello_word/app/shared/services/shared_preferences_service.dart';

class Config {
  static final HttpLink httpLink =
      HttpLink(
        uri: "https://jhoneburger.herokuapp.com/v1/graphql",
        // headers: {"HASURA_GRAPHQL_ADMIN_SECRET":"xerebenebias.123.isaac.julia"}
      );

  static final AuthLink authLink = AuthLink(getToken: () async => await sharedPreferenceService.token);

  static final WebSocketLink websocketLink = WebSocketLink(
    url: 'wss://jhoneburger.herokuapp.com/v1/graphql',
    config: SocketClientConfig(
      autoReconnect: true,
      inactivityTimeout: Duration(seconds: 30),
    ),
  );

  // static final Link link = authLink.concat(httpLink).concat(websocketLink);
  static final Link link = authLink.concat(httpLink).concat(websocketLink);
  // static final Link link = httpLink;
  
  static ValueNotifier<GraphQLClient> initailizeClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
        // cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
        link: link,defaultPolicies: DefaultPolicies()
      ),
    );
    return client;
  }
}
