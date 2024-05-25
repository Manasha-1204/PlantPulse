import 'package:flutter/foundation.dart';

class UserInfo with ChangeNotifier {
  String _name;
  String _location;
  String _crop;

  UserInfo({String name = '', String location = '', String crop = ''})
      : _name = name,
        _location = location,
        _crop = crop;

  // Getters
  String get name => _name;
  String get location => _location;
  String get crop => _crop;

  // Setters
  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setLocation(String location) {
    _location = location;
    notifyListeners();
  }

  void setCrop(String crop) {
    _crop = crop;
    notifyListeners();
  }
}