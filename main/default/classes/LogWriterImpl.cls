/**
 * @author Rohit Alladi
 * @date Nov 2017
 * @group Logger Classes
 * @group-content ../ApexDocContent/Classes.html
 * @description Default log writer implementation
 **/
public class LogWriterImpl implements LogWriter {

    public void writeToCustomObject(String customObjectName, Map<LogFields, String> logFieldMap, LogEventData data) {

        List<DescribeSObjectResult> descList = Schema.describeSObjects(new List<String>{customObjectName});
        SObjectType sobjType = descList[0].getSObjectType();
        SObject logObj = sobjType.newSObject();
        logObj.put(logFieldMap.get(LogFields.LOG_NAME), data.logName);
        if (data.level != null) {
            logObj.put(logFieldMap.get(LogFields.LEVEL), data.level.name());
        }
        logObj.put(logFieldMap.get(LogFields.MESSAGE), data.message);
        logObj.put(logFieldMap.get(LogFields.STACK_TRACE), data.stackTrace);
        logObj.put(logFieldMap.get(LogFields.USER_ID), data.userId);
        if (!String.isBlank(data.errorCode)) {
            logObj.put(logFieldMap.get(LogFields.ERROR_CODE), data.errorCode);
        }
        insert logObj;
    }
    
}