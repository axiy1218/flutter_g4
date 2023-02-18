enum AppPageRoutes {
  first('/first'),
  second('/second'),
  third('/third'),
  doctor('/doctor'),
  wallet('/wallet'),
  account('/account'),
  crypto('/crypto'),
  doctorList('/doctorListView'),
  home('/home');

  final String routeName;
  const AppPageRoutes(this.routeName);
}
