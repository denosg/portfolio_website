// more apps / experience add here ->
import 'package:portfolio_website/models/work_exp.dart';
import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/providers/text_hupu_app.dart';

List<WorkExp> worKExpList = [
  WorkExp(
      companyNameAndApp: "Monad Systems - Hupu app",
      workTime: getWorkTime(),
      linkForApp:
          'https://www.antena3.ro/actualitate/locale/primul-spital-urgenta-romania-informatii-pacienti-timp-real-apartinatori-700992.html',
      tasksIveDone: tasksIveDoneHupu,
      appImage: hupuAppImg),
];

String getWorkTime() {
  DateTime now = DateTime.now();
  DateTime july2023 = DateTime(2023, 7);

  int differenceInMonths =
      ((now.year - july2023.year) * 12) + now.month - july2023.month + 1;

  return '$differenceInMonths months';
}
