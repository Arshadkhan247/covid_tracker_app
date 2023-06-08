class AppUrl {
  // this is our base Url of the Api.
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';

  // this Url will use for the fetching data of the whole world...
  static const String worldStatesApi = '${baseUrl}all';

  // this Url will fetch the data on the country base...
  static const String countriesList = '${baseUrl}countries';
}
