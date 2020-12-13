import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:templeteproject/core/base/state/base_state.dart';
import 'package:templeteproject/core/base/view/base_view.dart';
import 'package:templeteproject/view/authenticate/test/viewmodel/test_viewmodel.dart';

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) => Text("asd"),
    );
  }

  Widget get scaffoldBody => Scaffold(
        floatingActionButton: floatingActionButton,
        body: Column(
          children: [textNumber],
        ),
      );

  FloatingActionButton get floatingActionButton {
    return FloatingActionButton(
      onPressed: () {
        viewModel.incrementCount();
      },
    );
  }

  Widget get textNumber {
    return Observer(
        builder: (context) => Text(
              viewModel.number.toString(),
            ));
  }
}
