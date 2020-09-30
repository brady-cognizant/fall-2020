({
	handleLookupKey : function(component, event, helper) 
    {	console.log("Hello");
        let searchKey = component.find("lookup").get("v.value");
        if ( event.keyCode === 13 )		// if key is 'Enter'
        {	// Call Apex controller
            let lookup = component.get("c.getTemplates");
            lookup.setParams({ "searchKey" : searchKey });
            lookup.setCallback( this, function (response) 
                   	{	// TODO: Code callback function
                        if ( response.getState() === "SUCCESS" )
                        {	console.log( "Templates: " + JSON.stringify(response.getReturnValue()) );
                            
                        } else
                            console.log( response.getState() );
                    }		  );
            $A.enqueueAction(lookup);
        }
	}
})