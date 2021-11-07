import 'package:flutter/material.dart';
import 'query.dart';

class AnswerQuery extends StatefulWidget {
  const AnswerQuery({Key? key}) : super(key: key);

  @override
  _AnswerQueryState createState() => _AnswerQueryState();
}

class _AnswerQueryState extends State<AnswerQuery> {
  List<Query> query = [
    Query(law: 'QUERY...', text: 'criminal law'),
    Query(law: 'QUERY...', text: 'cybercrime law'),
    Query(law: 'QUERY...', text: 'IT law'),
    Query(law: 'QUERY...', text: 'business law'),
    // Query(law: 'QUERY...', text: 'marriage law related'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
