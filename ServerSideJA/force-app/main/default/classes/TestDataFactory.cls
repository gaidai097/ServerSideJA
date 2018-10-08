@isTest
public class TestDataFactory {
	public static List <Job_Advertisement__c> createJobAdvertisement(Integer count){
        List <Job_Advertisement__c> jAs = new List <Job_Advertisement__c>();        
        for(integer i = 0; i < count; i++){
            jAs.add( 
                // Owner is an Admin (current user)
                new Job_Advertisement__c( Name = 'unclaimedPositionTest '+ i,
                                         Status__c='Active',
                                         email__c = i +'test@gmail.com'
                                        )
            );
        }
        insert jAs;        
        return jAs;
    }
    public static List <Job_Advertisement__c> createDifferentJobAdvertisements(Integer count){
        List <Job_Advertisement__c> jAs = new List <Job_Advertisement__c>();        
        for(integer i = 0; i < count; i++){           
            Job_Advertisement__c obj =  new Job_Advertisement__c( email__c = i +'test@gmail.com' );
            if( i<=30 ){
                obj.Status__c = 'Active';
                obj.SalaryMin__c = 50;
                obj.SalaryMax__c = 75;
                obj.Name = 'Low '+ i;
            }
            if( i>30 && i<=60){
                obj.Status__c = 'Archived';
                obj.SalaryMin__c = 75;
                obj.SalaryMax__c = 90;
                obj.Name = 'Middle '+ i;
            }
            if( i>60 && i <= 90){
                obj.Status__c = 'On hold';
                obj.SalaryMin__c = 90;
                obj.SalaryMax__c = 120;
                obj.Name = 'High '+ i;
            }
            if( i>90 ){
                obj.Status__c = 'Active';
                obj.SalaryMin__c = 120;
                obj.Name = 'Top '+ i;
            }
            jAs.add(obj);
        }
        insert jAs;        
        return jAs;
    }
}