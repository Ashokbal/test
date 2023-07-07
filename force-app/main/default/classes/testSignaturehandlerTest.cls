/************************************************************
@Name       : testSignaturehandlerTest
@Author     : Ravindra Ravindra
@CreateDate : 16/02/2023
Test1fff3456 workinggggg
@Description: Test class for testSignaturehandler
******************************************************************/

@isTest
public class testSignaturehandlerTest {
    @TestSetup static void newAppointments(){
        User adminUser=IAP_TestDataFactory.createSystemAdminUser('South Korea');
        System.runAs(adminUser){
            Id oppId = IAP_TestDataFactory.createOpportunityRecord();
            IAP_Appointment__c newTestDrive = new IAP_Appointment__c();
            newTestDrive.Name = 'TestClassDrive';
            newTestDrive.IAP_Status__c = 'Planned';
            newTestDrive.IAP_Opportunity__c = oppId;
            Insert newTestDrive;
            System.assert(newTestDrive.Id != null);
        }
    }
    
    @isTest static void checkTestDrive(){
        String id = [Select Id From IAP_Appointment__c Limit 1].Id;
        System.assertEquals(NULL, testSignaturehandler.returnSignedImages(id).IAP_Customer_Signature__c);
    }
    
     @isTest static void checkCustomerSignature(){
        String id = [Select Id From IAP_Appointment__c Limit 1].Id;
        System.assertEquals('Success', testSignaturehandler.customerSignatureSave('/_slds/images/logo-noname.svg',id));
    }
    
    @isTest static void checkDealerSignatureSave(){
        String id = [Select Id From IAP_Appointment__c Limit 1].Id;
        System.assertEquals('Success', testSignaturehandler.dealerSignatureSave('/_slds/images/logo-noname.svg',id));
    }
}
