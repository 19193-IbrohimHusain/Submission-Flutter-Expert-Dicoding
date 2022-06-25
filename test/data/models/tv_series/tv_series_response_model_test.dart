import 'dart:convert';
import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json_reader.dart';

void main() {
  final tTvModel = TvSeriesModel(
    backdropPath: "/baMG7mRtR52eLHz4b1OZchr1Jwb.jpg",
    genreIds: [80,
      18],
    id: 63351,
    originalName: "Narcos",
    overview: "Narcos chronicles the life and death of drug lord Pablo Escobar the ruthless boss of the Medellin Cartel and a known terrorist who was also a congressman, a family man and revered by the poor as a new Robin Hood.",
    popularity: 12.106431,
    posterPath: "/3CEu32C7udZzIjZcrKmdHcRB1ZN.jpg",
    firstAirDate: "2015-08-28",
    name: "Narcos",
    voteAverage: 7.33,
    voteCount: 65,
  );
  final tTvResponseModel = TvSeriesResponse(tvSeriesList: <TvSeriesModel>[tTvModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/tv_series/now_playing_tv_series.json'));
      // act
      final result = TvSeriesResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/baMG7mRtR52eLHz4b1OZchr1Jwb.jpg",
            "genre_ids": [
              80,
              18
            ],
            "id": 63351,
            "original_name": "Narcos",
            "overview": "Narcos chronicles the life and death of drug lord Pablo Escobar the ruthless boss of the Medellin Cartel and a known terrorist who was also a congressman, a family man and revered by the poor as a new Robin Hood.",
            "popularity": 12.106431,
            "poster_path": "/3CEu32C7udZzIjZcrKmdHcRB1ZN.jpg",
            "first_air_date": "2015-08-28",
            "name": "Narcos",
            "vote_average": 7.33,
            "vote_count": 65
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
