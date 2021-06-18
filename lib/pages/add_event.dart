import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'package:test_app/model/event.dart';
import 'package:test_app/model/colors.dart';

class AddEvent extends StatefulWidget {
  final DateTime selectedDate;// ここの下にconst AddEvent()を追加する

  const AddEvent({Key? key, this.selectedDate}) : super(key: key);
//  final AppEvent event;
//
//  const AddEventPage({Key key, this.selectedDate, this.event})
//      : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
    final _formKey = GlobalKey<FormBuilderState>(); // importを追加して参照する

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
//          title: Text('Add Event'),
//          backgroundColor: AppColors.primaryColor,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton( // 右上に保存ボタンの作成
                onPressed: () async {
                  //save
//                  _formKey.currentState.save();
//                  final data =
//                  Map<String, dynamic>.from(_formKey.currentState.value);
//                  data["date"] =
//                      (data["date"] as DateTime).millisecondsSinceEpoch;
//                  if (widget.event != null) {
//                    //update
//                    await eventDBS.updateData(widget.event.id, data);
//                  } else {
//                    //create
//                    await eventDBS.create({
//                      ...data,
//                      "user_id": context.read(userRepoProvider).user.id,
//                    });
//                  }
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
//            //add event form
            FormBuilder(
//              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField( // タイトルフィールド表示
                    name: "title",
//                    initialValue: widget.event?.title,
                    decoration: InputDecoration( // タイトルフィールドのデコレーション
                        hintText: "Add Title", // 入力ヒント
                        border: InputBorder.none, // 入力ボーダーなしに設定
                        contentPadding: const EdgeInsets.only(left: 48.0),
                    ),
                  ),
                  Divider(), // 仕切り
                  FormBuilderTextField( // 説明フォーム表示
                    name: "description",
                    //initialValue: widget.event?.description,
                    minLines: 1, // 最小1行
                    maxLines: 5, // 最大5行
                    decoration: InputDecoration( // 説明フォーム表示のデコレーション
                        hintText: "Add Details", // 入力ヒント
                        border: InputBorder.none, // 入力ボーダーなしに設定
                        prefixIcon: Icon(Icons.short_text), // フォーム左にアイコンを追加
                    ),
                  ),
                  Divider(), // 仕切り
                  FormBuilderSwitch( // スイッチ名を追加
                    name: "public",
                    initialValue: false, // 初期値をfalse
                    //initialValue: widget.event?.public ?? false,
                    title: Text("Public"),
                    controlAffinity: ListTileControlAffinity.leading, // list制御親和性
                    decoration: InputDecoration(
                      border: InputBorder.none, // 入力ボーダーなしに設定
                    ),
                  ),
                  Divider(), // 仕切り
                  FormBuilderDateTimePicker( // 日付選択フィールド
                    name: "date",
//                    initialValue: widget.selectedDate ??
//                        widget.event?.date ??
//                        DateTime.now(),
                    initialDate: DateTime.now(), // 初期値は現在日時に設定
                    fieldHintText: "Add Date", // 入力ヒント
                    initialDatePickerMode: DatePickerMode.day,
                    inputType: InputType.date, // 入力タイプを日付形式に指定
                    format: DateFormat('EEEE, dd MMMM, yyyy'), // 日付入力フォーマット
                    decoration: InputDecoration( // 日付選択フィールドのデコレーション
                      border: InputBorder.none, // 入力ボーダーなしに設定
                      prefixIcon: Icon(Icons.calendar_today_sharp), // フォーム左にアイコンを追加
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      );
    }
}
