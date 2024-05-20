import 'package:assignment/Bloc/photo_cubit.dart';
import 'package:assignment/api/api_service.dart';
import 'package:assignment/model/photo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(useMaterial3: true),
        home: const AlbumScreen(),
      ),
    );
  }
}

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  ConnectivityStatus status = ConnectivityStatus();
  @override
  void initState() {
    context.read<PhotoCubit>().getAllPhoto();
    status.initialize(context);
    super.initState();
  }

  @override
  void dispose() {
    status.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment"),
        centerTitle: true,
      ),
      body: BlocBuilder<PhotoCubit, PhotoState>(builder: (context, state) {
        if (state.status == ApiStatus.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state.status == ApiStatus.success) {
          return ListView.builder(
              itemCount: state.photoModel.length,
              itemBuilder: (context, index) => ListTile(
                  title: Text(state.photoModel[index].title),
                  subtitle: Text(
                    state.photoModel[index].url,
                  )));
        } else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      }),
    );
  }
}
