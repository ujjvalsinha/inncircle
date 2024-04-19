import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_2/feature/state_app/presentation/cubit/api_call_cubit.dart';
import 'package:interview_2/feature/state_app/presentation/cubit/api_call_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Call"),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<ApiCallCubit, ApiCallState>(
        builder: (context, state) {
          if (state is ApiDataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ApiDataLoaded) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.apiData["state"],
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  DropdownButton<String>(
                    value: _selectedCity ??
                        state.apiData["city"][0], // Initial value
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCity = newValue!;
                      });
                    },
                    items: state.apiData["city"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          } else if (state is ApiDataError) {
            return Text(state.errorMessage);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
