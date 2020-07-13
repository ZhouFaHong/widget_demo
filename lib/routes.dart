import 'package:flutter/material.dart';
import 'package:widget_demo/home.dart';

import 'page/datatable/datatable_page.dart';


// 配置路由
final routes = 
{
  '/':(context,{arguments}) => MyHomePage(),
  '/DataTable':(context,{arguments}) => DataTablePage(),
  // '/topicDetailPage':(context,{arguments}) => TopicDetailPage(arguments:arguments),
  
};


// 固定写法 
var onGenerateRoute = (RouteSettings settiings){
  // 统一处理
  final String name = settiings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settiings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context)=>pageContentBuilder(context,arguments:settiings.arguments));
      return route;
    }else{
      final Route route = MaterialPageRoute(
        builder: (context)=>pageContentBuilder(context));
        return route;
    }
    
  }else{
    return null;
  }
};