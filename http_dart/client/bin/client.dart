import 'package:client/client.dart' as client;

void main(List<String> args) {
  // client.getData();
  // client.sendData();
  client.sendData("http://localhost:3000/products/add", {
    "price": "1499.00",
    "name": "IPhone 15 Pro Max",
    "category": "Smartphones",
  });
}
