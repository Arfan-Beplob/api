import 'dart:convert';
import 'package:api_get_method/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class UserProvider extends ChangeNotifier{
  final baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  UserModel? userModel;
  bool get hasDataLoaded => userModel !=null;

Future<void> getData ()async{
  await _getUserData();
}
Future<void> postData ()async{
  await _postUserData();
}
  Future<void> _getUserData ()async{
   try{
     final endUrl = '/1';
     final url = Uri.parse('$baseUrl$endUrl');
     final response = await http.get(url);
     final json = jsonDecode(response.body) as Map<String,dynamic>;
     if(response.statusCode == 200){
       userModel =UserModel.fromJson(json);
       print(response.statusCode);
       notifyListeners();
     }else {
       (error){
       print("${response.statusCode}");
     };
     }
   }catch(error){
     print(error as String);
   }

  }


  Future<void> _postUserData ()async{
    try{
      final url = Uri.parse('$baseUrl');
      var data= {
        "title":"New Title","userId":3,"id": 2,
      };
      var body = jsonEncode(data);
      final response = await http.post(url,
      body:body,headers: {"Content-type": "incapacitation/json"});
      var json = jsonDecode(response.body);
      if(response.statusCode == 200||response.statusCode == 201){
        print("New User Create Success $json StatusCode : ${response.statusCode}");
      }else {
            (error){
          print(error);
        };
      }
    }catch(error){
      print(error as String);
    }

  }

}