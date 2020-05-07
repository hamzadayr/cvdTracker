class Country {
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;

  Country({this.country, this.cases, this.todayCases, this.deaths, this.todayDeaths, this.recovered, this.active, this.critical});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      country: json['country'],
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      active: json['active'],
      todayDeaths: json['todayDeaths'],
    );
  }
}