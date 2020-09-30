/*  AUTHOR: Brady Achterberg
 *  DATE ASSIGNED: 9/29/2020
 *  ASSIGNMENT:
 * 
 *      Create a LWC with nothing but a picklist field for the Case object's Status field
 *      in its markup and add it to any Case record page.  When the user updates this field
 *      it should update the object just as if it were part of the ordinary record detail
 *      and refresh the page.
 * 
 *  ASSIGNED BY: Yaj <Yajuvendra.Choubey@cognizant.com>
 *  DATE SUBMITTED FOR REVIEW: 9/30/2020
 */
public with sharing class CaseStatusCustomController 
{
    @AuraEnabled
    static public void saveStatus(string recordId, string status)
    {   Case record = [ SELECT Id, Status FROM Case WHERE Id =: recordId ];
        record.Status = status;
        update record;
    }
}