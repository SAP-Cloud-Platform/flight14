@AbapCatalog.sqlViewName: '/DMO/ICONNE_R14'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection View - CDS Data Model'

@UI.headerInfo: { typeName: 'Connection',
                  typeNamePlural: 'Connections' }

@Search.searchable: true

define view /DMO/I_Connection_R14
  as select from /dmo/connecti_14 as Connection

  association [1..*] to /DMO/I_Flight_R14 as _Flight  on  $projection.AirlineID    = _Flight.AirlineID
                                                    and $projection.ConnectionID = _Flight.ConnectionID
  association [1]    to /DMO/I_Carrier14  as _Airline on  $projection.AirlineID = _Airline.AirlineID

{
        @UI.facet: [
        { id:     'Connection',
        purpose:  #STANDARD,
        type:     #IDENTIFICATION_REFERENCE,
        label:    'Connection',
        position: 10 } ,
        { id:     'Flight',
        purpose:  #STANDARD,
        type:     #LINEITEM_REFERENCE,
        label:    'Flight',
        position: 20,
        targetElement: '_Flight' }
        ]

        @UI.lineItem: [ { position: 10, label: 'Airline'} ]
        @UI: { identification:[ { position: 10, label: 'Airline' } ]}
        @EndUserText.quickInfo: 'Airline that operates the flight.'
        @ObjectModel.text.association: '_Airline'
        @Search.defaultSearchElement: true
  key   Connection.carrier_id       as AirlineID,

        @UI.lineItem: [ { position: 20, label:'Connection Number' } ]
        @UI: { identification:[ { position: 20, label: 'Connection Number' } ] }
  key   Connection.connection_id    as ConnectionID,

        @UI: {
        lineItem: [ { position: 30, label: 'Departure Airport Code' } ],
        selectionField: [ { position: 10 }  ],
        identification:[ { position: 30, label: 'Departure Airport Code' } ] }
        @EndUserText.label: 'Departure Airport Code'
        @Consumption.valueHelpDefinition: [{  entity: {   name: '/DMO/I_Airport14',
                              element:    'AirportID' } }]
        @Search.defaultSearchElement: true
        @Search.fuzzinessThreshold: 0.7
        Connection.airport_from_id  as DepartureAirport,

        @UI: {
        lineItem: [ { position: 40, label: 'Destination Airport Code'} ],
        selectionField: [ { position: 20 }  ],
        identification:[ { position: 40, label: 'Destination Airport Code' } ] }
        @EndUserText.label: 'Destination Airport Code'
        @Consumption.valueHelpDefinition: [{  entity: {   name: '/DMO/I_Airport14' ,
                                          element: 'AirportID' } }]
        @Search.defaultSearchElement: true
        @Search.fuzzinessThreshold: 0.7
        Connection.airport_to_id    as DestinationAirport,

        @UI.lineItem: [ { position: 50 , label: 'Departure Time'} ]
        @UI: { identification:[ { position: 50, label: 'Departure Time' } ] }
        Connection.departure_time   as DepartureTime,

        @UI.lineItem: [ { position: 60 ,  label: 'Arrival Time' } ]
        @UI: { identification:[ { position: 60, label: 'Arrival Time'  } ] }
        Connection.arrival_time     as ArrivalTime,

        @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
        @UI: { identification:[ { position: 70, label: 'Distance' } ] }
        Connection.distance         as Distance,

        @Semantics.unitOfMeasure: true
        Connection.distance_unit    as DistanceUnit,

        /* Associations */
        @Search.defaultSearchElement: true
        _Flight,
        _Airline

}
