import 'package:assignment/api/api_service.dart';
import 'package:assignment/model/photo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit() : super(PhotoState(photoModel: [], status: ApiStatus.initial));

  Future<void> getAllPhoto() async {
    emit(state.copyWith(status: ApiStatus.loading));
    // get api
    final response = await ApiService.getPhotoApi();
    emit(state.copyWith(status: ApiStatus.success, photoModel: response));
  }
}
