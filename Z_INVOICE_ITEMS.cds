@AbapCatalog.sqlViewName: 'ZINVOICEITEMS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Invoice Items'
define view Z_INVOICE_ITEMS as select from sepm_sddl_so_invoice_item {

    sepm_sddl_so_invoice_item.header.buyer.company_name,
    sepm_sddl_so_invoice_item.currency_code,
    
    @EndUserText.quickInfo: 'Sum of Gross Amount'
    @EndUserText.label: 'Sum of Gross Amount'
    sum( sepm_sddl_so_invoice_item.gross_amount ) as sum_gross_amt,
    
    @EndUserText.quickInfo: 'No. of Paid Invoices'
    @EndUserText.label: 'No. of Paid Invoices'
    sum( case header.payment_status
        when 'P' then 1
        else 0 
    end ) as no_of_paid
    
}
where currency_code = 'USD'
group by
    sepm_sddl_so_invoice_item.header.buyer.company_name,
    sepm_sddl_so_invoice_item.currency_code,
    header.payment_status
