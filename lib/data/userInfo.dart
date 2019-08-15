//用户信息数据
class UserInfo{

  String access_token;
  String sex; //性别
  String birthDate; //出生日期
  String city; //所在城市
  String height; //身高
  String weight; //重量
  String lifeStyle; //生活习惯
  String historyIll; //病史

  UserInfo(
      [this.sex,
      this.birthDate,
      this.city,
      this.height,
      this.weight,
      this.lifeStyle,
      this.historyIll,
      this.access_token]);
}
