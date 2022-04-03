import 'package:flutter/material.dart';

getErrorSnackbar(String msg) {
  return SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline_outlined,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Text(
            msg,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.red,
  );
}
