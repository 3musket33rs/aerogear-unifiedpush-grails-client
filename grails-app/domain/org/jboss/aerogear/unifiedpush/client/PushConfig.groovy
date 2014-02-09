package org.jboss.aerogear.unifiedpush.client
/**
 * Domain class that holds a specific Push Configuration needed for sending an {org.jboss.aerogear.unifiedpush.message.UnifiedMessage} to
 * a Unified Push Server Instance
 */
class PushConfig {

    String description

    String pushApplicationId

    String masterSecret

    String serverURL

    static constraints = {
    }
}
