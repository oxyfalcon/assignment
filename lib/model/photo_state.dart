import 'package:assignment/model/photo_model.dart';

class PhotoState {
  ApiStatus status;
  List<PhotoModel> photoModel;
  String? error;

  PhotoState({required this.photoModel, required this.status, this.error});

  PhotoState copyWith({ApiStatus? status, List<PhotoModel>? photoModel}) =>
      PhotoState(
          photoModel: photoModel ?? this.photoModel,
          status: status ?? this.status);
}

enum ApiStatus { initial, success, error, loading }
