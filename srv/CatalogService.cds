using { manoj.db.master, manoj.db.transaction } from '../db/datamodel';

service CatalogService @(path: 'CatalogService') {
 
    entity EmployeeSet as projection on master.employees;
    entity businesspartnerSet as projection on master.businesspartner;
    entity productSet as projection on master.product;
    entity BPAddressSet as projection on master.address;
    entity POs @( 
        odata.draft.enabled : true
    ) as projection on transaction.purchaseorder{
        *,
        case OVERALL_STATUS
          when 'O' then 'Open'
          when 'A' then 'Approved'
          when 'X' then 'Rejected'
          when 'N' then 'New'
          when 'D' then 'Delivered'
          end as OverallStatus : String(10),
        case OVERALL_STATUS
          when 'O' then '2'
          when 'A' then '3'
          when 'X' then '1'
          when 'N' then '0'
          when 'D' then '0'
          end as Criticality : String(10)
    } actions{
        @cds.odata.bindingparameter.name : '_manoj'
        @Common.SideEffects : {
            TargetProperties : ['_manoj/GROSS_AMOUNT']
        }
        action boost();
        function largestOrder() returns array of POs;
        };
    entity PurchaseOrderItemSet as projection on transaction.poitems;
}