import 'package:flutter/material.dart';
import 'package:flutter_hive/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final box = Hive.box(myBox);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder<Box>(
            valueListenable: box.listenable(),
            builder: (context, box, widget) {
              print(box.values.toList());
              return Column(
                children: box.values
                    .map(
                      (e) => Text(
                        e.toString(),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              print(
                'keys : ${box.keys.toList()}',
              );
              print(
                'values: ${box.values.toList()}',
              );
            },
            child: const Text('박스 프린트하기!'),
          ),
          ElevatedButton(
            onPressed: () {
              // autoIncrease로 넣기
              box.add('테스트1');
            },
            child: const Text('데이터 Add'),
          ),
          ElevatedButton(
            onPressed: () {
              // 데이터를 생성하거나
              // 업데이트할 때 put 사용
              box.put(1000, '새로운 데이터!');
            },
            child: const Text('데이터 Put'),
          ),
          ElevatedButton(
            onPressed: () {
              print(
                // 특정값 가져오기
                box.get('작업현장 id'),
              );
            },
            child: const Text('특정값 가져오기'),
          ),
          ElevatedButton(
            onPressed: () {
              // 몇 번째 값 가져오기
              print(
                box.getAt(3),
              );
            },
            child: const Text('3번째 값 가져오기'),
          ),
          ElevatedButton(
            onPressed: () {
              // 몇 번째 값 가져오기
              print(
                box.deleteAt(1),
              );
            },
            child: const Text('삭제하기'),
          ),
        ],
      ),
    );
  }
}
