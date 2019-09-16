//体重记录数据
class RecordWeightData {
  String creatTime; //创建时间
  String weightVal; //体重数值
  String type; //类型

  RecordWeightData([this.weightVal, this.creatTime, this.type]);
}

//体重数据
class RecordData {
  String creatTime; //创建时间
  String typeName; //类型
  String unit; //单位
  String val; //体重数值
  String desn; //描述
  String res; //监测结果
  int status; //状态

  RecordData(this.creatTime,this.typeName,this.val,this.unit,this.res,this.status); //结果
}
