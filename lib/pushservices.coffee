class PushServices
    services: {}

    addService: (protocol, service) ->
        @services[protocol] = service

    getService: (protocol) ->
        return @services[protocol]

    push: (subscriber, subOptions, payload, cb) ->
        subscriber.get (info) =>
            try
                if info then @services[info.proto]?.push(subscriber, subOptions, payload)
            catch e
                logger.log 'push error ' + e
            cb() if cb
            

exports.PushServices = PushServices
