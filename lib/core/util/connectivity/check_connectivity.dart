// import 'package:connectivity/connectivity.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';
//
// class ConnectivityCheck{
//   Future<bool> isInternet() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       print(
//           "connected to a mobile network, make sure there is actually a net connection");
//       if (await DataConnectionChecker().hasConnection) {
//         print("Mobile data detected & internet connection confirmed.");
//         return true;
//       } else {
//         print("Mobile data detected but no internet connection found.");
//         return false;
//       }
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//       print(
//           "connected to a WIFI network, make sure there is actually a net connection.");
//       if (await DataConnectionChecker().hasConnection) {
//         print("Wifi detected & internet connection confirmed.");
//         return true;
//       } else {
//         print("Wifi detected but no internet connection found.");
//         return false;
//       }
//     } else {
//       print(
//           "Neither mobile data or WIFI detected, not internet connection found.");
//       return false;
//     }
//   }
// }