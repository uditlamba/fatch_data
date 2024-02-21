import 'dart:convert';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class HomeController extends GetxController{
  bool isLoading = false;
  List<SamplePost> apiData=[];


  Future<void> getData() async {
    final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString()) as List<dynamic>;
      apiData = data.map((item) => SamplePost.fromJson(item)).toList();
      update();
      // print(apiData);
      // return samplePosts;
    } else {
      // throw Exception('Failed to load data');
    }
  }
}

