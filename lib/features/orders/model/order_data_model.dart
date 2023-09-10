import '../../home/model/home_product_data_model.dart';

class OrderDataModel{
  final  String orderId;
  final String totalBill;
  List<String> orderedProductNames=[];

  OrderDataModel({required this.orderId,required this.totalBill,required this.orderedProductNames});
}