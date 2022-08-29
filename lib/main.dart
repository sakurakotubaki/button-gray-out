import 'package:button_glay_out/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // コードの書き方が変わったのか、[(.state).state]と外と中に.stateを
    // 書かないといけない!
    // 2回目の.stateは、使う時に呼び出して使う。
    // controllerProviderは大丈夫みたい?
    final controllerProvider = ref.watch(textProvider.state);
    // bool型のProviderを呼び出す!
    final boolProvider = ref.watch(enableProvider.state);

    return Scaffold(
      appBar: AppBar(title: const Text('ButtonGrayOut')),
      body: Center(
        child: Column(
          children: [
            TextField(
              // ここで、finalに格納した、Providerを使う!
              controller: controllerProvider.state,
              // onChangedを使わないと、if文の判定ができない!
              onChanged: (data) {
                if (controllerProvider.state.text.isNotEmpty) {
                  boolProvider.state = false;
                } else {
                  boolProvider.state = true;
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'テキストを入力してください!',
              ),
            ),
            const SizedBox(height: 20),
            // 三項演算子でボタンをtrueなら、グレーアウト
            // falseなら、ボタンを押せるようにする。
            // 文字が入力されれば、ボタンは押せるようになる!
            ElevatedButton(
              onPressed: boolProvider.state
                  ? null
                  : () {
                      print(controllerProvider.state.text);
                    },
              child: Text('送信'),
            ),
          ],
        ),
      ),
    );
  }
}
