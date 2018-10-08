@RestResource(urlMapping='/AllJobAdvertisements')
global class AllJobAdvertisements{
    @HttpGet
    global static void  doGet(){
        RestResponse res = RestContext.response;
        try{
                     
            Integer count = JobAdvertisementApiHelper.countJobAdvertisements(RestContext.request.params);
            if( count != null && count > 0){
                List <Job_Advertisement__c> jobs = JobAdvertisementApiHelper.selectAllJobAdvertisements( RestContext.request.params );
                List <JobAdvertisementsWrapper> wrappedList = JobAdvertisementsWrapper.convertToWrapper(jobs) ;            
                
                PageListWrapper page = new PageListWrapper(count, wrappedList);
                String str = JSON.serialize( page );
                RestContext.response.responseBody =  Blob.valueOf( str );
            }              
            res.statusCode = 200; 
        }catch(Exception e ){
            RestContext.response.responseBody = Blob.valueOf( 'Records were not received' );
            System.debug('Records were not received, Exception e ' + e);
        }        
    }    
}