package com.example.mylibrary;

import android.util.Log;

public aspect LogAspect {

    private static final String TAG = "MyLibrary-Log";

    pointcut publicMethodExecuted():
        execution(public * *(..));

    before(): publicMethodExecuted() {
    
        String message1 = String.format("Call: %s", thisJoinPoint.getSignature());
        Log.d(TAG, message1);

        Object[] arguments = thisJoinPoint.getArgs();
        for (int i = 0; i < arguments.length; i ++) {
            Object argument = arguments[i];
            String argStr =
                argument == null ?
                " = null" :
                String.format(
                    ": %s = \"%s\"", argument.getClass().toString(), argument);
            String message2 = String.format(
                "  arg %2d%s", i + 1, argStr);
            Log.d(TAG, message2);
        }
    }
}
