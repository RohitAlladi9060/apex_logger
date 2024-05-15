/**
 * @author Rohit Alladi
 * @date Nov 2017
 * @group Logger Test Classes
 * @group-content ../ApexDocContent/TestClasses.html
 * @description Test class for default implementation, LoggerImpl
 **/
@IsTest
private class LoggerImplTest {

    static Map<LogFields, String> buildLogFieldMap() {
        Map<LogFields, String> logFieldMap = new Map<LogFields, String> {
                LogFields.LOG_NAME => 'Log_Name__c',
                LogFields.MESSAGE => 'Message__c',
                LogFields.STACK_TRACE => 'Stack_Trace__c',
                LogFields.USER_ID => 'User_ID__c',
                LogFields.LEVEL => 'Level__c',
                LogFields.ERROR_CODE => 'Error_Code__c'
        };
        return logFieldMap;
    }

    /**
     * Method Tested: debug
     * | Scenario: Called
     * | Expected Result: Record created in Log__c with Debug level
     **/
    static testMethod void debug_Called_RecordCreatedAtCorrectLoggingLevel() {

        Map<LogFields, String> logFieldMap = buildLogFieldMap();

        Logger logger = LoggerFactory.getLogger('My Log Name', 'Log__c', logFieldMap);

        Test.startTest();
        logger.debug('Test error message');
        Test.stopTest();

        Log__c[] logs = [select Id, Log_Name__c, Level__c, Message__c, Response__c from Log__c limit 1];
        
        System.assertEquals(1, logs.size(), 'Expected creation of one log record.');
        System.assertEquals(String.valueOf(LogLevel.DEBUG), logs[0].Level__c, 'Log level should be DEBUG.');
    }

    /**
     * Method Tested: error
     * | Scenario: Log object and fields explicitly defined
     * | Expected Result: Record created correctly in log object
     **/
    static testmethod void error_LogObjectAndFieldsExplicitlyDefined_RecordCreatedCorrectly() {

        Id userId = fflib_IDGenerator.generate(User.SObjectType);

        Map<LogFields, String> logFieldMap = buildLogFieldMap();

        Logger logger = LoggerFactory.getLogger('My Log Name', 'Log__c', logFieldMap);

        Test.startTest();
        try {
            throw new TestException('Test error message');
        }
        catch (Exception exc) {
            logger.error(exc.getMessage(), exc, userId);
        }
        Test.stopTest();

        Log__c[] logs = [select Id, Log_Name__c, Level__c, Message__c, Stack_Trace__c, User_ID__c, Error_Code__c
        from Log__c limit 1];

        System.assertEquals('Test error message', logs[0].Message__c, 'Message not saved correctly.');
        System.assertEquals(userId, logs[0].User_Id__c, 'User ID not saved correctly.');
        System.assertEquals('ERROR', logs[0].Level__c, 'Level not saved correctly.');
        System.assertEquals('My Log Name', logs[0].Log_Name__c);
        System.assertEquals(null, logs[0].Error_Code__c, 'Error should not have been set.');
    }

    /**
     * Method Tested: error
     * | Scenario: Error Code passed in
     * | Expected Result: Error code saved successfully
     **/
    static testmethod void error_ErrorCodePassedIn_ErrorCodeSavedSuccessfully() {

        Id userId = fflib_IDGenerator.generate(User.SObjectType);

        Map<LogFields, String> logFieldMap = buildLogFieldMap();

        Logger logger = LoggerFactory.getLogger('My log name', 'Log__c', logFieldMap);

        Test.startTest();
        try {
            throw new TestException('Test error message');
        }
        catch (Exception exc) {
            logger.error(exc.getMessage(), exc, userId, '123456');
        }
        Test.stopTest();

        Log__c[] logs = [select Error_Code__c from Log__c limit 1];

        System.assertEquals('123456', logs[0].Error_Code__c, 'Error Code not saved correctly.');
    }

    class TestException extends Exception{}
}