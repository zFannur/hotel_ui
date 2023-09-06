import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test/presentation/bloc/hotel_bloc/hotel_bloc.dart';

class UnknownError extends StatelessWidget {
  const UnknownError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.thumb_down_alt,
            color: Colors.red,
            size: 250,
          ),
          Text(
            "Data Download Error",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "An unknown error has ocurred",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ServerError extends StatelessWidget {
  final String message;
  final void Function()? reload;

  const ServerError({
    Key? key,
    required this.message, required this.reload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.thumb_down_alt,
            color: Colors.red,
            size: 250,
          ),
          Flexible(
            child: Text(
              message,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: reload,
            child: Text('reload'),
          ),
        ],
      ),
    );
  }
}
