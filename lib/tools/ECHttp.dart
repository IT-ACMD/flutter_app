//异步请求数据
import 'dart:convert';

import 'dart:io';

import 'package:flutter_app/data/dataCenter.dart';

import '../config.dart';

class ECHttp {
  static getData(url, list) async {
    print('------getData--------');
    var httpClient = new HttpClient();
    var result;
    try {
      //请求路径
      var request = await httpClient.getUrl(Uri.parse('$eServiceUrl$url'));
      //添加请求头
      for(int i = 0; i < list.length; i++)
      {
        request.headers.add(list[i]['name'], list[i]['value']);
      }
      //返回值
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        print('getData请求成功');
        var json = await response.transform(utf8.decoder).join();
        result = json;
      } else {
        //result = 'Error getting json data:\nHttp status ${response.statusCode}';
        result = null;
      }
    } catch (exception) {
      //result = 'Faild getting json data';
      result = null;
    }
    return result;
  }

  static postData(url, params) async {
    print('------postData--------');
    var result;
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse('$eServiceUrl$url'));
    // 设置请求头
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/x-www-form-urlencoded');
    //Base64 加密username he userpwd
    var token = getToken();
    request.headers.set(HttpHeaders.authorizationHeader, token);
    request.headers.add('deviceId', '008');
    /// 添加请求体
    /// request.write("mobile=$phone&smsCode=$code");
    request.write(params);
    try {
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      if (response.statusCode == HttpStatus.ok) {
        print('postData请求成功');
        print(responseBody);
        result = responseBody;
      }
    } catch (exception) {
      print('postData请求失败');
      result = null;
    }
    return result;
  }


  static postDataJson(url, data) async {
    print('------postData--------');
    var result;
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse('$eServiceUrl$url'));
    // 设置请求头
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    //Base64 加密username he userpwd
    var token = getToken();
    request.headers.set(HttpHeaders.authorizationHeader, token);
    request.headers.add('deviceId', '008');
    /// 添加请求体
    /// request.write("mobile=$phone&smsCode=$code");
    request.add(utf8.encode(json.encode(data)));
    try {
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      if (response.statusCode == HttpStatus.ok) {
        print('postData请求成功');
        print(responseBody);
        result = responseBody;
      }
    } catch (exception) {
      print('postData请求失败');
      result = null;
    }
    return result;
  }
}
