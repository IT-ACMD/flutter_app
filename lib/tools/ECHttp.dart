//异步请求数据
import 'dart:convert';

import 'dart:io';

import '../config.dart';

class ECHttp {
  static getData(url) async {
    print('------getData--------');
    var httpClient = new HttpClient();

    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse('$eServiceUrl$url'));
      request.headers.add('deviceId', '008');
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        print('getData请求成功');
        var json = await response.transform(utf8.decoder).join();
        result = json.length <= 0 ? 'ok' : jsonDecode(json);
        int a = 1;
      } else {
        //result = 'Error getting json data:\nHttp status ${response.statusCode}';
        result = null;
      }
    } catch (exception) {
      //result = 'Faild getting json data';
      result = null;
    }
    return result;
    /*if(!mounted)return;
    
    setState((){
      data = result;
    });*/
  }

  static postData(url, phone, code) async {
    print('------postData--------');

    HttpClient httpClient = new HttpClient();

    HttpClientRequest request = await httpClient.postUrl(Uri.parse('$eServiceUrl$url'));

    // 设置请求头
    // Content-Type大小写都ok
    request.headers
        .set(HttpHeaders.contentTypeHeader, 'application/x-www-form-urlencoded');

    //Base64 加密username he userpwd
    var token = base64Encode(utf8.encode('fuhk:fuhksecret'));
    request.headers.set(HttpHeaders.authorizationHeader, 'Basic $token');
    request.headers.add('deviceId', '008');

    /// 添加请求体
    /*json 格式*/
    //Map jsonMap = {'mobile': '17521024021', 'smsCode': '1234'};
    //request.add(utf8.encode(json.encode(jsonMap)));
    /**x-www-form-urlencoded格式 */
    request.write("mobile=$phone&smsCode=$code");
    try {
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      if (response.statusCode == HttpStatus.ok) {
        print('postData请求成功');
        return responseBody;
      }
    } catch (exception) {
      print('postData请求失败');
    }
  }
}
