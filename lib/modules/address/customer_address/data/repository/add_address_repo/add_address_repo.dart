import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/services/failures.dart';

abstract class AddAddressAbstractRepo {
  // get countries
  Future<Either<Response, ServerFailure>> getCountries();

  // get cities in country
  Future<Either<Response, ServerFailure>> getCitiesInCountry(
      {required String countryId});

  // get districts in city
  Future<Either<Response, ServerFailure>> getDistrictsInCity(
      {required String cityId});

  // get sub districts in districts
  Future<Either<Response, ServerFailure>> getSubDistrictsInDistricts(
      {required String districtsId});

  // Add a new address
  Future<Either<Response, ServerFailure>> addNewAddress(
      {required Map<String, dynamic> data});
}
