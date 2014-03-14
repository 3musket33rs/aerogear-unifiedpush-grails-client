package org.jboss.aerogear.unifiedpush.client

import org.jboss.aerogear.unifiedpush.message.MessageResponseCallback
import org.jboss.aerogear.unifiedpush.message.UnifiedMessage
import org.springframework.dao.DataIntegrityViolationException

class PushConfigController {

    def unifiedPushSenderService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [pushConfigInstanceList: PushConfig.list(params), pushConfigInstanceTotal: PushConfig.count()]
    }

    def create() {
        [pushConfigInstance: new PushConfig(params)]
    }

    def save() {
        def pushConfigInstance = new PushConfig(params)
        if (!pushConfigInstance.save(flush: true)) {
            render(view: "create", model: [pushConfigInstance: pushConfigInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'pushConfig.label', default: 'PushConfig'), pushConfigInstance.id])
        redirect(action: "show", id: pushConfigInstance.id)
    }

    def show(Long id) {
        def pushConfigInstance = PushConfig.get(id)
        if (!pushConfigInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pushConfig.label', default: 'PushConfig'), id])
            redirect(action: "list")
            return
        }

        [pushConfigInstance: pushConfigInstance]
    }

    def edit(Long id) {
        def pushConfigInstance = PushConfig.get(id)
        if (!pushConfigInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pushConfig.label', default: 'PushConfig'), id])
            redirect(action: "list")
            return
        }

        [pushConfigInstance: pushConfigInstance]
    }

    def update(Long id, Long version) {
        def pushConfigInstance = PushConfig.get(id)
        if (!pushConfigInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pushConfig.label', default: 'PushConfig'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (pushConfigInstance.version > version) {
                pushConfigInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pushConfig.label', default: 'PushConfig')] as Object[],
                          "Another user has updated this PushConfig while you were editing")
                render(view: "edit", model: [pushConfigInstance: pushConfigInstance])
                return
            }
        }

        pushConfigInstance.properties = params

        if (!pushConfigInstance.save(flush: true)) {
            render(view: "edit", model: [pushConfigInstance: pushConfigInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'pushConfig.label', default: 'PushConfig'), pushConfigInstance.id])
        redirect(action: "show", id: pushConfigInstance.id)
    }

    def delete(Long id) {
        def pushConfigInstance = PushConfig.get(id)
        if (!pushConfigInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pushConfig.label', default: 'PushConfig'), id])
            redirect(action: "list")
            return
        }

        try {
            pushConfigInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pushConfig.label', default: 'PushConfig'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pushConfig.label', default: 'PushConfig'), id])
            redirect(action: "show", id: id)
        }
    }

    def sendMessage() {
        def pushConfig = PushConfig.get(params.id)

        unifiedPushSenderService.defaultConfig = pushConfig
        def unifiedMessage = new UnifiedMessage.Builder()
                alert params.testMessage
                build()
        MessageResponseCallback callback = new MessageResponseCallback() {

            @Override
            public void onComplete(int statusCode) {
                println statusCode
                render "message sent"

            }

            @Override
            public void onError(Throwable throwable) {
                render "message error"
            }
        };
        unifiedPushSenderService.send(unifiedMessage,callback)

    }
}
