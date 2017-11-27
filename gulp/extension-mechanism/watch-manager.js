module.exports = {

	registerWatch: function (files, tasks)
	{
		this.watch = this.watch || [];
		this.watch.push({files, tasks});
	},

	getWatch: function()
	{
		this.watch = this.watch || [];
		return this.watch;
	}	
};