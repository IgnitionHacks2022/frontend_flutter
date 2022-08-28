import 'package:http/http.dart' as http;
import 'dart:convert';
String ip = "https://ignition.zhehaizhang.com";
class Session{
    String token;
    String name;
    String email;
    String bluetoothId;
    Session({this.token="",this.name="",this.email="",this.bluetoothId="Nithin's Iphone"});
}
Future<Session> login(String email,String password) async{
  Map<String, String> headers = {"Content-type": "application/json"};
  String body = jsonEncode({"password":password,'email':email});
  final response = await http.post(Uri.parse(ip+"/login"),headers:headers,body: body);
  var data=jsonDecode(response.body);
  print(response.statusCode);

  if(response.statusCode==200){
      return Session(token:data["token"],name:data["name"],email:email);


      
  }
  return Session();


}

String getBlueName(){
    return "n";
}
Future<Session> register(String email,String password,String name) async{
  Map<String, String> headers = {"Content-type": "application/json"};


  String body = jsonEncode({"password":password,'email':email, 'name':name, 'bluetoothID':getBlueName()});
  final response = await http.post(Uri.parse(ip+"/register"),headers:headers,body: body);
  var data=jsonDecode(response.body);
  print(response.statusCode);
  if(response.statusCode==200){

      return Session(token:data["token"],name:name,email:email);

      
  }
  return Session();


}

