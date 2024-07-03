import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'switch_produto_model.dart';
export 'switch_produto_model.dart';

class SwitchProdutoWidget extends StatefulWidget {
  const SwitchProdutoWidget({
    super.key,
    this.parameter1,
    required this.parameter2,
  });

  final DocumentReference? parameter1;
  final bool? parameter2;

  @override
  State<SwitchProdutoWidget> createState() => _SwitchProdutoWidgetState();
}

class _SwitchProdutoWidgetState extends State<SwitchProdutoWidget> {
  late SwitchProdutoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchProdutoModel());

    _model.switchValue = widget.parameter2!;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _model.switchValue!,
      onChanged: (newValue) async {
        setState(() => _model.switchValue = newValue);
        if (newValue) {
          await widget.parameter1!.update(createProdutoRecordData(
            ativo: true,
          ));
        } else {
          await widget.parameter1!.update(createProdutoRecordData(
            ativo: false,
          ));
        }
      },
      activeColor: const Color(0x6E9C00FF),
    );
  }
}
