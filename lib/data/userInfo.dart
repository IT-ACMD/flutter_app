import 'package:flutter/material.dart';

class UserInfo {
  String sex; //性别
  String birthDate; //出生日期
  String city; //所在城市
  double height; //身高
  double weight; //重量
  String lifeStyle; //生活习惯
  String historyIll; //病史

  UserInfo(
      [this.sex,
      this.birthDate,
      this.city,
      this.height,
      this.weight,
      this.lifeStyle,
      this.historyIll]);
}
