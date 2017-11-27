/*
Developer tools gulp integration tests and unit tests

#Usage

Run all specs:

	$ node gulp/spec

Run just a couple:

	$ node gulp/spec --specs templates-spec,ssp-files-specs

Also you can instruct to exit on the first fail:

	$ node gulp/spec --exitOnFail

*/

var _ = require('underscore')
,	shell = require('shelljs')
,	path = require('path')
,	glob = require('glob').sync
,	Jasmine = require('jasmine')
,	args = require('yargs').argv;

function installExitOnFail(runner)
{
	var SpecReporter = require('jasmine-spec-reporter')
	var exitOnFailReporter = new SpecReporter({displayStacktrace: true});
	var specDone = exitOnFailReporter.specDone
	exitOnFailReporter.specDone = function(result)
	{
		if(result.status === 'failed')
		{
			console.log(outpcolors.red('\nFailed test: ' + result.fullName +
				'\nReason: '+result.failedExpectations[0].message) +
				'\n' + result.failedExpectations[0].stackut);
			process.exit(1);
		}
		else
		{
			specDone.apply(exitOnFailReporter, arguments)
		}
	};
	runner.addReporter(exitOnFailReporter);
}

var jasmineRunner = new Jasmine();
if(args.exitOnFail)
{
	installExitOnFail(jasmineRunner);
}
jasmine.DEFAULT_TIMEOUT_INTERVAL = 99999999;

var specs;

if (args.specs)
{
	specs = args.specs.split(',').map((spec) => path.join(__dirname, spec) );
}
else
{
	specs = glob(path.join(__dirname, '*-spec.js'));
}

jasmineRunner.specFiles = specs;
jasmineRunner.execute();
