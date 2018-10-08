@isTest
public class AllJobAdvertisementsTest {
   @isTest
    public static void doGetValidTest(){
        List<Job_Advertisement__c> jAs = TestDataFactory.createJobAdvertisement(101);
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/AllJobAdvertisements';
        req.httpMethod = 'GET';
        req.addHeader('Content-Type', 'application/json');
        req.addParameter('page_limit', '10');
        req.addParameter('page_offset', '2');
        RestContext.request = req;
        RestContext.response = res;        
        Test.startTest();
        AllJobAdvertisements.doGet();
        Test.stopTest();
        String testJSON = res.responseBody.toString();
        System.assertEquals(10, testJSON.countMatches('email'));
    }
    @isTest
    public static void doGetInvalidTest(){
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/AllJobAdvertisements';
        req.httpMethod = 'GET';
        req.addHeader('Content-Type', 'application/json');
        RestContext.request = null;
        RestContext.response = res;
        Test.startTest();
        AllJobAdvertisements.doGet();
        System.assertEquals('Records were not received', res.responseBody.toString());
    }
}