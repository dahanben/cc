import 'package:flutter/material.dart';
import '../widgets/custom_popup.dart';
import '../widgets/question_widget.dart';
import '../widgets/answer_option_widget.dart';
import '../services/api_service.dart';

class CcScreen extends StatefulWidget {
  @override
  _CcScreenState createState() => _CcScreenState();
}

class _CcScreenState extends State<CcScreen> {
  late String question = '';
  late List<String> answers = [];
  late int correctAnswerIndex;
  late int indexTapped;

  @override
  void initState() {
    super.initState();
    fetchQuestionAndAnswers();
  }

  Future<void> fetchQuestionAndAnswers() async {
    try {
      final responseData = await ApiService.fetchCcQuestion();
      setState(() {
        indexTapped = -1;
        question = responseData['question'];
        answers = List<String>.from(responseData['answers']);
        correctAnswerIndex = responseData['correct_answer'];
      });
    } catch (e) {
      // Handle error if API request fails
      print('Failed to fetch question and answers. Error: $e');
    }
  }

  bool isAnswerCorrect(int answerIndex) {
    return correctAnswerIndex != null && answerIndex == correctAnswerIndex;
  }

  void handleAnswerSelection(int answerIndex) {
    setState(() {
      indexTapped = answerIndex;
    });

    if (isAnswerCorrect(answerIndex)) {
      // Correct answer selected
      showResultDialog(
        headline: 'Success',
        primaryButtonText: 'Next Question',
        secondaryButtonText: 'Back to Home',
        onPrimaryButtonPressed: () {
          Navigator.pop(context); // Close the pop-up
          fetchQuestionAndAnswers(); // Fetch the next question and answers    
        },
        onSecondaryButtonPressed: () {
          Navigator.pop(context); // Close the pop-up
          Navigator.pop(context); // Go back to the previous screen
        },
      );
    } else {
      // Incorrect answer selected
      showResultDialog(
        headline: 'Oops.. Try again!',
        primaryButtonText: 'Try Again',
        secondaryButtonText: 'Back to Home',
        onPrimaryButtonPressed: () {
          Navigator.pop(context); // Close the pop-up
          fetchQuestionAndAnswers(); // Fetch the next question and answers          
        },
        onSecondaryButtonPressed: () {
          Navigator.pop(context); // Close the pop-up
          Navigator.pop(context); // Go back to the previous screen
        },
      );
    }
  }

  void showResultDialog({
    required String headline,
    required String primaryButtonText,
    required String secondaryButtonText,
    required VoidCallback onPrimaryButtonPressed,
    required VoidCallback onSecondaryButtonPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) => CustomPopup(
        headline: headline,
        primaryButtonText: primaryButtonText,
        secondaryButtonText: secondaryButtonText,
        onPrimaryButtonPressed: onPrimaryButtonPressed,
        onSecondaryButtonPressed: onSecondaryButtonPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CC Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            QuestionWidget(questionText: question),
            const SizedBox(height: 16),
            const SizedBox(height: 8),
            Column(
              children: answers
                  .asMap()
                  .entries
                  .map(
                    (entry) => AnswerOptionWidget(
                      answerText: entry.value,
                      isSelected: indexTapped == entry.key,
                      isCorrect: isAnswerCorrect(entry.key),
                      onPressed: () => handleAnswerSelection(entry.key),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
