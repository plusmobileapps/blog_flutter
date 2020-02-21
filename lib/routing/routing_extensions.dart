import 'package:blog_flutter/routing/routing_data.dart';

RoutingData getRoutingData(String namedRoute) {
  var uriData = Uri.parse(namedRoute);
  print('queryParams: ${uriData.queryParameters}, path: ${uriData.path}');
  return RoutingData(queryParameters: uriData.queryParameters, route: uriData.path);
}
//TODO implement with extension when dart is upgraded
//extension StringExtension on String {
//  RoutingData get getRoutingData {
//    var uriData = Uri.parse(this);
//    print('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
//    return RoutingData(
//      queryParameters: uriData.queryParameters,
//      route: uriData.path,
//    );
//  }
//}
