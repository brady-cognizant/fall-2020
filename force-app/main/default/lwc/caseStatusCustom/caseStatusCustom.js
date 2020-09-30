import { api, track, LightningElement } from 'lwc';

import saveStatus from '@salesforce/apex/CaseStatusCustomController.saveStatus';

export default class CaseStatusCustom extends LightningElement 
{
    @api recordId;
    @track error;

    handleChange (event)
    {   saveStatus(
            {   recordId : this.recordId, 
                status : event.detail.value 
            }     ).then( result => 
            {   console.log("Refreshing...");
                eval("$A.get('e.force:refreshView').fire();");
            }           ).catch( error => 
            {   this.error = "ERROR occured while saving record: " + JSON.stringify(error);
                alert(this.error);
            }                  );
    }
}