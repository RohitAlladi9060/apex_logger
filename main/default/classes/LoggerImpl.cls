/**
 * @author Rohit Alladi
 * @date Nov 2017
 * @group Logger Classes
 * @group-content ../ApexDocContent/Classes.html
 * @description Initial implementation of Logger interface.
 **/
public class LoggerImpl implements Logger {

    private String logName;
    private LogWriter logWriter;
    private String logObjectName;
    private Map<LogFields, String> logFieldMap;

    public LoggerImpl(String logName, LogWriter logWriter) {
        this.logName = logName;
        this.logWriter = logWriter;
    }

    public LoggerImpl(String logName, String logObjectName,
            Map<LogFields, String> logFieldMap, LogWriter logWriter) {

        this.logName = logName;
        this.logWriter = logWriter;
        this.logFieldMap = logFieldMap;
        this.logObjectName = logObjectName;
    }

    /**
     * debug overloads
     */

    public void debug (String message){
        LogEventData led = new LogEventData();
        led.message = message;
        led.level = LogLevel.DEBUG;
        logWriter.writeToCustomObject('Log__c', logFieldMap, led);
    }

    /**
     * error method overloads
     */

    public void error (String message, Exception ex){}

    public void error (String message, Exception ex, Object p0){
        LogEventData led = new LogEventData();
        led.logName = this.logName;
        led.message = message;
        led.level = LogLevel.ERROR;
        led.stackTrace = ex.getStackTraceString();
        led.userId = (String)p0;
        logWriter.writeToCustomObject(logObjectName, logFieldMap, led);
    }

    public void error (String message, Exception ex, Object p0, Object p1){
        LogEventData led = new LogEventData();
        led.logName = this.logName;
        led.message = message;
        led.level = LogLevel.ERROR;
        led.stackTrace = ex.getStackTraceString();
        led.userId = (String)p0;
        led.errorCode = (String)p1;
        logWriter.writeToCustomObject(logObjectName, logFieldMap, led);
    }

    public void error (String message, Exception ex, Object p0, Object p1, Object p2){}

    public void error (LogEventData logData){}

    /**
     * fatal method overloads
     */

    public void fatal (String message){}

    /**
     * info method overloads
     */

    public void info (String message){}

    /**
     * log method overloads
     */

    public void log (LogLevel level, String message){}

    public void log (LogLevel level, String message, Object p0){}

    public void log (LogLevel level, String message, Object p0, Object p1){}

    public void log (LogEventData logData) {
        //TODO: Add implementation and unit tests. XF
    }

    /**
     * warn method overloads
     */

    public void warn (String message){}
}