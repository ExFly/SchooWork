package org.exfly.logger;  
  
import org.apache.logging.log4j.LogManager;  
import org.apache.logging.log4j.Logger;  

public class TestLog {  
    public static void main(String[] args) {  
        Logger logger = LogManager.getLogger("runlog.test");   
        for(int i=0; i<100; i++) {
        	logger.trace("trace");  
            logger.debug("debug");  
            logger.info("hello");  
            logger.warn("warn");  
            logger.error("error");  
            logger.fatal("fatal");  
        }
    }
}
