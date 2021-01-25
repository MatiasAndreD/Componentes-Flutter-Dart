import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'slider': Icons.slideshow,
  'list': Icons.list
};

Icon getIcons(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}
