import 'dart:convert';

import 'package:flutter_app/data/userInfo.dart';
import 'package:flutter_app/tools/ECHttp.dart';

import 'accountData.dart';
import 'coachData.dart';
import 'recordWeight.dart';

//是否测试
final eIsTest = false;
//账户信息
final eAccountData = AccountData();
//用户信息
final eUserInfo = UserInfo(name: '爱吃蓝莓的凡',sex: '女',birthDate: '2001-01-01',city: '上海市,闵行区');//'爱吃蓝莓的凡''女','2001-01-01','上海市、浦东区'
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
  if(eAccountData != null && eAccountData.accessToken != null)
  {
    return 'bearer ${eAccountData.accessToken}';
  }
  else
  {
    return 'Basic ${base64Encode(utf8.encode('fuhk:fuhksecret'))}';
  }
  
}

Future afterLogin() async {
  List hears = [
    {
      'name': 'authorization',
      'value': 'bearer ${eAccountData.accessToken}'
    }
  ];
  String data = await ECHttp.getData('user/user/get', hears);
  if(data != null && data.length > 0)
  {
    var jsonData= json.decode(data);
    if(jsonData['success'])
    {
      eAccountData.nickName = jsonData['data']['nickName'];
      eAccountData.level = jsonData['data']['level'];
    }
    
  }
}

