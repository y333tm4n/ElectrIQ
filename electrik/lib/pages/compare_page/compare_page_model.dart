import '/flutter_flow/flutter_flow_util.dart';
import 'compare_page_widget.dart' show ComparePageWidget;
import 'package:flutter/material.dart';

class ComparePageModel extends FlutterFlowModel<ComparePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
