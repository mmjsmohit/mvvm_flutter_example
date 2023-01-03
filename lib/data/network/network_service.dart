import 'dart:convert';
import 'dart:math';

import 'package:mvvm_flutter_example/model/PicSumModel.dart';
import 'package:http/http.dart' as http;
class NetworkService{
  Random rn = new Random();
  Future<List<PicSumModel>> fetchPicturesAPI() async{
    String url = 'https://picsum.photos/v2/list?page=${rn.nextInt(20)}';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List<dynamic>;
      final listResult = json.map((e) => PicSumModel.fromJson(e)).toList();
      return listResult;
    }
    else{
      throw Exception('Error Fetching Pictures');
    }
  }
}