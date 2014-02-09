# Aerogear Unifiedpush Grails Client

A Grails Plugin for sending Push Notifications to the [AeroGear UnifiedPush Server](https://github.com/aerogear/aerogear-unifiedpush-server). For more information, please visit the [Java Sender Tutorial](http://aerogear.org/docs/guides/GetStartedwithJavaSender/) for example usages.

## Getting started

Dependency in ``` BuildConfig.groovy```

```
compile ":aerogear-unified-push-client:0.0.1"

```


## Usage

Inject the ``` aerogear-unified-push-client ``` in your controller or service :

```

def aerogearUnifiedPushClient

 ```

Create a Push Configuration and configure the service:

```

def pushConfig = new PushConfig(serverURL: "http://my.server.com", pushApplicationId: "myPushApplicationId", masterSecret: "myMasterSecret")
//It's a domain object you can persist it if you want
pushConfig.save()

// Set the default Push Config
aerogearUnifiedPushClient.defaultConfig = pushConfig


```

Create a UnfiedPush message :

```

def  unifiedMessage = new UnifiedMessage.Builder()
                    .aliases(Arrays.asList("john", "maria"))
                    .alert("Hello from Java Sender API!")
                    .sound("default")
                    .build();

```

Create a callback (Optional)

```

MessageResponseCallback callback = new MessageResponseCallback() {

            @Override
            public void onComplete(int statusCode) {
              //do cool stuff
            }

            @Override
            public void onError(Throwable throwable) {
              //bring out the bad news
            }
        };

```

### Send a message



``` aerogearUnifiedPushClient.send(unifiedMessage, callback) ```


You can also omit the callback


``` aerogearUnifiedPushClient.send(unifiedMessage) ```


## Known issues

On Java7 you might see a ```SSLProtocolException: handshake alert: unrecognized_name``` expection when the UnifiedPush server is running on https. There are a few workarounds:

* JBoss' ```standalone.xml``` configuration file:
```
<system-properties>
   <property name="jsse.enableSNIExtension" value="false"/>
</system-properties>
```

* in the Java app, that is _using_ the Java Client SDK: ```System.setProperty("jsse.enableSNIExtension", "false");```
* Or via commandline argument: ```-Djsse.enableSNIExtension=false```