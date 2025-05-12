part of 'app_pages.dart';

abstract class Routes {
  static const WELCOME = _Paths.WELCOME;
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const CANDIDATES = _Paths.CANDIDATES;
  static const VOTE = _Paths.VOTE;
  static const VOTE2 = _Paths.VOTE2;
  static const VOTE3 = _Paths.VOTE3;
  static const VOTE_SERVICE = _Paths.VOTE_SERVICE;
  static const BERANDA = _Paths.BERANDA;
}

abstract class _Paths {
  static const WELCOME = '/welcome';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const CANDIDATES = '/candidates';
  static const VOTE = '/vote';
  static const VOTE2 = '/vote2';
  static const VOTE3 = '/vote3';
  static const VOTE_SERVICE = '/vote-service';
  static const BERANDA = '/beranda';
}
