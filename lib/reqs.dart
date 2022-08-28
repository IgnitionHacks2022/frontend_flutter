import 'package:http/http.dart' as http;
import 'dart:convert';
String ip = "https://ignition.zhehaizhang.com";
class Session{
    String token;
    String name;
    String email;
    String bluetoothId;
    Session({this.token="",this.name="",this.email="",this.bluetoothId=""});
}
class GarbageItem{
    DateTime createdAt;
    String type;
    String name;
    GarbageItem({required this.createdAt,required this.type,required this.name});
    factory GarbageItem.fromJson(Map<String, dynamic> json){
        return GarbageItem(
            createdAt:DateTime.parse(json['CreatedAt']),
            type: json['Type'],
            name: json['Name']
        );
    }
}
Future<List<GarbageItem>> statistics(String token) async{
    print("hello");
    Map<String, String> headers = {"token":token};
    final response = await http.get(Uri.parse(ip+"/statistics"),headers: headers);
    print(response.body);
    print(jsonDecode(response.body)["items"][0]);
    if(response.statusCode==200){
        var data = jsonDecode(response.body);
        var items = [for(var item in data['items']) GarbageItem.fromJson(item)]; 
        print(items);
        return items;



    }
    return [];
    


}
Future<Session> login(String email,String password) async{
  Map<String, String> headers = {"Content-type": "application/json"};
  String body = jsonEncode({"password":password,'email':email});
  final response = await http.post(Uri.parse(ip+"/login"),headers:headers,body: body);

  if(response.statusCode==200){
      var data=jsonDecode(response.body);

      return Session(token:data["token"],name:data["name"],email:email,bluetoothId: data["bluetoothID"]);


      
  }
  return Session();


}

String getBlueName(){
    return "n";
}
Future<Session> register(String email,String password,String name, String blueName) async{
  Map<String, String> headers = {"Content-type": "application/json"};


  String body = jsonEncode({"password":password,'email':email, 'name':name, 'bluetoothID':blueName});
  final response = await http.post(Uri.parse(ip+"/register"),headers:headers,body: body);

  if(response.statusCode==200){
      var data=jsonDecode(response.body);

      return Session(token:data["token"],name:name,email:email,bluetoothId: blueName);

      
  }
  return Session();


}

