@AbapCatalog.sqlViewName: '/DMO/ICUST_RE14'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer View - CDS Data Model'
@Search.searchable: true

define view /DMO/I_Customer14 
  as select from /dmo/customer14 as Customer 

  association [0..1] to I_Country as _Country on $projection.CountryCode = _Country.Country


{
    key Customer.customer_id    as CustomerID, 
    Customer.first_name         as FirstName, 
    @Semantics.text: true
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8    
    Customer.last_name          as LastName, 
    Customer.title              as Title, 
    Customer.street             as Street, 
    Customer.postal_code        as PostalCode, 
    Customer.city               as City, 
    Customer.country_code       as CountryCode, 
    Customer.phone_number       as PhoneNumber, 
    Customer.email_address      as EMailAddress,

    /* Associations */
    _Country

}
