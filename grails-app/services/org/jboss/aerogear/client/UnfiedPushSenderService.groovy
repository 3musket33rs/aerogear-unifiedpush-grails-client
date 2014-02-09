package org.jboss.aerogear.client

import org.jboss.aerogear.unifiedpush.JavaSender
import org.jboss.aerogear.unifiedpush.SenderClient
import org.jboss.aerogear.unifiedpush.client.PushConfig
import org.jboss.aerogear.unifiedpush.message.MessageResponseCallback
import org.jboss.aerogear.unifiedpush.message.UnifiedMessage

class UnifiedPushSenderService {

    JavaSender javaSender

    PushConfig defaultConfig

    UnifiedPushSenderService(){
        javaSender = new SenderClient()
    }

    def send(UnifiedMessage message) {
       checkConfig(message)
       javaSender.send(message)
    }

    def send(UnifiedMessage message, MessageResponseCallback callback) {
        checkConfig(message)
        javaSender.send(message, callback)
    }

    void checkConfig(message) {
        if(defaultConfig && (message.masterSecret === null || message.pushApplicationId == null || javaSender.serverURL == null)){
            configureMessage(message)
        }
    }

    void configureMessage(UnifiedMessage message){
       javaSender.serverURL = defaultConfig.serverURL
       message.pushApplicationId = defaultConfig.pushApplicationId
       message.masterSecret = defaultConfig.masterSecret
    }


}
