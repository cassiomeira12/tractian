enum AppRouter {
  menu('/menu'),
  asset('/assets');

  const AppRouter(this.route);

  final String route;
}
