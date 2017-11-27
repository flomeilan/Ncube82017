'use strict';

module.exports =  function ()
{
	var entries = [];

	function push()
	{
		entries.push(arguments);
	}

	function isEmpty()
	{
		return entries.length === 0;
	}

	function flush(header)
	{
		console.log('+--------------------------------------------------------------+');
		if (header)
		{
			console.log(header);
		}

		entries.forEach(function(entry)
		{
			console.log.apply(this, entry);
		});
		console.log('+--------------------------------------------------------------+');
		entries = [];
	}

	return {
			push: push
		,	isEmpty: isEmpty
		,	flush: flush
	};
};