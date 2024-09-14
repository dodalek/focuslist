import '/flutter_flow/flutter_flow_util.dart';
import 'comp_nova_tarefa_widget.dart' show CompNovaTarefaWidget;
import 'package:flutter/material.dart';

class CompNovaTarefaModel extends FlutterFlowModel<CompNovaTarefaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtTarefa widget.
  FocusNode? txtTarefaFocusNode;
  TextEditingController? txtTarefaTextController;
  String? Function(BuildContext, String?)? txtTarefaTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtTarefaFocusNode?.dispose();
    txtTarefaTextController?.dispose();
  }
}
