import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomeMinhaLojaWidget() : const LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const HomeMinhaLojaWidget()
              : const LoginPageWidget(),
          routes: [
            FFRoute(
              name: 'HomeMinhaLoja',
              path: 'homeMinhaLoja',
              requireAuth: true,
              builder: (context, params) => const HomeMinhaLojaWidget(),
            ),
            FFRoute(
              name: 'Clientes',
              path: 'clientes',
              requireAuth: true,
              builder: (context, params) => const ClientesWidget(),
            ),
            FFRoute(
              name: 'Pedidos',
              path: 'pedidos',
              requireAuth: true,
              builder: (context, params) => PedidosWidget(
                moverPedidos: params.getParam(
                  'moverPedidos',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'Perfil',
              path: 'perfil',
              requireAuth: true,
              builder: (context, params) => const PerfilWidget(),
            ),
            FFRoute(
              name: 'detalhesPedido',
              path: 'detalhesPedido',
              requireAuth: true,
              asyncParams: {
                'pedido': getDoc(['pedido'], PedidoRecord.fromSnapshot),
              },
              builder: (context, params) => DetalhesPedidoWidget(
                pedido: params.getParam(
                  'pedido',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'Produtos',
              path: 'produtos',
              requireAuth: true,
              builder: (context, params) => const ProdutosWidget(),
            ),
            FFRoute(
              name: 'MinhaLoja',
              path: 'minhaloja',
              requireAuth: true,
              builder: (context, params) => const MinhaLojaWidget(),
            ),
            FFRoute(
              name: 'detalhesCliente',
              path: 'detalhesCliente',
              requireAuth: true,
              asyncParams: {
                'cliente': getDoc(
                    ['minhaLoja', 'cliente'], ClienteRecord.fromSnapshot),
              },
              builder: (context, params) => DetalhesClienteWidget(
                cliente: params.getParam(
                  'cliente',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'catalogoVirtual',
              path: 'catalogoVirtual',
              builder: (context, params) => CatalogoVirtualWidget(
                urlLoja: params.getParam(
                  'urlLoja',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'detalhesProdutoCatalogo',
              path: 'detalhesProdutoCatalogo',
              asyncParams: {
                'detalhesProduto': getDoc(
                    ['minhaLoja', 'produto'], ProdutoRecord.fromSnapshot),
              },
              builder: (context, params) => DetalhesProdutoCatalogoWidget(
                detalhesProduto: params.getParam(
                  'detalhesProduto',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'Checkout',
              path: 'checkout',
              requireAuth: true,
              asyncParams: {
                'loja': getDoc(['minhaLoja'], MinhaLojaRecord.fromSnapshot),
              },
              builder: (context, params) => CheckoutWidget(
                loja: params.getParam(
                  'loja',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'loginPage',
              path: 'loginPage',
              builder: (context, params) => const LoginPageWidget(),
            ),
            FFRoute(
              name: 'cadastroUsuario',
              path: 'cadastroUsuario',
              builder: (context, params) => const CadastroUsuarioWidget(),
            ),
            FFRoute(
              name: 'MeusPedidos',
              path: 'meusPedidos',
              requireAuth: true,
              asyncParams: {
                'loja': getDoc(['minhaLoja'], MinhaLojaRecord.fromSnapshot),
              },
              builder: (context, params) => MeusPedidosWidget(
                loja: params.getParam(
                  'loja',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'pagina_nao_encontrada',
              path: 'paginaNaoEncontrada',
              builder: (context, params) => const PaginaNaoEncontradaWidget(),
            ),
            FFRoute(
              name: 'Categorias',
              path: 'categorias',
              requireAuth: true,
              builder: (context, params) => const CategoriasWidget(),
            ),
            FFRoute(
              name: 'Usuarios',
              path: 'usuarios',
              requireAuth: true,
              builder: (context, params) => const UsuariosWidget(),
            ),
            FFRoute(
              name: 'detalhesUser',
              path: 'detalhesUser',
              requireAuth: true,
              asyncParams: {
                'user': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => DetalhesUserWidget(
                user: params.getParam(
                  'user',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'resetSenha',
              path: 'resetSenha',
              builder: (context, params) => ResetSenhaWidget(
                oobCode: params.getParam(
                  'oobCode',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'resetEmail',
              path: 'resetEmail',
              builder: (context, params) => const ResetEmailWidget(),
            ),
            FFRoute(
              name: 'PerfilCopy',
              path: 'perfilCopy',
              requireAuth: true,
              builder: (context, params) => const PerfilCopyWidget(),
            ),
            FFRoute(
              name: 'ClientesCopy',
              path: 'clientesCopy',
              requireAuth: true,
              builder: (context, params) => const ClientesCopyWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
