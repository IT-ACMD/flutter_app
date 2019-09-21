import 'dart:io';

//引入自定义的其他页面文件
import 'package:amap_location/amap_location.dart';
import 'package:flutter_app/tools/Filehelper.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'config.dart';
import 'data/dataCenter.dart';
import 'layout/BottomMenu.dart';
import 'pages/login/loginView.dart';
import 'package:flutter/material.dart';

import 'pages/userInfo/askPage.dart';

String location;
//BluetoothDevice device;
main() async {
  //蓝牙
  /*FlutterBlue flutterBlue = FlutterBlue.instance;
  flutterBlue.startScan(timeout: Duration(seconds: 4)).then((scanResults) {
    scanResults.forEach((scanResult){
      device = scanResult.device;
      print('${device.name} found! rssi: ${scanResult.rssi}');
    });
  });*/

  //var scanSubscription = flutterBlue.scan().listen((scanResult) {
  // do something with scan result

  //});

  /// Stop scanning
  //scanSubscription.cancel();

  /// Connect to the device
  /*await device.connect();

  List<BluetoothService> services = await device.discoverServices();
  services.forEach((service) async {
      // do something with service
      // Reads all characteristics
      var characteristics = service.characteristics;
      for(BluetoothCharacteristic c in characteristics) {
          List<int> value = await c.read();
          print(value);
      }
      // Writes to a characteristic
      await characteristics[0].write([0x12, 0x34]);
      
  });

  /// Disconnect from device
  device.disconnect();*/

  //是否近期成功登录过
  String url = await Filehelper.getAppdataUrl();
  File token = new File('$url/$accessTokenName');
  bool isNeedLogin = true;
  bool isExists = await token.exists();
  if (isExists) {
    token.readAsString().then((content) {
      eAccountData.accessToken = content;
      toLoginByToken().then((res) {
        if (res) {
          isNeedLogin = false;
        } else {
          eAccountData.accessToken = null;
        }
        ;
        runApp(MyApp(isNeedLogin));
      });
    });
  } else {
    runApp(MyApp(isNeedLogin));
  }
}

class MyApp extends StatelessWidget {
  bool _login = true;
  MyApp(bool isNeedLogin) {
    _login = isNeedLogin;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '项目标题',
      theme: ThemeData(
          primaryColor: Colors.black, accentColor: Colors.black), //设置为黑色主题
      home: _login
          ? LoginView()
          : BottomMenu(), //,//BottomMenu(),//这个类在，bottom_menu.dart  中定义。
      routes: <String, WidgetBuilder>{
        'loginPage': (_) => LoginView(),
        'home': (_) => BottomMenu(),
        'askPage': (_) => AskPage(),
      },
    );
  }
}

getCtity() async {
  //定位
  AMapLocationClient.setApiKey("6e845196f01af34608b5428ec98cd05d"); //高德app-key
  await AMapLocationClient.startup(new AMapLocationOption(
      desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
  await AMapLocationClient.getLocation(true);
  AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
    location = getLocationStr(loc);
  });
  AMapLocationClient.startLocation();
  location = getLocationStr(null);
  //_checkPersmission();
}

String getLocationStr(AMapLocation loc) {
  if (loc == null) {
    return "正在定位";
  }
  if (loc.isSuccess()) {
    if (loc.hasAddress()) {
      dispose();
      return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n 地址:${loc.formattedAddress} 城市:${loc.city} 省:${loc.province}";
    } else {
      return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n ";
    }
  } else {
    return "定位失败: \n错误:{code=${loc.code},description=${loc.description}";
  }
}

void dispose() {
  //这里可以停止定位
  AMapLocationClient.stopLocation();
}
