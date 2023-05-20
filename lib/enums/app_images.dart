enum AppImages {
  logo(asset: 'assets/images/logo.png'),


  //auth
  view(asset: 'assets/images/auth/view.svg'),
  hide(asset: 'assets/images/auth/hide.svg'),

  rectangle(asset: 'assets/images/rectangle.png'),

  //bottom navigation bar
  home(asset: 'assets/images/bottom_navigation_bar/home.svg'),
  pokedex(asset: 'assets/images/bottom_navigation_bar/pokedex.svg'),
  game(asset: 'assets/images/bottom_navigation_bar/game.svg'),
  config(asset: 'assets/images/bottom_navigation_bar/config.svg'),

  //settings
  userConfig(asset: 'assets/images/settings/user_config.svg');

  const AppImages({required this.asset});
  final String asset;
}
