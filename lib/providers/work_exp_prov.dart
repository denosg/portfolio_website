// more apps / experience add here ->
import 'package:portfolio_website/models/work_exp.dart';
import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/providers/text_hupu_app.dart';

DateTime july2023 = DateTime(2023, 7);

List<WorkExp> worKExpList = [
  WorkExp(
      companyNameAndApp: "Monad Systems - Apartinator.ro",
      workTime: getWorkTime(july2023),
      linkForApp: 'https://apartinator.ro/',
      tasksIveDone: tasksIveDoneHupu,
      appImage: hupuAppImg),
];

String getWorkTime(DateTime startTime) {
  DateTime now = DateTime.now();
  int totalMonths =
      ((now.year - startTime.year) * 12) + now.month - startTime.month + 1;

  int years = totalMonths ~/ 12;
  int months = totalMonths % 12;

  String yearPart = years > 0 ? '$years year${years > 1 ? 's' : ''}' : '';
  String monthPart = months > 0 ? '$months month${months > 1 ? 's' : ''}' : '';

  if (yearPart.isNotEmpty && monthPart.isNotEmpty) {
    return '$yearPart and $monthPart';
  } else if (yearPart.isNotEmpty) {
    return yearPart;
  } else {
    return monthPart;
  }
}
