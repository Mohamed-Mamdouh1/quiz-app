import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({Key? key, required this.summaryData}) : super(key: key);
  List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
            children: summaryData.map((data) {

          return Row(
            children: [
              CircleAvatar(
                backgroundColor: data["user_answer"] == data["correct_answer"]
                    ? Colors.blue
                    : Colors.redAccent,
                child: Text(((data["question_index"] as int) + 1).toString()),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(data["question"] as String,style: TextStyle(fontSize: 20,color: Colors.white),),
                    SizedBox(
                      height: 5,
                    ),
                    Text(data["user_answer"] as String,style: TextStyle(
                    color: data["user_answer"] == data["correct_answer"]
                    ? Colors.blue
                        : Colors.redAccent)),
                    Text(data["correct_answer"] as String,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
