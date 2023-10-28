// import 'dart:io';

// import 'package:flutter/material.dart';

// class HomeBody extends StatelessWidget {
//   const HomeBody({
//     super.key,
//     required this.color,
//     required this.pageName,
//   });

//   final Color? color;
//   final String? pageName;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: color,
//       child: const Center(
//         child: MyRow("HomePage"),
//       ),
//     );
//   }
// }

// class MyRow extends StatelessWidget {
//   const MyRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class Col extends StatelessWidget {
//   final String? pageName;

//   const Col(this.pageName, {super.key});

//   @override
//   Widget build(BuildContext build) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           pageName!,
//           style: const TextStyle(
//               color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),
//         ),
//         const SizedBox(
//           width: 100,
//           height: 100,
//           child: Image(
//             image: AssetImage("assets/images/qr-code.jpeg"),
//           ),
//         ),
//         Container(
//           width: double.infinity,
//           height: 300,
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             image: DecorationImage(
//               image: AssetImage(
//                 "assets/images/qr-code.jpeg",
//               ),
//               repeat: ImageRepeat.repeatX,
//               opacity: 0.5,
//             ),
//           ),
//           child: Text(
//             "Hello",
//             style: TextStyle(
//               fontSize: 50,
//               fontWeight: FontWeight.w900,
//             ),
//           ),
//         ),
//         Image(
//           image: NetworkImage(
//             "https://images.unsplash.com/photo-1682686580186-b55d2a91053c?auto=format&fit=crop&q=80&w=1975&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//           ),
//           width: 200,
//           height: 200,
//         ),
//         Image.asset(
//           "assets/images/qr-code.jpeg",
//           width: 100,
//           height: 100,
//         ),
//         Image.file(
//           File("assets/images/qr-code.jpeg"),
//           width: 100,
//           height: 100,
//         ),
//         Image.network(
//           "https://images.unsplash.com/photo-1682686580186-b55d2a91053c?auto=format&fit=crop&q=80&w=1975&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//           width: 100,
//           height: 100,
//         ),
//         const Text(
//           "Lorem Ipsum is just a simple text, Lorem Ipsum is just a simple text, Lorem Ipsum is just a simple text, Lorem Ipsum is just a simple text, Lorem Ipsum is just a simple text",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18),
//         ),
//       ],
//     );
//   }
// }
