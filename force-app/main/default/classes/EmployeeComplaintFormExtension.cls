/*	AUTHOR: Brady Achterberg
 * 	DATE: 9/1/2020
 * 	ASSIGNMENT:
 * 
 * 		Create Case for an Employee who calls to Service Center and assign to IT Help Desk Queue
 * 
 * 		Using Visualforce & Javascript & soap/ajax/48.0/connection.js get Salesforce object details and 
 * 		display on to screen. This exercise is more useful when developening Visualforce pages and using 
 * 		ajax Connection to Salesforce on client side programming
 * 
 * 		Task Details:
 * 
 * 		1. 	Create below fields on User Object
 * 			
 * 				Employee ID field for with Char of 10 and make this field as unique.
 * 				Designation: Char of 30
 * 				Supervisor : Reference to User Object
 * 				Phone : Phone
 * 				Email: Email
 * 
 * 		2. 	Create a Complainant field on Case object refer to User Object. 
 * 		3. 	Create L1 Comments, L2 Comments and L3 Comments on Case object with Text Area. 
 * 		4. 	Create a new Visualforce Page as below. Please format screen for user experience 
 * 			
 * 				Employee Id : Input Filed 
 * 				Employee Details: Output Text
 * 				First Name: Output Text
 * 				Last Name :Output Text
 * 				Designation:Output Text
 * 				Phone:
 * 				Email:
 * 				Supervisor Name: Output Text
 * 				Federation Id:Output Text
 * 				Case Description: Input Long Text
 * 				Status: Input
 * 				L1 Comments: 
 * 				L2 Comments:
 * 				L3 Comments:
 * 
 * 		5. 	Create a IT Help Desk Queue
 * 		6. 	Functionality:
 * 
 * 				Call center people receive a call from Employee regarding any IT issue, call center 
 * 				people open this newly created Visualforce page and enter details.
 * 
 * 				As soon as User Enters his Employee ID and tabs out, using JavaScript Ajax Connection 
 * 				fetch details from User Object with Employee ID and display on to screen.
 * 
 * 				Fill details as Case Description, L1 Comments and submit (i.e. Submit button should 
 * 				be created)
 * 
 * 				Once it is submitted, case owner should be assigned to IT Helpdesk queue which we 
 * 				created.
 * 
 * 	TIME ALOTTED: 80-100 Hours
 * 	ASSIGNED BY: <Pundareekam.Kudikala@cognizant.com>
 * 	DATE SUBMITTED FOR REVIEW: 9/24/2020
 * 
 */
public class EmployeeComplaintFormExtension 
{
    private ApexPages.StandardController std;
    private Case c;
    
    public User complainant { get ; set ; }
    public string uName { get ; set ; }
    
    public EmployeeComplaintFormExtension (ApexPages.StandardController caseController) 
    {	std = caseController;
     	c = (Case) caseController.getRecord();
    }
    
    public void readDetail ()
    {	try
        {	complainant = [ SELECT Id, FirstName, LastName, Designation__c, Phone, Email, Supervisor__c, FederationIdentifier
                           	FROM User 
                           	WHERE Name =: uName 
                           	LIMIT 1
                          ];
        } catch ( exception e )
        {	complainant = null;
            System.debug('Error: ' + e);
        }
     	System.debug('Complainant: ' + complainant);
    }

    public PageReference save ()
    {   c.Origin = 'Help Desk';
        return std.save();
    }
}