import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel_comics_info/comic_info_model.dart';

class ComicsInfoProvider {

  String _baseUrl = "gateway.marvel.com";
  String _ts      = "1";
  String _apiKey  = "YOUR API KEY HERE";
  String _hash    = "YOUR HASH HERE";
  
  Future<List<Result>> _processResp(Uri url) async {

    final resp = await http.get(url);
    final decodedData = jsonDecode(resp.body);
    final comics = new ComicInfoModel.fromJson(decodedData);
    List<Result> allComics = comics.data.results;
    return allComics.toList();

  }

  Future<List<Result>> getComics(offset) async {
    final _url = Uri.http(_baseUrl, "/v1/public/comics", {
      'ts'      : _ts,
      'apikey'  : _apiKey,
      'hash'    : _hash,
      'offset'  : offset.toString()
    });
    final resp = await _processResp(_url);
    return resp;
  }

}