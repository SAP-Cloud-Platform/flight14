@AbapCatalog.sqlViewName: '/DMO/ICONNE_RE14'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection View - CDS Data Model'

define view /DMO/I_Connection14
  as select from /dmo/connecti_14 as Connection
{

  key Connection.carrier_id              as AirlineID,
  key Connection.connection_id           as ConnectionID,

      Connection.airport_from_id         as DepartureAirport,
      Connection.airport_to_id           as DestinationAirport,
      Connection.departure_time          as DepartureTime,
      Connection.arrival_time            as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      Connection.distance                as Distance,
      @Semantics.unitOfMeasure: true
      Connection.distance_unit           as DistanceUnit

}
