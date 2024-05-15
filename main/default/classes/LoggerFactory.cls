/**
 * @author Rohit Alladi
 * @date Nov 2017
 * @group Logger Classes
 * @group-content ../ApexDocContent/Classes.html
 * @description Factory class to build logger object.
 */
public class LoggerFactory {

    public static Logger getLogger(String logName) {

        return getLogger('Default', logName);
    }

    public static Logger getCalloutLogger(String logName) {

        return getLogger('Callout', logName);
    }

    public static Logger getLogger(String loggerType, String logName) {

        Logger loggerObj;
        if (loggerType == 'Default') {
            loggerObj = new LoggerImpl(logName, new LogWriterImpl());
        }else if(loggerType == 'Callout'){
            loggerObj = new CalloutLoggerImpl(logName, new CalloutLogWriter());
        }
        //TODO: Add logic for additional logger types here. XF
        return loggerObj;
    }

    public static Logger getLogger(String logName, String logObjectName,
            Map<LogFields, String> logFieldMap) {
        return new LoggerImpl(logName, logObjectName, logFieldMap, new LogWriterImpl());
    }
}