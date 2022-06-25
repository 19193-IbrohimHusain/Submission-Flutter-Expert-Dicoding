import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_series/tv_series_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_series/dummy_object_tv_series.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesLocalDataSourceImpl dataSourcetv;
  late MockDatabaseHelperTvSeries mockDatabaseHelperTvSeries;

  setUp(() {
    mockDatabaseHelperTvSeries = MockDatabaseHelperTvSeries();
    dataSourcetv =
        TvSeriesLocalDataSourceImpl(databaseHelper: mockDatabaseHelperTvSeries);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
            () async {
          // arrange
          when(mockDatabaseHelperTvSeries.insertWatchlistTv(testTvTable))
              .thenAnswer((_) async => 1);
          // act
          final result = await dataSourcetv.insertWatchlistTvSeries(testTvTable);
          // assert
          expect(result, 'Added to Watchlist');
        });

    test('should throw DatabaseException when insert to database is failed',
            () async {
          // arrange
          when(mockDatabaseHelperTvSeries.insertWatchlistTv(testTvTable))
              .thenThrow(Exception());
          // act
          final call = dataSourcetv.insertWatchlistTvSeries(testTvTable);
          // assert
          expect(() => call, throwsA(isA<DatabaseException>()));
        });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
            () async {
          // arrange
          when(mockDatabaseHelperTvSeries.removeWatchlistTv(testTvTable))
              .thenAnswer((_) async => 1);
          // act
          final result = await dataSourcetv.removeWatchlistTvSeries(testTvTable);
          // assert
          expect(result, 'Removed from Watchlist');
        });

    test('should throw DatabaseException when remove from database is failed',
            () async {
          // arrange
          when(mockDatabaseHelperTvSeries.removeWatchlistTv(testTvTable))
              .thenThrow(Exception());
          // act
          final call = dataSourcetv.removeWatchlistTvSeries(testTvTable);
          // assert
          expect(() => call, throwsA(isA<DatabaseException>()));
        });
  });

  group('Get TV Detail By Id', () {
    final tId = 1;

    test('should return TV Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelperTvSeries.getTvSeriesById(tId))
          .thenAnswer((_) async => testTvMap);
      // act
      final result = await dataSourcetv.getTvSeriesById(tId);
      // assert
      expect(result, testTvTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelperTvSeries.getTvSeriesById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await dataSourcetv.getTvSeriesById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist TV', () {
    test('should return list of TV Table from database', () async {
      // arrange
      when(mockDatabaseHelperTvSeries.getWatchlistTvSeries())
          .thenAnswer((_) async => [testTvMap]);
      // act
      final result = await dataSourcetv.getWatchlistTvSeries();
      // assert
      expect(result, [testTvTable]);
    });
  });
}
