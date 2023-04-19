import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  // Singleton Setup
  // PrefUtils._();
  // static PrefUtils? _instanec;
  // static PrefUtils get instance => _instanec ??= PrefUtils._();

  // Instnaces
  SharedPreferences? _mPref;

  // Defined Keys
  final keySample = "key_sample";

  // Must be called in app launch
  Future<void> initialize() async {
    _mPref = await SharedPreferences.getInstance();
  }

  SharedPreferences get mPref {
    if (_mPref == null) throw Exception("initialize must be called");
    
    return _mPref!;
  }

  String get sample => mPref.getString("sample") ?? "";
  set sample(String value) => mPref.setString("sample", value);

  void clear() => mPref.clear();
}
