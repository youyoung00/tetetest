import 'package:flutter/foundation.dart';
import 'package:sh_selfstudy_ver0417/models/subModel.dart';

class MainDataModel{
  String title;
  List<SubModel> datas;
  MainDataModel({
    @required this.title,
    @required this.datas
  });
}

