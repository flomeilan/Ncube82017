'use strict';

var rp = require('request-promise')
,	_ = require('underscore');

var RequestHelper = {
	
	queue: []

,	count: 0

,	reslet_mode: false
	
,	MAX_RETRIES: 3

,	credentials: null

,	setCredentials: function setCredentials(credentials)
	{
		this.credentials = credentials;
	}
	
,	request: function request(options, promise)
	{
		var self = this;
		var promise = new Promise(function(resolve, reject){
            
			var execute_promise = function execute_promise(){
				return self.doRequest(options).then(resolve, reject);
            };
			
			//We queue requests to lead with concurrent requests governance
            self.queue.push(execute_promise);
            self.run_queue();
        });
		return promise;
	}
	
,	run_queue: function run_queue()
	{
		var self = this;
	
        while(this.count < 5 && self.queue.length){
            var head = _.first(self.queue);
            self.queue = _.rest(self.queue);
			
			self.count++;

			var callback = function(){
				self.count--;
                self.run_queue();
            };
            head().then(callback, callback);
        }
	}

, 	doRequest: function doRequest(options)
	{
		var self = this;

		options = !options.retries ? {
			uri: options.url
		,	method: options.method
		,	json: true
		,	body: options.data
		,	timeout: options.timeout * 1000
		} : options;

		if(self.reslet_mode)
		{
			var auth_header = 'NLAuth nlauth_account=' + self.credentials.account + ', ' +
						 'nlauth_email=' + self.credentials.email + ', ' +
						 'nlauth_signature=' + self.credentials.password + ', ' +
						 'nlauth_role=' + self.credentials.roleId;

			options.headers = {
				'Accept': '*/*'
			,	'Accept-Language': 'en-us'
			,	'Authorization': auth_header
			,	'Content-Type': 'application/json'
			};
		}

		return rp(options)
		.then(function(response)
		{
			if(response.header && response.header.status.code !== 'SUCCESS')
			{
				return Promise.reject(response.header.status.message);
			}

			return response;
		})
		.catch(function(error)
		{
			//HEADS UP! cannot use || here because options.retries could be 0
			options.retries = (_.isUndefined(options.retries) ? self.MAX_RETRIES : options.retries) - 1;
			if(options.retries > 0)
			{
				console.log('Retrying... ' + options.retries + ' left.');
				return self.request(options);
			}

			return Promise.reject(error);
		});
	}
};

module.exports = RequestHelper;