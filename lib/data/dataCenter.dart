import 'dart:convert';

import 'package:flutter_app/data/userInfo.dart';
import 'package:flutter_app/tools/ECHttp.dart';

import 'accountData.dart';
import 'coachData.dart';
import 'recordWeight.dart';

//是否测试
final eIsTest = true;
//账户信息
final eAccountData = AccountData(
  nickName: '测试用户',
);
//用户信息
final eUserInfo = UserInfo(
    sex: '女',
    birthDate: '2001-01-01',
    city: '上海市,闵行区'); //'爱吃蓝莓的凡''女','2001-01-01','上海市、浦东区'
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

String getToken() {
  if (eAccountData != null && eAccountData.accessToken != null) {
    return 'bearer ${eAccountData.accessToken}';
  } else {
    return 'Basic ${base64Encode(utf8.encode('fuhk:fuhksecret'))}';
  }
}

//根据token去登陆
toLoginByToken() async {
  List hears = [{'name': 'authorization','value': 'bearer ${eAccountData.accessToken}'}];
  String isNewPeople = await ECHttp.getData('user/consumerDetails/get', hears);
  if (isNewPeople != null && isNewPeople.length > 0) {
    var object1 = json.decode(isNewPeople);
    if (object1['success'] && object1['data'] != null) {
      afterLogin();
      return true;
    } 
  }
  return false;
}

afterLogin() {
  getAccountData();
  getUserData();
  //BlueHelper.initstate();
  //获取历史的体重记录数据
  getRecordData();
}

getAccountData() async {
  //获取账号信息
  List hears = [
    {'name': 'authorization', 'value': 'bearer ${eAccountData.accessToken}'}
  ];
  String data = await ECHttp.getData('user/user/get', hears);
  if (data != null && data.length > 0) {
    var jsonData = json.decode(data);
    if (jsonData['success']) {
      eAccountData.nickName = jsonData['data']['nickName'];
      eAccountData.level = jsonData['data']['level'];
      eAccountData.heartRateAlert = jsonData['data']['heartRateAlert'];
      eAccountData.phone = jsonData['data']['phone'].toString();
    }
  }
}

//修改账号信息
setAccoutRateAlert(Map map) async {
  /*Map map = {
    'heartRateAlert': value,
  };*/
  String data = await ECHttp.postDataJson('user/user/save', map);
  if (data != null && data.length > 0) {
    var jsonData = json.decode(data);
    if (jsonData['success']) {
      return true;
    }
  }
  return false;
}

getUserData() async {
  //获取详细信息
  List hears = [
    {'name': 'authorization', 'value': 'bearer ${eAccountData.accessToken}'}
  ];
  String userData = await ECHttp.getData('user/consumerDetails/get', hears);
  if (userData != null && userData.length > 0) {
    var jsonData = json.decode(userData);
    if (jsonData['success']) {
      eUserInfo.birthDate = jsonData['data']['birthdateStr'];
      eUserInfo.sex = jsonData['data']['sex'] == 1 ? '女' : '男';
      eUserInfo.city = jsonData['data']['address'];
      eUserInfo.height = jsonData['data']['height'];
      eUserInfo.weight = '${jsonData['data']['weightId']}kg';
      //eUserInfo.lifeStyle = jsonData['data']['habit'];
      //eUserInfo.historyIll = jsonData['data']['medicalHistory'];
      DateTime bir = DateTime.parse(eUserInfo.birthDate);
      eUserInfo.age = '${DateTime.now().year -  bir.year}';
    }
  }
}

//获取体重记录数据
getRecordData() async {
  if (eRecordData.length > 0) return;
  List hears = [
    {'name': 'authorization', 'value': 'bearer ${eAccountData.accessToken}'}
  ];
  String res = await ECHttp.getData('user/weight/gett', hears);
  if (res != null && res.length > 0) {
    var jsonData = json.decode(res);
    if (jsonData['success']) {
      var list = jsonData['data'];
      for (int i = 0; i < list.length; i++) {
        RecordWeightData rw = RecordWeightData();
        rw.weightVal = list[i]['weight'];
        rw.type = '初始体重';
        rw.creatTime = list[i]['createTimeStr'];
        eRecordData.insert(0, rw);
      }
    }
  }
}