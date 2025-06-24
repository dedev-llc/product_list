import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Utility class for managing shared preferences.
///
/// Provides methods to read and write simple data types to persistent storage.
class PrefUtils {
  static SharedPreferences? _prefsInstance;

  ///
  /// Asynchronously gets the instance of SharedPreferences.
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  /// Initializes the SharedPreferences instance asynchronously.
  static Future<SharedPreferences> init() async {
    _prefsInstance ??= await _instance;
    return _prefsInstance!;
  }

  /// Retrieves a string value from SharedPreferences.
  static String? getString(String key) {
    return _prefsInstance?.getString(key);
  }

  /// Saves a string value to SharedPreferences.
  static Future<bool> setString(String key, String value) async {
    final prefs = await _instance;
    return prefs.setString(key, value);
  }

  /// Saves a list of strings to SharedPreferences.
  static Future<bool> setStringList(String key, List<String> value) async {
    final prefs = await _instance;
    return prefs.setStringList(key, value);
  }

  /// Retrieves a list of strings from SharedPreferences.
  static List<String>? getStringList(String key) {
    return _prefsInstance?.getStringList(key);
  }
  /// Saves a boolean value to SharedPreferences.
  static Future<bool> setBool(String key, bool value) async {
    final prefs = await _instance;
    return prefs.setBool(key, value);
  }

  /// Retrieves a boolean value from SharedPreferences.
  static bool? getBool(String key, [bool? defValue]) {
    return _prefsInstance?.getBool(key) ?? defValue;
  }

  /// Saves an integer value to SharedPreferences.
  static Future<bool> setInt(String key, int value) async {
    final prefs = await _instance;
    return prefs.setInt(key, value);
  }

  /// Retrieves an integer value from SharedPreferences.
  static int getInt(String key, [int? defValue]) {
    return _prefsInstance?.getInt(key) ?? defValue ?? 0;
  }

  /// Clears all data from SharedPreferences.
  static Future clearPreferences() async {
    await _prefsInstance?.clear();
  }

  /// Saves a double value to SharedPreferences.
  static Future<bool> setDouble(String key, double value) async {
    final prefs = await _instance;
    return prefs.setDouble(key, value);
  }

  /// Retrieves a double value from SharedPreferences.
  static double getDouble(String key, [double? defValue]) {
    return _prefsInstance?.getDouble(key) ?? defValue ?? 0;
  }

  /// Saves a Map of data to SharedPreferences.
  static Future<void> saveData({@required Map<String, dynamic>? data}) async {
    data?.forEach((key, value) async {
      switch (value.runtimeType) {
        case String:
          await setString(key, value as String);
          return;
        case int:
          await setInt(key, value as int);
          return;
        case bool:
          await setBool(key, value as bool);
          return;
      }
    });
  }

  /// Saves a list of maps to SharedPreferences.
  static Future<bool> saveMap(String key, List<Map> value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, jsonEncode(value));
  }

  /// Retrieves a list of maps from SharedPreferences.
  static Future<List<Map<String, dynamic>>?> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    return prefs.getString(key) != null
        ? (jsonDecode(prefs.getString(key)!) as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .toList()
        : null;
  }

  /// Removes a specific key-value pair from SharedPreferences.
  ///
  /// Returns true if the removal is successful.
  static Future<bool> removeValue(String key) async {
    final prefs = await _instance;
    return prefs.remove(key);
  }
}
