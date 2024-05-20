import 'package:assignment/model/photo_state.dart';

class ConnectivityState {
  ApiStatus status;
  bool isConnected;

  ConnectivityState({required this.isConnected, required this.status});
  ConnectivityState copyWith({
    ApiStatus? status,
    bool? isConnected,
  }) {
    return ConnectivityState(
        isConnected: isConnected ?? this.isConnected,
        status: status ?? this.status);
  }
}
