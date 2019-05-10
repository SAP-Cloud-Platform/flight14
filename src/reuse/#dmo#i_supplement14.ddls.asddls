@AbapCatalog.sqlViewName: '/DMO/ISUPPL14'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED


@EndUserText.label: 'Supplement view'
define view /DMO/I_Supplement14
    as select from /dmo/suppleme_14 as Supplement

    association [0..1] to I_Currency        as _Currency  on $projection.CurrencyCode = _Currency.Currency
{
    key Supplement.supplement_id           as SupplementID,
   
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Supplement.price                       as Price,
   
    @Semantics.currencyCode: true
    Supplement.currency_code               as CurrencyCode,
    
    /* Associations */
    _Currency
}
