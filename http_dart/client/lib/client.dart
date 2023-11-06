import 'dart:convert';

import 'package:http/http.dart';

Future<void> sendData(String url, Map data) async {
  Response res = await post(Uri.parse(url), body: data, headers: {
    "authorization":
        "Bareer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuZXdVc2VyIjp7ImlkIjoiMSIsInVzZXJuYW1lIjoiYWhtZWRBbGFhIiwiZmlyc3RfbmFtZSI6ImFobWVkIiwibGFzdF9uYW1lIjoiYWxhYSIsImVtYWlsIjoiYWhtZWRhbGFhNTQxNTFAZ21haWwuY29tIn0sImlhdCI6MTY5OTE3NzI4NSwiZXhwIjoxNzAwOTc3Mjg1fQ.dmC4mXoo-8TjfklzRMGSid2FHyjX5e06zZfgYqIZyu4",
    "x-editor-on": "editor"
  });
  print(res.statusCode);
  print(res.body);
}

Future<void> getData() async {
  Uri url = Uri.parse("http://localhost:3000/products");
  Response res = await get(url);
  print(res.body);
}
