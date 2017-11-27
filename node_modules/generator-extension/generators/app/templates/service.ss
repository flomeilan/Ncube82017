
function service(request, response)
{
	'use strict';
	try 
	{
		require('<%= module_name %>.ServiceController').handle(request, response);
	} 
	catch(ex)
	{
		console.log('<%= module_name %>.ServiceController ', ex);
		var controller = require('ServiceController');
		controller.response = response;
		controller.request = request;
		controller.sendError(ex);
	}
}