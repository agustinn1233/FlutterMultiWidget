import 'package:flutter/material.dart';
import 'package:flutter_application_widget/src/pages/alert_pages.dart';
import 'package:flutter_application_widget/src/pages/animated_container.dart';
import 'package:flutter_application_widget/src/pages/avatar_pages.dart';
import 'package:flutter_application_widget/src/pages/card_page.dart';
import 'package:flutter_application_widget/src/pages/home_pages.dart';
import 'package:flutter_application_widget/src/pages/input_pages.dart';
import 'package:flutter_application_widget/src/pages/listview_pages.dart';
import 'package:flutter_application_widget/src/pages/slider_pages.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimateContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage(),
  };
}
