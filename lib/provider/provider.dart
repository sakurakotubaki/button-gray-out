// TextEditingControllerを使うためのProvider
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider は外部から変更が可能なステート（状態）を公開するプロバイダです。
// TextEditingControllerを使うためのProvider
final textProvider = StateProvider.autoDispose((ref) {
  // riverpodで使うには、('')が必要
  return TextEditingController(text: '');
});
// bool方を使うためのProvider。初期値はfalseにする
final enableProvider = StateProvider.autoDispose((ref) => false);
