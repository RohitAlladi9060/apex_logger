/**
 * @author Rohit Alladi
 * @date  11/16/2017.
 * @group-content ../ApexDocContent/TestClasses.html
 * @description This Test class is used for default implementation, CalloutLoggerImpl
 **/
@IsTest
private class CalloutLoggerImplTest {

    /**
     * Method Tested: debug
     * | Scenario: Called
     * | Expected Result: Record created in Log__c with Debug level
     **/
    static testMethod void debug_Called_RecordCreatedAtCorrectLoggingLevel() {

        Logger logger = LoggerFactory.getCalloutLogger('MyLogName');

        Test.startTest();
        logger.debug('Test error message');
        Test.stopTest();

        Log__c[] logs = [select Id, Name, Level__c, Message__c,Response__c from Log__c limit 1];

        System.assertEquals(1, logs.size(), 'Expected creation of one log record.');
        System.assertEquals(String.valueOf(LogLevel.DEBUG), logs[0].Level__c, 'Log level should be DEBUG.');
    }
    
    /**
     * Method Tested: debug
     * | Scenario: Callout Logger implementation
     * | Expected Result: Record created in Log__c with callout params.
     **/
    static testMethod void debug_CalloutLogger_RecordCreatedAtCorrectLoggingLevel() {

        LogEventData led = new LogEventData();
        led.calloutEndpoint = 'Https://www.google.com';
        led.errorCode = 'Err-1234';
        led.httpMethod = 'POST';
        led.request = 'Request';
        led.response = 'Response';
        led.userId = String.ValueOf(UserInfo.getUserId());
        led.level = LogLevel.INFO;

        Logger logger = LoggerFactory.getCalloutLogger('MyLogName');
        Test.startTest();
        logger.log(led);
        Test.stopTest();

        Log__c[] logs = [select Id, Name, Level__c, Message__c,Response__c,Error_Code__c from Log__c limit 1];

        System.assertEquals(1, logs.size(), 'Expected creation of one log record.');
        System.assertEquals('Err-1234', logs[0].Error_Code__c, 'Error should be Err-1234.');
    }
}