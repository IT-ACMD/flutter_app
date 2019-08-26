import 'dart:convert';

import 'package:flutter_app/data/userInfo.dart';

import 'coachData.dart';
import 'recordWeight.dart';

//是否测试
final eIsTest = false;
//用户信息
final eUserInfo = UserInfo('爱吃蓝莓的凡','女','2001-01-01','上海市、浦东区');
//用户体重记录
final List<RecordWeightData> eRecordData = [];
//历史预警信息
final eWarningDatas = [
  RecordData('2019-5-5', '心率', '40', 'bpm', '漏搏', 2),
  RecordData('2019-5-15', '心率', '50', 'bpm', '暂停', 3),
  RecordData('2019-5-28', '心率', '80', 'bpm', '不齐', 4),
  RecordData('2019-6-1', '心率', '100', 'bpm', '过速', 5),
];
//教练信息
final eCoachList = [
  CoachInfo('小熊Libra', 'images/ecg_user1.png', 284, 521),
  CoachInfo('小熊Libra', 'images/ecg_user1.png', 284, 521),
  CoachInfo('小熊Libra', 'images/ecg_user1.png', 284, 521),
  CoachInfo('小熊Libra', 'images/ecg_user1.png', 284, 521),
  CoachInfo('小熊Libra', 'images/ecg_user1.png', 284, 521),
  CoachInfo('小熊Libra', 'images/ecg_user1.png', 284, 521),
  CoachInfo('小熊Libra', 'images/ecg_user1.png', 284, 521)
];

String getToken(){
  if(eUserInfo != null && eUserInfo.accessToken != null)
  {
    return 'bearer ${eUserInfo.accessToken}';
  }
  else
  {
    return 'Basic ${base64Encode(utf8.encode('fuhk:fuhksecret'))}';
  }
  
}
