

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnectionService
{


  Future<bool> checkInternet()async{
    bool result = await InternetConnectionCheckerPlus().hasConnection;
    if(result == true) {
      print('YAY! Free cute dog pics!');
    } else {
      print('No internet :');
    }

    return result;
  }
}