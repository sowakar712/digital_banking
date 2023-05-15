import 'package:shared_preferences/shared_preferences.dart';

class TierMoneyPreference{
  static final TierMoneyPreference _moneyPreference=TierMoneyPreference._internal();
  TierMoneyPreference._internal();
  factory TierMoneyPreference(){
    return _moneyPreference;
  }
  setString(String key,value)async{
    final perfs=await SharedPreferences.getInstance();
    if(value !=null && value.isNotEmpty){
      perfs.setString(key,value);
    }
  }
  Future<String>getString(String key)async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.getString(key)??"";
  }
}