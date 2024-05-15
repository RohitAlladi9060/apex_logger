/**
 * @author Rohit Alladi
 * @date Nov 2017
 * @group Logger Interfaces
 * @group-content ../ApexDocContent/Interfaces.html
 * @description Contains methods to write log event details
 **/
public interface LogWriter {

    /**
     * Writes the log to a custom object
     * @param customObjectName Name of the custom object to write to
     * @param logFieldMap Map of log field keys to log field names
     * @param logEventData Data to write to the log record
     */
    void writeToCustomObject(
            String customObjectName, Map<LogFields, String> logFieldMap, LogEventData logEventData);
}