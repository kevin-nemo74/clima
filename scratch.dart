import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String t2d = await task2();
  task3(t2d);
}

void task1() {
  String result = 'task1 data';
  print('Task 1 complete');
}

Future task2() async {
  Duration threeSeconds = Duration(seconds: 3);

  String result = 'task 2 before delayed';
  await Future.delayed(threeSeconds, () {
    result = 'task 2 after delayed';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print(task2Data);
  print('Task 3 complete');
}
