/**
 * @author Rohit Alladi
 * @date Jun 2018
 * @group-content ../ApexDocContent/Classes.html
 * @description Writer for the callout logger
 **/
public with sharing class CalloutLogWriter implements LogWriter {

    public void writeToCustomObject(
            String customObjectName, Map<LogFields, String> logFieldMap, LogEventData data) {

        if (customObjectName == 'Log__c') {
            Log__c log = new Log__c(
            Level__c=data.level.name(),
            Message__c=data.message,
            Callout_Endpoint__c=data.calloutEndpoint,
            Error_Code__c=data.errorCode,
            Http_Method__c=data.httpMethod, Request__c=data.request,
            Response__c=data.response, User_Id__c=data.userId);
            insert log;
        }
    }
}