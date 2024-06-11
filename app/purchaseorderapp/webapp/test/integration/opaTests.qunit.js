sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'manoj/app/purchaseorderapp/test/integration/FirstJourney',
		'manoj/app/purchaseorderapp/test/integration/pages/POsList',
		'manoj/app/purchaseorderapp/test/integration/pages/POsObjectPage',
		'manoj/app/purchaseorderapp/test/integration/pages/PurchaseOrderItemSetObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, PurchaseOrderItemSetObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('manoj/app/purchaseorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePurchaseOrderItemSetObjectPage: PurchaseOrderItemSetObjectPage
                }
            },
            opaJourney.run
        );
    }
);