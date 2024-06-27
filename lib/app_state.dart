import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _progressBar = prefs.getDouble('ff_progressBar') ?? _progressBar;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _uploadLogo = '';
  String get uploadLogo => _uploadLogo;
  set uploadLogo(String value) {
    _uploadLogo = value;
  }

  String _logoURL = '';
  String get logoURL => _logoURL;
  set logoURL(String value) {
    _logoURL = value;
  }

  Color _corSelecionada = Colors.transparent;
  Color get corSelecionada => _corSelecionada;
  set corSelecionada(Color value) {
    _corSelecionada = value;
  }

  List<String> _imgProduto = [];
  List<String> get imgProduto => _imgProduto;
  set imgProduto(List<String> value) {
    _imgProduto = value;
  }

  void addToImgProduto(String value) {
    imgProduto.add(value);
  }

  void removeFromImgProduto(String value) {
    imgProduto.remove(value);
  }

  void removeAtIndexFromImgProduto(int index) {
    imgProduto.removeAt(index);
  }

  void updateImgProdutoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imgProduto[index] = updateFn(_imgProduto[index]);
  }

  void insertAtIndexInImgProduto(int index, String value) {
    imgProduto.insert(index, value);
  }

  String _codRefCategoria = '';
  String get codRefCategoria => _codRefCategoria;
  set codRefCategoria(String value) {
    _codRefCategoria = value;
  }

  List<String> _listaImgDeletar = [];
  List<String> get listaImgDeletar => _listaImgDeletar;
  set listaImgDeletar(List<String> value) {
    _listaImgDeletar = value;
  }

  void addToListaImgDeletar(String value) {
    listaImgDeletar.add(value);
  }

  void removeFromListaImgDeletar(String value) {
    listaImgDeletar.remove(value);
  }

  void removeAtIndexFromListaImgDeletar(int index) {
    listaImgDeletar.removeAt(index);
  }

  void updateListaImgDeletarAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listaImgDeletar[index] = updateFn(_listaImgDeletar[index]);
  }

  void insertAtIndexInListaImgDeletar(int index, String value) {
    listaImgDeletar.insert(index, value);
  }

  String _imgCliente = '';
  String get imgCliente => _imgCliente;
  set imgCliente(String value) {
    _imgCliente = value;
  }

  double _progressBar = 0.7;
  double get progressBar => _progressBar;
  set progressBar(double value) {
    _progressBar = value;
    prefs.setDouble('ff_progressBar', value);
  }

  DocumentReference? _categoriaSelecionada;
  DocumentReference? get categoriaSelecionada => _categoriaSelecionada;
  set categoriaSelecionada(DocumentReference? value) {
    _categoriaSelecionada = value;
  }

  bool _ordemCrescente = false;
  bool get ordemCrescente => _ordemCrescente;
  set ordemCrescente(bool value) {
    _ordemCrescente = value;
  }

  List<String> _listaImgProdutoCarrossel = [];
  List<String> get listaImgProdutoCarrossel => _listaImgProdutoCarrossel;
  set listaImgProdutoCarrossel(List<String> value) {
    _listaImgProdutoCarrossel = value;
  }

  void addToListaImgProdutoCarrossel(String value) {
    listaImgProdutoCarrossel.add(value);
  }

  void removeFromListaImgProdutoCarrossel(String value) {
    listaImgProdutoCarrossel.remove(value);
  }

  void removeAtIndexFromListaImgProdutoCarrossel(int index) {
    listaImgProdutoCarrossel.removeAt(index);
  }

  void updateListaImgProdutoCarrosselAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listaImgProdutoCarrossel[index] =
        updateFn(_listaImgProdutoCarrossel[index]);
  }

  void insertAtIndexInListaImgProdutoCarrossel(int index, String value) {
    listaImgProdutoCarrossel.insert(index, value);
  }

  String _imgProdutoSelecionada = '';
  String get imgProdutoSelecionada => _imgProdutoSelecionada;
  set imgProdutoSelecionada(String value) {
    _imgProdutoSelecionada = value;
  }

  int _quantidadeProdutosCarrinho = 0;
  int get quantidadeProdutosCarrinho => _quantidadeProdutosCarrinho;
  set quantidadeProdutosCarrinho(int value) {
    _quantidadeProdutosCarrinho = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
