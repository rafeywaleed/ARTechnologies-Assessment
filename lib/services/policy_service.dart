// import 'dart:convert';
import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/policy_model.dart';

class JsonPolicyService {
  Future<List<Policy>> loadPolicies() async {
    try {
      final String response =
          await rootBundle.loadString('assets/policies.json');
      final List<dynamic> data = await json.decode(response);
      return data.map((json) => Policy.fromJson(json)).toList();
    } catch (e) {
      print("Error loading JSON: $e");
      throw Exception('Failed to load policies');
    }
  }
}
