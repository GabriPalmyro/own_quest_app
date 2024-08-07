enum Routes {
  splash('/'),
  debugging('/debugging'),
  onboarding('/onboarding'),
  login('/login'),
  register('/register'),
  home('/home');

  const Routes(this.path);

  final String path;

  @override
  String toString() => name;
}
