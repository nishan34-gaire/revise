import 'package:http/http.dart' as http;
import 'package:movie/model/model.dart';

class service {
  Future<Nishan> getpost() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/550?api_key=8be08cce18954a0aecc4f2c57f7d992b');
    var responce = await client.get(uri);
    var json = responce.body;
    if (responce.statusCode == 200) {
      return nishanFromJson(json);
    } else {
      return nishanFromJson(json);
    }
  }
}
