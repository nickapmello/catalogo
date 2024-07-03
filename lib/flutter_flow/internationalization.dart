import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id', 'ms'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? idText = '',
    String? msText = '',
  }) =>
      [enText, idText, msText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomeMinhaLoja
  {
    '3bi54x5g': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'nnv46x35': {
      'en': 'Abaixo está um resumo da sua atividade.',
      'id': 'Di bawah ini adalah ringkasan aktivitas tim Anda.',
      'ms': 'Di bawah ialah ringkasan aktiviti pasukan anda.',
    },
    '0kjlvd4s': {
      'en': 'Total de vendas',
      'id': 'Kontrak Kedaluwarsa',
      'ms': 'Kontrak Tamat',
    },
    'jqevo63s': {
      'en': 'Clientes',
      'id': 'pelanggan baru',
      'ms': 'pelanggan baru',
    },
    '8vot9bzj': {
      'en': 'Vendas Concluídas',
      'id': 'Kontrak Baru',
      'ms': 'Kontrak Baru',
    },
    'saxskj92': {
      'en': 'Produtos no Estoque',
      'id': 'Kontrak Kedaluwarsa',
      'ms': 'Kontrak Tamat',
    },
    'jj8x8jf6': {
      'en': 'Meta Mensal',
      'id': '',
      'ms': '',
    },
    'tq3zxoa8': {
      'en': 'Produtos mais vendidos',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'coeikc38': {
      'en': 'Produto',
      'id': 'Nama anggota',
      'ms': 'Nama ahli',
    },
    'laklby7y': {
      'en': 'Categoria',
      'id': 'Surel',
      'ms': 'E-mel',
    },
    'ncfb1hjy': {
      'en': 'Pedidos',
      'id': 'Aktif Terakhir',
      'ms': 'Aktif Terakhir',
    },
    'fcc7ki4c': {
      'en': 'Total',
      'id': 'Status',
      'ms': 'Status',
    },
    '7v4tax3p': {
      'en': 'Pedidos recentes',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'y24lcr13': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'xdxbdj20': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Clientes
  {
    'hr8lszri': {
      'en': 'Clientes',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'g6xv2y7w': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    '6bal8rpy': {
      'en': 'Usuarios',
      'id': '',
      'ms': '',
    },
    '8z4p9k6y': {
      'en': 'Procure por nome',
      'id': '',
      'ms': '',
    },
    'j24z5knj': {
      'en': 'Ativo',
      'id': '',
      'ms': '',
    },
    'owftmo29': {
      'en': 'Inativo',
      'id': '',
      'ms': '',
    },
    '9icy69ru': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'n5whnflz': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'fcyoodds': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '3ourv2w9': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Pedidos
  {
    'smh1o93d': {
      'en': 'Pedidos',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'vse7ki9r': {
      'en': 'Pendente',
      'id': '',
      'ms': '',
    },
    'jsi5lu14': {
      'en': 'Pago',
      'id': '',
      'ms': '',
    },
    'zjqkropi': {
      'en': 'Cancelado',
      'id': '',
      'ms': '',
    },
    'dlt46loo': {
      'en': 'Lista de pedidos',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'gfyxy24w': {
      'en': 'Pendentes',
      'id': '',
      'ms': '',
    },
    'un1h45ia': {
      'en': 'Pagos',
      'id': '',
      'ms': '',
    },
    'n5n86goz': {
      'en': 'Cancelados',
      'id': '',
      'ms': '',
    },
    'j08eiorc': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Perfil
  {
    'qrxn5crt': {
      'en': 'Meu Perfil',
      'id': 'Profil saya',
      'ms': 'Profil saya',
    },
    'fyxsf6vn': {
      'en': 'Configurações da conta',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    'h43llaan': {
      'en': 'Trocar Senha',
      'id': 'Ganti kata sandi',
      'ms': 'Tukar kata laluan',
    },
    'b1lw0hfu': {
      'en': 'Editar Perfil',
      'id': 'Sunting profil',
      'ms': 'Sunting profil',
    },
    'abqf147c': {
      'en': 'Sair',
      'id': 'Keluar',
      'ms': 'Log keluar',
    },
    'o3dp9tss': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // detalhesPedido
  {
    'f1etpkd2': {
      'en': 'Cancelar pedido',
      'id': '',
      'ms': '',
    },
    'r29j9z9j': {
      'en': 'Concluir venda',
      'id': '',
      'ms': '',
    },
    '8pephan5': {
      'en': 'Pedido realizado:',
      'id': '',
      'ms': '',
    },
    'zguq7m86': {
      'en': 'Cliente',
      'id': '',
      'ms': '',
    },
    '564b0frh': {
      'en': 'Não informado',
      'id': '',
      'ms': '',
    },
    'c0s3jdsy': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // Produtos
  {
    '8jlklje5': {
      'en': 'Produtos',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    '1n2tx6c6': {
      'en': 'Produto',
      'id': '',
      'ms': '',
    },
    'fh1np6vx': {
      'en': 'Procurar produto...',
      'id': '',
      'ms': '',
    },
    '5mtplc2u': {
      'en': 'Produto',
      'id': 'Nama anggota',
      'ms': 'Nama ahli',
    },
    'xsqhz5g4': {
      'en': 'Categoria',
      'id': 'Surel',
      'ms': 'E-mel',
    },
    'xkijgi68': {
      'en': 'Preço',
      'id': 'Aktif Terakhir',
      'ms': 'Aktif Terakhir',
    },
    'dtsi2m5j': {
      'en': 'Catálogo',
      'id': 'Tanggal Diciptakan',
      'ms': 'Tarikh Dibuat',
    },
    'qriboqj2': {
      'en': 'Ação',
      'id': 'Status',
      'ms': 'Status',
    },
    'ym579y79': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'smtxdnbn': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // MinhaLoja
  {
    '8r2s59bz': {
      'en': 'Ver minha loja',
      'id': '',
      'ms': '',
    },
    '6cuhlzxo': {
      'en': 'Cadastrada em',
      'id': '',
      'ms': '',
    },
    '6opuuucv': {
      'en': ' ',
      'id': '',
      'ms': '',
    },
    'eug3rw4z': {
      'en': 'Publicação do Catálogo Virtual',
      'id': '',
      'ms': '',
    },
    'srr2ve7g': {
      'en': 'URL',
      'id': '',
      'ms': '',
    },
    'p0ps7pxe': {
      'en': 'URL',
      'id': '',
      'ms': '',
    },
    'mky2d7bz': {
      'en': 'Cor principal para o seu catálogo',
      'id': '',
      'ms': '',
    },
    'jraz2l6y': {
      'en': 'Salvar',
      'id': '',
      'ms': '',
    },
    'q7svnhr5': {
      'en': 'Logo da loja',
      'id': '',
      'ms': '',
    },
    'img6qj93': {
      'en': 'Carregue sua logo',
      'id': '',
      'ms': '',
    },
    '95pi8sn8': {
      'en': 'Suporta PNG, JPG e JPEG',
      'id': '',
      'ms': '',
    },
    '7w51gon9': {
      'en': 'Carregar imagem',
      'id': '',
      'ms': '',
    },
    'nhrcxur4': {
      'en': 'Salvar',
      'id': '',
      'ms': '',
    },
    'koysivw5': {
      'en': 'Sobre a loja',
      'id': '',
      'ms': '',
    },
    'h7bbnpmv': {
      'en': 'CNPJ',
      'id': '',
      'ms': '',
    },
    'm145kg12': {
      'en': 'CNPJ (opcional)',
      'id': '',
      'ms': '',
    },
    'ke1h1c1o': {
      'en': 'Nome da Loja',
      'id': '',
      'ms': '',
    },
    '0zqfawwp': {
      'en': 'Nome da loja',
      'id': '',
      'ms': '',
    },
    'zjgq4247': {
      'en': 'Descrição da Loja',
      'id': '',
      'ms': '',
    },
    'i2xuwyo5': {
      'en': 'Descrição da sua loja',
      'id': '',
      'ms': '',
    },
    'zps53z60': {
      'en': 'Salvar',
      'id': '',
      'ms': '',
    },
    '21ep7l3l': {
      'en': 'Endereço',
      'id': '',
      'ms': '',
    },
    '8cu17bzv': {
      'en': 'Rua',
      'id': '',
      'ms': '',
    },
    '33rw6gji': {
      'en': 'Rua',
      'id': '',
      'ms': '',
    },
    'v888vnq1': {
      'en': 'Nº',
      'id': '',
      'ms': '',
    },
    '90ycsihp': {
      'en': 'Nº',
      'id': '',
      'ms': '',
    },
    '4dzf4u4f': {
      'en': 'Bairro',
      'id': '',
      'ms': '',
    },
    'rdnn4szh': {
      'en': 'Bairro',
      'id': '',
      'ms': '',
    },
    'uzv60w7y': {
      'en': 'Cidade',
      'id': '',
      'ms': '',
    },
    'jx9yt9ej': {
      'en': 'Cidade',
      'id': '',
      'ms': '',
    },
    '71e40lb5': {
      'en': 'Estado',
      'id': '',
      'ms': '',
    },
    'duoq028k': {
      'en': 'Estado',
      'id': '',
      'ms': '',
    },
    'zk0mg1ic': {
      'en': 'Salvar',
      'id': '',
      'ms': '',
    },
    'bey2i2k4': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    '6da24ddj': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'enjqvxqe': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'lwbxlmcb': {
      'en': 'Preencha o campo corretamente',
      'id': '',
      'ms': '',
    },
    '2xsbjcpc': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '2dwi6hld': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'jwdi09in': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'db0bnv4j': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'tqvx0df8': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'o75wf3lb': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    '1398k50y': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'h3g31uuv': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'k8fmevp9': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'koykh9rl': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'lf8jvqri': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'saa2e83a': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    '4kttfgqa': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'pqek85cu': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'mnhfjn2q': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'omzf1h3h': {
      'en': ' ',
      'id': '',
      'ms': '',
    },
    '15agznx5': {
      'en': 'Contato',
      'id': '',
      'ms': '',
    },
    'clmm6uvt': {
      'en': 'Telefone',
      'id': '',
      'ms': '',
    },
    '6cci5i54': {
      'en': 'Telefone',
      'id': '',
      'ms': '',
    },
    'matf8t1q': {
      'en': 'Instagram',
      'id': '',
      'ms': '',
    },
    'so1r7gjn': {
      'en': 'Instagram',
      'id': '',
      'ms': '',
    },
    'efny2fod': {
      'en': 'E-mail de contato',
      'id': '',
      'ms': '',
    },
    'hb0ohoi8': {
      'en': 'E-mail de contato',
      'id': '',
      'ms': '',
    },
    '9uwr3qo0': {
      'en': 'Salvar',
      'id': '',
      'ms': '',
    },
    'kmxys3h1': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'vd8sw68s': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'jqjee8xj': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'prhpwt88': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'i1kshy7p': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'vx571puh': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '99t25oid': {
      'en': ' ',
      'id': '',
      'ms': '',
    },
    '2sxi96db': {
      'en': 'Dados do responsável',
      'id': '',
      'ms': '',
    },
    '1idv6zv6': {
      'en': 'Nome completo',
      'id': '',
      'ms': '',
    },
    'oj5iql3y': {
      'en': 'Nome completo',
      'id': '',
      'ms': '',
    },
    'laf8twci': {
      'en': 'CPF',
      'id': '',
      'ms': '',
    },
    'gobfjhxw': {
      'en': 'CPF',
      'id': '',
      'ms': '',
    },
    '1hxg1nef': {
      'en': 'Salvar',
      'id': '',
      'ms': '',
    },
    '6kexfje8': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'ithmrha3': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '2ljqettc': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    '41hmqpwe': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'hfcplb9j': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // detalhesCliente
  {
    '88daxrxu': {
      'en': 'Imagem do cliente',
      'id': '',
      'ms': '',
    },
    'yej6ndfm': {
      'en': 'Dados básicos',
      'id': '',
      'ms': '',
    },
    'tx2h7ng4': {
      'en': 'Observações do Cliente',
      'id': '',
      'ms': '',
    },
    'yzeoze3e': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3z1k8rcj': {
      'en': 'Contato',
      'id': '',
      'ms': '',
    },
    '9f2gjw47': {
      'en': 'Endereço',
      'id': '',
      'ms': '',
    },
    '3qvldbi8': {
      'en': 'Salvar informações',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
    'yjx4nc8m': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // catalogoVirtual
  {
    'pm55zfap': {
      'en': 'Categorias',
      'id': '',
      'ms': '',
    },
    'scjmwe5j': {
      'en': 'Todos',
      'id': '',
      'ms': '',
    },
    'jekqpj95': {
      'en': 'Shop',
      'id': '',
      'ms': '',
    },
  },
  // detalhesProdutoCatalogo
  {
    'r9ymihvv': {
      'en': 'Descrição',
      'id': '',
      'ms': '',
    },
    'lx00m5y4': {
      'en': 'Adicionar',
      'id': '',
      'ms': '',
    },
    'dtpkw5pi': {
      'en': 'Pedir por Whatsapp',
      'id': '',
      'ms': '',
    },
    'sskyf93v': {
      'en': 'Adicionar',
      'id': '',
      'ms': '',
    },
    'qsksituu': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // Checkout
  {
    'chbjmu1w': {
      'en': 'Meu carrinho',
      'id': '',
      'ms': '',
    },
    '0nniaq79': {
      'en': 'Abaixo está a lista de itens em seu carrinho.',
      'id': '',
      'ms': '',
    },
    'ma2ny391': {
      'en': 'Remover',
      'id': '',
      'ms': '',
    },
    'vsih9vxs': {
      'en': 'Resumo do pedido',
      'id': '',
      'ms': '',
    },
    't3f18xoo': {
      'en': 'Abaixo está os valores dos itens.',
      'id': '',
      'ms': '',
    },
    'lprmform': {
      'en': 'Itens',
      'id': '',
      'ms': '',
    },
    'ch7egu6o': {
      'en': 'Total',
      'id': '',
      'ms': '',
    },
    'vbwaedaj': {
      'en': 'Realizar pedido',
      'id': '',
      'ms': '',
    },
    'hambvnsw': {
      'en': 'Continuar comprando',
      'id': '',
      'ms': '',
    },
    'bhdhqnla': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // loginPage
  {
    '52ylkulr': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // cadastroUsuario
  {
    '7xrjx7v7': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // MeusPedidos
  {
    'iovtyqhx': {
      'en': 'Pedidos',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'p3lxr0is': {
      'en': 'Pendente',
      'id': '',
      'ms': '',
    },
    '5dvnmn0t': {
      'en': 'Pago',
      'id': '',
      'ms': '',
    },
    'htc2icyq': {
      'en': 'Cancelado',
      'id': '',
      'ms': '',
    },
    'bcxio5pc': {
      'en': 'Lista de pedidos',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'uc4sbia7': {
      'en': 'Pendentes',
      'id': '',
      'ms': '',
    },
    'gdk8dbeg': {
      'en': '#1',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    'h27ajhuw': {
      'en': '25/05/22, 09:32',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    '7zoh0xfs': {
      'en': '2x',
      'id': 'Akuisisi Klien untuk Q3',
      'ms': 'Pemerolehan Pelanggan untuk S3',
    },
    'z1fcek1a': {
      'en': 'Red Laga',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'r5mhstnt': {
      'en': 'Vestuário',
      'id': 'Akuisisi Klien untuk Q3',
      'ms': 'Pemerolehan Pelanggan untuk S3',
    },
    'nqcgvjaj': {
      'en': 'R\$ 6.000,00',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'a0w4dzbe': {
      'en': '2x',
      'id': 'Akuisisi Klien untuk Q3',
      'ms': 'Pemerolehan Pelanggan untuk S3',
    },
    'lz807iry': {
      'en': 'Nike Air Jordan',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'chdgbbov': {
      'en': 'Calçados',
      'id': 'Akuisisi Klien untuk Q3',
      'ms': 'Pemerolehan Pelanggan untuk S3',
    },
    'sf5nmoxf': {
      'en': 'R\$ 6.000,00',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'eqj5vfsx': {
      'en': 'Total: R\$ 750,00',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'w2skzmqu': {
      'en': 'Pendente',
      'id': '',
      'ms': '',
    },
    'tlfst4ix': {
      'en': 'Pagos',
      'id': '',
      'ms': '',
    },
    '5nhv3k1y': {
      'en': 'Pago',
      'id': '',
      'ms': '',
    },
    'ctdtrk5c': {
      'en': 'Cancelados',
      'id': '',
      'ms': '',
    },
    'yr06088b': {
      'en': 'Cancelado',
      'id': '',
      'ms': '',
    },
    '0u23glq4': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // pagina_nao_encontrada
  {
    '6q37m6wg': {
      'en': 'Ops!',
      'id': '',
      'ms': '',
    },
    '2qo123gy': {
      'en': 'Página não encontrada :(',
      'id': '',
      'ms': '',
    },
    's53qdhd5': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // Categorias
  {
    '6o6ephbm': {
      'en': 'Categorias',
      'id': '',
      'ms': '',
    },
    'keotih9g': {
      'en': 'Categoria',
      'id': '',
      'ms': '',
    },
    'u0mr5beo': {
      'en': 'Categoria',
      'id': '',
      'ms': '',
    },
    'plf53wb4': {
      'en': 'Ativo',
      'id': '',
      'ms': '',
    },
    'e0unji0f': {
      'en': 'Alterar',
      'id': '',
      'ms': '',
    },
    'wfay6gpx': {
      'en': 'Dashboard',
      'id': '',
      'ms': '',
    },
    'mn8zpfhs': {
      'en': '__',
      'id': '',
      'ms': '',
    },
  },
  // Usuarios
  {
    '7ryml6kh': {
      'en': 'Usuarios',
      'id': '',
      'ms': '',
    },
    'ppmyw3dg': {
      'en': 'Criar',
      'id': '',
      'ms': '',
    },
    '6wols4em': {
      'en': 'Procure por nome',
      'id': '',
      'ms': '',
    },
    't2gv7jtg': {
      'en': 'Customers',
      'id': '',
      'ms': '',
    },
    'bsb6fzcn': {
      'en': '__',
      'id': '',
      'ms': '',
    },
  },
  // detalhesUser
  {
    'fao8r19h': {
      'en': 'Dados básicos',
      'id': '',
      'ms': '',
    },
    'nltskc21': {
      'en': 'Contato',
      'id': '',
      'ms': '',
    },
    '29qnag1i': {
      'en': 'Salvar informações',
      'id': '',
      'ms': '',
    },
    'o5i49qej': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // resetSenha
  {
    'rlg5hzsr': {
      'en':
          'Muito bem, agora insira nos campos abaixos, qual será sua nova senha para o nosso sistema.',
      'id': '',
      'ms': '',
    },
    'rngxbiz0': {
      'en': 'Senha',
      'id': '',
      'ms': '',
    },
    'bld3e4d1': {
      'en': 'Digite aqui sua nova senha',
      'id': '',
      'ms': '',
    },
    '6eds1ko7': {
      'en': 'Confirmar Senha',
      'id': '',
      'ms': '',
    },
    'iub1rrv2': {
      'en': 'Confirme aqui sua nova senha',
      'id': '',
      'ms': '',
    },
    '4uznazc3': {
      'en': 'Enviar',
      'id': '',
      'ms': '',
    },
    'x59bkxrt': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // resetEmail
  {
    'srnx7g2u': {
      'en': 'Esqueceu sua senha?',
      'id': '',
      'ms': '',
    },
    'bn5mnkgt': {
      'en':
          'Insira seu email utilizado para criar sua conta aqui embaixo que enviaremos um link para você resetar sua senha.',
      'id': '',
      'ms': '',
    },
    '3xdqb2ii': {
      'en': 'Email:',
      'id': '',
      'ms': '',
    },
    'sguq3y49': {
      'en': 'Insira aqui seu email',
      'id': '',
      'ms': '',
    },
    'stkfw9rt': {
      'en': 'Resetar senha',
      'id': '',
      'ms': '',
    },
    'jgql1ken': {
      'en': 'Voltar',
      'id': '',
      'ms': '',
    },
    'kx2nuv20': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // PerfilCopy
  {
    '7a1fuwux': {
      'en': 'Meu Perfil',
      'id': '',
      'ms': '',
    },
    'gbfalw42': {
      'en': 'Configurações da conta',
      'id': '',
      'ms': '',
    },
    '3nz63c7h': {
      'en': 'Trocar Senha',
      'id': '',
      'ms': '',
    },
    'cglhlywf': {
      'en': 'Editar Perfil',
      'id': '',
      'ms': '',
    },
    'lvd1ucfx': {
      'en': 'Sair',
      'id': '',
      'ms': '',
    },
    'anhq6yoy': {
      'en': '__',
      'id': '',
      'ms': '',
    },
  },
  // popupEnviarPedido
  {
    'kred63vb': {
      'en': 'Enviar pedido ao vendedor',
      'id': 'Kirim Konfirmasi Kontrak',
      'ms': 'Hantar Pengesahan Kontrak',
    },
    'hywgg8eu': {
      'en': 'Segue a lista de itens do seu pedido:',
      'id': 'Kontrak baru telah dibuat untuk:',
      'ms': 'Kontrak baru telah dijana untuk:',
    },
    'vcm4fijj': {
      'en': 'Próximos passos',
      'id': 'Langkah selanjutnya',
      'ms': 'Langkah seterusnya',
    },
    '60n0fqw5': {
      'en':
          'Confirme o pedido e você será redirecionado para o WhatsApp do vendedor. ',
      'id':
          'Kirim informasi di bawah ini. Dan kami akan mengirimkan email dengan detail kepada pelanggan dan memungkinkan Anda untuk mengelolanya di dasbor Anda.',
      'ms':
          'Hantar maklumat di bawah. Dan kami akan menghantar e-mel dengan butiran kepada pelanggan dan membenarkan anda mengurusnya dalam papan pemuka anda.',
    },
    'e408bhw6': {
      'en': 'Enviar pedido',
      'id': 'Kirim Informasi',
      'ms': 'Hantar Maklumat',
    },
    'wo1onxhi': {
      'en': 'Cancelar',
      'id': 'Sudahlah',
      'ms': 'Tidak mengapa',
    },
  },
  // popupCancelarPedido
  {
    'wa4vkne2': {
      'en': 'Você tem certeza?',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    '3hf2ocig': {
      'en':
          'Você está prestes a cancelar este pedido, essa ação é irreversível.\n\nDeseja continuar?',
      'id':
          'Sekarang kontrak telah dibuat untuk pelanggan ini, silakan hubungi mereka dengan tanggal Anda akan mengirim perjanjian yang ditandatangani.',
      'ms':
          'Memandangkan kontrak telah dijana untuk pelanggan ini, sila hubungi mereka dengan tarikh anda akan menghantar perjanjian yang ditandatangani.',
    },
    'q0jvi1lp': {
      'en': 'Cancelar',
      'id': 'Oke',
      'ms': 'baik',
    },
    'oo4y13nf': {
      'en': 'Confirmar',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // numeroDoPedido
  {
    '00flvi93': {
      'en': 'Pedido enviado!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    'fmzceh74': {
      'en':
          'Informe o código do pedido abaixo ao vendedor para acompanhar o andamento:',
      'id': 'Kontrak baru telah dibuat untuk:',
      'ms': 'Kontrak baru telah dijana untuk:',
    },
    'g8q2u55w': {
      'en': 'Fechar',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // cadastrarProduto
  {
    'l2jlnhye': {
      'en': 'Cadastrar novo produto',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
    'd6yfe8tj': {
      'en': 'Insira as informações do seu produto nos campos abaixo.',
      'id': 'Temukan anggota dengan mencari di bawah',
      'ms': 'Cari ahli dengan mencari di bawah',
    },
    'x0y3eoys': {
      'en': 'Fotos do produto',
      'id': 'Temukan anggota dengan mencari di bawah',
      'ms': 'Cari ahli dengan mencari di bawah',
    },
    'm0jp7wtm': {
      'en': 'Opcionais',
      'id': '',
      'ms': '',
    },
    'vytzeszb': {
      'en': 'Nome do produto',
      'id': '',
      'ms': '',
    },
    'kx5q8aj9': {
      'en': '',
      'id': 'Masukkan catatan Anda di sini...',
      'ms': 'Masukkan nota anda di sini...',
    },
    'ld0ghrz7': {
      'en': 'Valor de Venda',
      'id': '',
      'ms': '',
    },
    '3d3jormu': {
      'en': 'Valor Promocional',
      'id': '',
      'ms': '',
    },
    'x63cptq3': {
      'en': 'Option 1',
      'id': '',
      'ms': '',
    },
    '5rflny0s': {
      'en': 'Categoria',
      'id': '',
      'ms': '',
    },
    '0ud4ehqx': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    '6jpwmudw': {
      'en': 'Cadastrar nova categoria',
      'id': '',
      'ms': '',
    },
    'mgc7k0mh': {
      'en': 'Código do produto',
      'id': '',
      'ms': '',
    },
    'dl84nhg9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ypr546u2': {
      'en': 'Descrição',
      'id': '',
      'ms': '',
    },
    'rkywqv5u': {
      'en': '',
      'id': 'Masukkan catatan Anda di sini...',
      'ms': 'Masukkan nota anda di sini...',
    },
    '3c1lze8b': {
      'en': 'Campo Obrigatório',
      'id': '',
      'ms': '',
    },
    'buodrjbn': {
      'en': 'Mínimo de 3 dígitos',
      'id': '',
      'ms': '',
    },
    'mmrfg6pa': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '5zhybprq': {
      'en': 'Campo Obrigatório',
      'id': '',
      'ms': '',
    },
    'e967v3si': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'vzcu0l9j': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'lm8ydph5': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'iq2svosb': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'k52mtlkb': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'h0gntqza': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'cigtyqdv': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '7iai0wa5': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    '7ql00bwt': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'farrki57': {
      'en': 'Cadastrar produto',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
  },
  // webNav
  {
    'fiv8j2wn': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'nmtda22q': {
      'en': 'Produtos',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'fcu9k36e': {
      'en': 'Categorias',
      'id': '',
      'ms': '',
    },
    'h1k4eq34': {
      'en': 'Clientes',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    'jx6y62rq': {
      'en': 'Pedidos',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    '6ji7f1hi': {
      'en': 'Minha Loja',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    's51mlt3o': {
      'en': 'Perfil',
      'id': 'Profil',
      'ms': 'Profil',
    },
  },
  // cadastrarCliente
  {
    '1wqwtktd': {
      'en': 'Cadastrar novo cliente',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
    'yeotyzv1': {
      'en': 'Insira as informações do seu cliente nos campos abaixo.',
      'id': 'Temukan anggota dengan mencari di bawah',
      'ms': 'Cari ahli dengan mencari di bawah',
    },
    'umh31736': {
      'en': 'Imagem do cliente',
      'id': '',
      'ms': '',
    },
    'kb6ipauf': {
      'en': 'Imagem do cliente ou logo',
      'id': '',
      'ms': '',
    },
    'erpy0vu6': {
      'en': 'Suporta PNG, JPG e JPEG',
      'id': '',
      'ms': '',
    },
    '8892zkrc': {
      'en': 'Carregar imagem',
      'id': '',
      'ms': '',
    },
    '5l4rb33l': {
      'en': 'Dados básicos',
      'id': '',
      'ms': '',
    },
    'l1xjbh3y': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '0s04tnsp': {
      'en': 'Nome',
      'id': '',
      'ms': '',
    },
    'cp8z93ww': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '5wzvuk72': {
      'en': 'CPF/CNPJ',
      'id': '',
      'ms': '',
    },
    '8kog3cl1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'is9tc8sf': {
      'en': 'Observações',
      'id': '',
      'ms': '',
    },
    'w0u2f2jv': {
      'en': 'Contato',
      'id': '',
      'ms': '',
    },
    'a09fpklq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'krugja4e': {
      'en': 'Telefone',
      'id': '',
      'ms': '',
    },
    '0jbnfjdo': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '6k9jgctw': {
      'en': 'E-mail',
      'id': '',
      'ms': '',
    },
    'bpa1wvau': {
      'en': 'Endereço',
      'id': '',
      'ms': '',
    },
    '6jhw2v7a': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'opylmkz6': {
      'en': 'Rua',
      'id': '',
      'ms': '',
    },
    'vh1l9f5b': {
      'en': '',
      'id': '',
      'ms': '',
    },
    's4bqq66f': {
      'en': 'Nº',
      'id': '',
      'ms': '',
    },
    'sjccpiqd': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '0sbqx1p2': {
      'en': 'Bairro',
      'id': '',
      'ms': '',
    },
    'hfsk0llf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'nqtb2s16': {
      'en': 'Cidade',
      'id': '',
      'ms': '',
    },
    'f7i95rj0': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '75db68uk': {
      'en': 'Estado',
      'id': '',
      'ms': '',
    },
    'kzd1q4l1': {
      'en': 'Cadastrar cliente',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
    'g588my2p': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'dsgabmv3': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'f0so39g9': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'l87cyfgf': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'oa5sbivw': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'svvqy972': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '1iazv5ua': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'li4wg14r': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '0zuebkc0': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'htltttpl': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '9hc576ji': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    '97aderbn': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'acan9v3v': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'btv4mcnn': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '2bh2glib': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'fb1u8jtf': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '0maa9d22': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    '4rk3mr9m': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'jnz4ct69': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    '295n2s02': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
  },
  // popupConfirmarPedido
  {
    's62tmxxp': {
      'en': 'Parabéns!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    '142wl8vt': {
      'en': 'Você está prestes a confirmar uma venda.',
      'id':
          'Sekarang kontrak telah dibuat untuk pelanggan ini, silakan hubungi mereka dengan tanggal Anda akan mengirim perjanjian yang ditandatangani.',
      'ms':
          'Memandangkan kontrak telah dijana untuk pelanggan ini, sila hubungi mereka dengan tarikh anda akan menghantar perjanjian yang ditandatangani.',
    },
    'kqqdpd6u': {
      'en': 'Cancelar',
      'id': 'Oke',
      'ms': 'baik',
    },
    'dunysg6e': {
      'en': 'Confirmar',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // popupCadastrarCategoria
  {
    'fgoqhqtn': {
      'en': 'Cadastrar nova categoria',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    'dk61nmyg': {
      'en': 'Insira o nome da categoria',
      'id':
          'Sekarang kontrak telah dibuat untuk pelanggan ini, silakan hubungi mereka dengan tanggal Anda akan mengirim perjanjian yang ditandatangani.',
      'ms':
          'Memandangkan kontrak telah dijana untuk pelanggan ini, sila hubungi mereka dengan tarikh anda akan menghantar perjanjian yang ditandatangani.',
    },
    'zsrwquen': {
      'en': 'Categoria',
      'id': 'Masukkan catatan Anda di sini...',
      'ms': 'Masukkan nota anda di sini...',
    },
    'z16rjnos': {
      'en': 'Cancelar',
      'id': 'Oke',
      'ms': 'baik',
    },
    'qo40wn3q': {
      'en': 'Cadastrar',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // esqueciMinhaSenha
  {
    'du1l542h': {
      'en':
          'Não lembra sua senha? Digite o e-mail associado à sua conta abaixo e enviaremos um novo link.',
      'id':
          'Tidak ingat kata sandi Anda? Masukkan email yang terkait dengan akun Anda di bawah ini dan kami akan mengirimkan tautan baru kepada Anda.',
      'ms':
          'Tidak ingat kata laluan anda? Masukkan e-mel yang dikaitkan dengan akaun anda di bawah dan kami akan menghantar pautan baharu kepada anda.',
    },
    '5k36k0aa': {
      'en': 'E-mail',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    '0o37mgk4': {
      'en': 'Insira o seu e-mail',
      'id': 'Tolong masukkan email yang benar...',
      'ms': 'Sila masukkan e-mel yang sah...',
    },
    'dpensvrq': {
      'en': 'Enviar link',
      'id': 'Kirim Setel Ulang Tautan',
      'ms': 'Hantar Pautan Tetapan Semula',
    },
    'yb59c9iu': {
      'en': 'Voltar',
      'id': 'Kirim Setel Ulang Tautan',
      'ms': 'Hantar Pautan Tetapan Semula',
    },
  },
  // EditarPerfilLojista
  {
    'qyvbnuog': {
      'en': 'Editar perfil',
      'id': '',
      'ms': '',
    },
    'qol8vroq': {
      'en': 'Insira as informações abaixo para editar seu perfil',
      'id': '',
      'ms': '',
    },
    'p6rzqyaz': {
      'en': 'Adicionar Foto',
      'id': '',
      'ms': '',
    },
    'przb8zb6': {
      'en': 'Carregue uma imagem aqui',
      'id': '',
      'ms': '',
    },
    '55es5uxf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dfqmeat4': {
      'en': 'Nome completo',
      'id': '',
      'ms': '',
    },
    'q8s1zpgv': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'i9w0au4z': {
      'en': 'CPF',
      'id': '',
      'ms': '',
    },
    'd6wbev2g': {
      'en': 'Salvar informações',
      'id': '',
      'ms': '',
    },
    'y2t3rp0i': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    '4kq8j6ae': {
      'en': 'Please enter a real name',
      'id': '',
      'ms': '',
    },
    '3xycy3uy': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'c24r8575': {
      'en': 'Please enter a short desription',
      'id': '',
      'ms': '',
    },
    'v5058au4': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'aovkcym9': {
      'en': 'We have to have a URL for the project.',
      'id': '',
      'ms': '',
    },
    'khs5kdiy': {
      'en': 'Please enter a valid URL...',
      'id': '',
      'ms': '',
    },
    '9ser5t4f': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'o4b3rtkj': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'c15fmle8': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
  },
  // EditarPerfilCliente
  {
    'yjowbpyy': {
      'en': 'Editar perfil',
      'id': '',
      'ms': '',
    },
    'zi46n4ch': {
      'en': 'Insira as informações abaixo para editar seu perfil',
      'id': '',
      'ms': '',
    },
    'ydnbgxzv': {
      'en': 'Adicionar Foto',
      'id': '',
      'ms': '',
    },
    'yu0j3ftm': {
      'en': 'Carregue uma imagem aqui',
      'id': '',
      'ms': '',
    },
    'fkv8376a': {
      'en': 'Nome Completo',
      'id': '',
      'ms': '',
    },
    'f6up712u': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dkoeyd2b': {
      'en': 'CPF',
      'id': '',
      'ms': '',
    },
    '661b52ef': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'x8crc0a6': {
      'en': 'Telefone',
      'id': '',
      'ms': '',
    },
    'zifrc2iw': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'mxxxno1s': {
      'en': 'Endereço',
      'id': '',
      'ms': '',
    },
    'eyzc3zkn': {
      'en': 'Rua',
      'id': '',
      'ms': '',
    },
    '8scg8aah': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'e8md2hwc': {
      'en': 'Nº',
      'id': '',
      'ms': '',
    },
    'xh5ahq0e': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '63aco2w1': {
      'en': 'Bairro',
      'id': '',
      'ms': '',
    },
    'wxvzmaia': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'e0q10k2h': {
      'en': 'Cidade',
      'id': '',
      'ms': '',
    },
    'frmugz32': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '65dntqti': {
      'en': 'Estado',
      'id': '',
      'ms': '',
    },
    '5x9lae0y': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ja2dhqma': {
      'en': 'Salvar informações',
      'id': '',
      'ms': '',
    },
    'kpuwxcva': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'f13mrp8g': {
      'en': 'Please enter a real name',
      'id': '',
      'ms': '',
    },
    '2a3xl7sy': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '3rg7schb': {
      'en': 'Please enter a short desription',
      'id': '',
      'ms': '',
    },
    'f5430gqy': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'z132ncre': {
      'en': 'We have to have a URL for the project.',
      'id': '',
      'ms': '',
    },
    'i7aem5hl': {
      'en': 'Please enter a valid URL...',
      'id': '',
      'ms': '',
    },
    'eeeg07zc': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '8yo5kbx4': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'qn2am6o6': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
  },
  // editarProduto
  {
    'tamjoae8': {
      'en': 'Editar produto',
      'id': '',
      'ms': '',
    },
    'gh0f697j': {
      'en': 'Insira as informações do seu produto nos campos abaixo.',
      'id': '',
      'ms': '',
    },
    'veajir4i': {
      'en': 'Fotos do produto',
      'id': '',
      'ms': '',
    },
    'ipxtht8a': {
      'en': 'Nome do Produto',
      'id': '',
      'ms': '',
    },
    '2h4zle29': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '4fz7c8er': {
      'en': 'Valor de Venda',
      'id': '',
      'ms': '',
    },
    'ov4hf2ts': {
      'en': 'Valor Promocional',
      'id': '',
      'ms': '',
    },
    'k2z06rtf': {
      'en': 'Opcionais',
      'id': '',
      'ms': '',
    },
    '0fsgclgi': {
      'en': 'Option 1',
      'id': '',
      'ms': '',
    },
    'c8kqfxfd': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'keojc5ed': {
      'en': 'Cadastrar nova categoria',
      'id': '',
      'ms': '',
    },
    '80jpr1nt': {
      'en': 'Código do Produto',
      'id': '',
      'ms': '',
    },
    'lu3ml4a8': {
      'en': 'Código do produto',
      'id': '',
      'ms': '',
    },
    'mg812mnb': {
      'en': 'Descrição do Produto',
      'id': '',
      'ms': '',
    },
    'sry6tpuz': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'xe3gxc5x': {
      'en': 'Salvar',
      'id': '',
      'ms': '',
    },
  },
  // popupExcluirProduto
  {
    'ks0yrtyy': {
      'en': 'Você tem certeza?',
      'id': '',
      'ms': '',
    },
    '2l4mmm9i': {
      'en':
          'Você está prestes a excluir este produto, essa ação é irreversível.\n\nDeseja continuar?',
      'id': '',
      'ms': '',
    },
    'i6hymjgh': {
      'en': 'Cancelar',
      'id': '',
      'ms': '',
    },
    'zyyz7u78': {
      'en': 'Confirmar',
      'id': '',
      'ms': '',
    },
  },
  // cadastroUsuarios
  {
    '86430sw0': {
      'en': 'Use o formulário abaixo para começar.',
      'id': '',
      'ms': '',
    },
    'lfyfmht8': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'hd53e9h7': {
      'en': 'Insira seu e-mail aqui...',
      'id': '',
      'ms': '',
    },
    'da1pxhz0': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '3q5c0z5a': {
      'en': 'Insira seu nome aqui...',
      'id': '',
      'ms': '',
    },
    'hht20j0u': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '999jdurl': {
      'en': 'Insira  o nome da sua loja aqui...',
      'id': '',
      'ms': '',
    },
    '0oqkqjru': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ln41fk6e': {
      'en': 'Insira sua senha aqui...',
      'id': '',
      'ms': '',
    },
    '9d0lohte': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'nqdzxzxb': {
      'en': 'Confirme sua senha',
      'id': '',
      'ms': '',
    },
    'bx3jiknx': {
      'en': 'Criar conta',
      'id': '',
      'ms': '',
    },
    'ixib4r9x': {
      'en': 'já tem uma conta?',
      'id': '',
      'ms': '',
    },
    'll0on0hb': {
      'en': 'Entre aqui',
      'id': '',
      'ms': '',
    },
  },
  // loginComponente
  {
    'zmnq7gut': {
      'en': 'Use o formulário abaixo para acessar sua conta.',
      'id': '',
      'ms': '',
    },
    'rtel09xj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8ppdrbjx': {
      'en': 'Insira seu e-mail aqui...',
      'id': '',
      'ms': '',
    },
    '7o6soc6i': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'yj4w8cde': {
      'en': 'Insira sua senha aqui...',
      'id': '',
      'ms': '',
    },
    'f4jhm35b': {
      'en': 'Esqueceu a senha?',
      'id': '',
      'ms': '',
    },
    'yi4wxocn': {
      'en': 'Entrar',
      'id': '',
      'ms': '',
    },
    '0b0h7dz7': {
      'en': 'Não tem uma conta?',
      'id': '',
      'ms': '',
    },
    'e6bklx6z': {
      'en': 'Criar uma conta',
      'id': '',
      'ms': '',
    },
  },
  // headerCatalogo
  {
    'ohie2ceh': {
      'en': 'Entrar',
      'id': '',
      'ms': '',
    },
  },
  // popupEditarCategoria
  {
    'y6vd6tvp': {
      'en': 'Editar categoria',
      'id': '',
      'ms': '',
    },
    'oknhin4i': {
      'en': 'Insira o nome da categoria',
      'id': '',
      'ms': '',
    },
    'pvn12ks9': {
      'en': 'Categoria',
      'id': '',
      'ms': '',
    },
    'pp4xbw2z': {
      'en': 'Cancelar',
      'id': '',
      'ms': '',
    },
    'e9aroagu': {
      'en': 'Confirmar',
      'id': '',
      'ms': '',
    },
  },
  // cadastrarUser
  {
    'new5b6jx': {
      'en': 'Cadastrar novo user',
      'id': '',
      'ms': '',
    },
    'ytyvmt4z': {
      'en': 'Insira as informações do seu cliente nos campos abaixo.',
      'id': '',
      'ms': '',
    },
    'ci1p593b': {
      'en': 'Dados básicos',
      'id': '',
      'ms': '',
    },
    'ivvus4vy': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'omo9z1k4': {
      'en': 'Nome',
      'id': '',
      'ms': '',
    },
    'aufdyl7r': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'xcki7ea5': {
      'en': 'CPF/CNPJ',
      'id': '',
      'ms': '',
    },
    'l0gfa2y3': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'c3hvh5iw': {
      'en': 'Senha',
      'id': '',
      'ms': '',
    },
    'a51fiv8y': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '28ulb3ej': {
      'en': 'Confirmar senha',
      'id': '',
      'ms': '',
    },
    '9e6rl1wr': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'hahydzh9': {
      'en': 'Telefone',
      'id': '',
      'ms': '',
    },
    'cut8ifqe': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dh5280p7': {
      'en': 'E-mail',
      'id': '',
      'ms': '',
    },
    'szq4ug93': {
      'en': 'Cadastrar ',
      'id': '',
      'ms': '',
    },
    'htb45pml': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'demq8o8m': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'qsp0wrke': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'pr8utxsv': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '4fe77ih0': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    '38rpcgmm': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'woar6iqt': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'x6blihxi': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'leclzk8a': {
      'en': 'Campo obrigatório',
      'id': '',
      'ms': '',
    },
    'v5robsnv': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'f8m0gdze': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    '4mzmue8j': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '04z5699v': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'kf4rt82b': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'h3hbm8rh': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    '4zz3qgve': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    'gadveh2a': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'n6ua17zn': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
    '87yn3lrz': {
      'en': 'Field is required',
      'id': '',
      'ms': '',
    },
    'am4niomy': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
      'ms': '',
    },
  },
  // Miscellaneous
  {
    'u8hqlhbv': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '5ty2dpcb': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '65e2tfs2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ddazihx4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'db03cpjj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fdb9078p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '80ouzj9q': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '6rzhptp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ce8c4ty0': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'rjlh8m7p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'wlq1dhb3': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'g64862i1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'xf33kiua': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kcvqa08x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dqrzd6sq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dpqtohyf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v01vf71s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'gcv6def1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'um9es99m': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'o4enbz4j': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8z4tvfh7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2ybzla8x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'd1wdf5i1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '18vtvoum': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2py80kgi': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'p6lsrh2a': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ne8cclp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
