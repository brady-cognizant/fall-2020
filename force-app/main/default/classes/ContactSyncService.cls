/*	DATE: 8/13/2020
 * 	AUTHOR: Brady Achterberg
 * 	TASK:
 * 
 * 		As a sales Rep i daily update Phone/Email address on the contact records but first it should 
 * 		be updated to the external System and after it is being successfully updated it should be 
 * 		commit in Salesforce. 
 * 
 * 		These contact records are in sync with an external System whose service is exposed to you. 
 * 		You can use an additional Salesforce Developer edition (DEV2) as an external system. In this 
 * 		Developer edition you need to create a web service which would receive Contact details as an 
 * 		input and update it in the existing contact object.
 * 
 * 		In the Other Salesforce Developer edition(DEV1) when ever you update any contact records you 
 * 		would consume this exposed web service(From DEV2) and send the contact record as an input and 
 * 		perform the update in the other system (DEV2). Remember that you need to commit this contact 
 * 		records in DEV1 when DEV2 updates is successfully done.
 * 
 * 	DATE SUBMITTED FOR REVIEW: 8/18/2020
 */

@RestResource (urlMapping='/Contacts/*')
global with sharing class ContactSyncService 
{
    @HttpPatch
    global static Id syncFields ( string extId, string thisId, string email, string phone, 
                                  string firstName, string lastName
                                )
    {	System.debug('Patch');
        RestRequest request = RestContext.request;
     	Contact dev2Contact;
     	try
        {	dev2Contact = [ SELECT Id FROM Contact WHERE Org_1_Id__c =: extId ];
        } catch ( QueryException qx )
        {	dev2Contact = new Contact();
        }
     	dev2Contact.Email = email;
     	dev2Contact.Phone = phone;
     	dev2Contact.FirstName = firstName;
     	dev2Contact.LastName = lastName;
     	dev2Contact.Org_1_Id__c = extId;
     	upsert dev2Contact;
     	return dev2Contact.Id;
    }
}