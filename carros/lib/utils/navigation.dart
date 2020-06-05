import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Future push(BuildContext context, Widget page) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));


pop(BuildContext context) => Navigator.pop(context);
