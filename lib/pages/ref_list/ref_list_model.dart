import '/flutter_flow/flutter_flow_util.dart';
import 'ref_list_widget.dart' show RefListWidget;
import 'package:flutter/material.dart';

class RefListModel extends FlutterFlowModel<RefListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
