/*	AUTHOR: Brady Achterberg
 * 	DATE ASSIGNED: 9/24/2020
 * 	ASSIGNMENT:
 * 
 * 		· Create a component, that has a look up field kind of look to the email templates.
 * 		· Once the template is selected we should be able to preview the template and also edit the template.
 * 		· Should also have the ability to sign the template before sending it to the user.
 * 
 * 	ASSIGNED BY: Shashank Thota <shashank.thota@cognizant.com>
 * 	DATE SUBMITTED FOR REVIEW: 9/29/2020
 */
public class EmailTemplateLookupController 
{
    @AuraEnabled
    static public list<EmailTemplate> getTemplates ( string searchKey )
    {
        list<EmailTemplate> templateMatch =
            [	SELECT Id, Name
                FROM EmailTemplate
             	WHERE Name LIKE : '%' + searchKey + '%'
            ];
        return templateMatch;
    }

}