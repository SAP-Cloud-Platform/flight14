@AbapCatalog.sqlViewName: '/DMO/IAGEN_RE14'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED


@EndUserText.label: 'Agency View - CDS Data Model'
@Search.searchable: true
define view /DMO/I_Agency14

  as select from /dmo/agency14 as Agency 

  association [0..1] to I_Country as _Country on $projection.CountryCode = _Country.Country

{   

    key Agency.agency_id        as AgencyID,
    @Semantics.text: true
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    Agency.name                 as Name,
    Agency.street               as Street,
    Agency.postal_code          as PostalCode,
    Agency.city                 as City,
    Agency.country_code         as CountryCode,
    Agency.phone_number         as PhoneNumber,
    Agency.email_address        as EMailAddress,
    Agency.web_address          as WebAddress,

    /* Associations */
    _Country
}
