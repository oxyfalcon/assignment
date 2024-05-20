import 'dart:async';
import 'dart:convert';

import 'package:assignment/Bloc/connectivity_cubit.dart';
import 'package:assignment/Bloc/photo_cubit.dart';
import 'package:assignment/model/photo_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<PhotoModel>> getPhotoApi() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    List<dynamic> jsonPhoto = jsonDecode(response.body);
    List<PhotoModel> result = [];
    for (var photo in jsonPhoto) {
      result.add(PhotoModel.fromJson(photo));
    }
    return result;
  }
}

class ConnectivityStatus {
  StreamController<bool> isConnectedController = StreamController.broadcast();
  Connectivity connectivity = Connectivity();
  bool value = false;
  Future<void> initialize(BuildContext context) async {
    connectivity.onConnectivityChanged.listen((result) {
      if (!(result == ConnectivityResult.none)) {
        value = true;
        context.read<PhotoCubit>().getAllPhoto();
      } else {
        value = false;
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(value ? "Connected" : "Disconnected")));
      }
    });
  }

  void dispose() {
    isConnectedController.close();
  }
}
