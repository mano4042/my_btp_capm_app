using CatalogService as service from '../../srv/CatalogService';
annotate service.POs with @(
    UI.SelectionFields:[
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        GROSS_AMOUNT,
        CURRENCY_code,
        OVERALL_STATUS

    ],
    UI.LineItem: [
         {
             $Type : 'UI.DataField',
             Value : PO_ID,
         },
         {
             $Type : 'UI.DataField',
             Value : PARTNER_GUID.COMPANY_NAME,
         },
         {
             $Type : 'UI.DataField',
             Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
         },
         {
             $Type : 'UI.DataField',
             Value : GROSS_AMOUNT,
         },
         {
            $Type : 'UI.DataFieldForAction',
            Label : 'Boost',
            Action : 'CatalogService.boost',
            Inline : true,
         },
         {
             $Type : 'UI.DataField',
             Value : OverallStatus,
             Criticality : Criticality
         },
    ],
    UI.HeaderInfo:{
        TypeName: 'Purchase Order',
        TypeNamePlural: 'Purchase Order',
        Title : {
            Value: PO_ID,
        },
        Description : {
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        ImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsV3YHgSMQkcAFyT2CGx-NNPxvlXY-DNmAZg&s',
    },
    UI.Facets: [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'More Details',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'More Info',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Price Info',
                    Target : '@UI.FieldGroup#spiderman'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Status Info',
                    Target : '@UI.FieldGroup#superman'
                }
            ],      
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Line Item',
            Target : 'Items/@UI.LineItem'
        },
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Label : 'Purcharse Order ID', 
            Value : PO_ID
        },
          {
            $Type : 'UI.DataField',
            Label : 'Seller',
            Value : PARTNER_GUID_NODE_KEY
        },
          {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : OVERALL_STATUS
        },
    ],   
    UI.FieldGroup #spiderman: {
        Label : 'Price Details',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
        ],
    },
    UI.FieldGroup #superman:  {
        Label : 'Status',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            }
        ]
    },
);
annotate CatalogService.POs with {
    PARTNER_GUID@(
        Common : { 
            Text : PARTNER_GUID.COMPANY_NAME,
         },
         ValueList.entity: CatalogService.BusinessPartnerSet
    )
};

annotate CatalogService.PurchaseOrderItemSet with {
    PRODUCT_GUID@(
        Common : { 
            Text : PRODUCT_GUID.DESCRIPTION,
         },
         ValueList.entity: CatalogService.ProductSet
    )
};

@cds.odata.valuelist
annotate CatalogService.businesspartnerSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : COMPANY_NAME,
    }]
);

@cds.odata.valuelist
annotate CatalogService.productSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : DESCRIPTION,
    }]
);


annotate service.PurchaseOrderItemSet with @(
    UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },

    ],
    UI.HeaderInfo:{
            TypeName: 'PO Item',
            TypeNamePlural : 'PO Items',
    },
    UI.Facets: [
        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.Identification',
            Label : 'More Details'
        }
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Label : 'Item Position',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Product ID',
            Value : PRODUCT_GUID_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
    ]
);


