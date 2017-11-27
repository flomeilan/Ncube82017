/* jshint node: true */
var _ = require('underscore');

'use strict';

// OPERATORS DEFINITIONS
// https://webservices.na1.netsuite.com/xsd/platform/v2015_1_0/coreTypes.xsd

var SearchHelper = {

	formatSearchResponse: function(response)
	{
		//console.log(JSON.stringify(response, null, 4));

		var records = response.searchResponse[0].searchResult[0].recordList[0].record;
		var status = response.searchResponse[0].searchResult[0].status[0].statusDetail;

		if (Array.isArray(records))
		{
			records = this.formatResponseRecordList(records);
		}
		else
		{
			records = [];
		}

		return {
			status: status
		,	records: records
		};
	}

,	formatUpdateResponse: function (response)
	{
		var internalId = response.updateResponse[0].writeResponse[0].baseRef[0].$.internalId;
		var status = response.updateResponse[0].writeResponse[0].status[0].$.isSuccess;

		return {
			status: status
		,	internalId: internalId
		};
	}


,	formatResponseRecordList: function(recordList)
	{
		return _.map(recordList, this.formatResponseRecord, this);
	}

,	formatResponseRecord: function (record)
	{
		var self = this;
		var cleanrecord;

		//console.log(record);
		//console.log(typeof(record));

		if (Array.isArray(record))
		{
			if (record.length === 1 && typeof record[0] === "string")
			{
				cleanrecord = self.formatResponseRecord(record[0]);
			}
			else
			{
				cleanrecord = [];

				record.forEach(function(subrecord)
				{
					cleanrecord.push(self.formatResponseRecord(subrecord));
				});
			}

		}
		else if (typeof record === "object")
		{
			cleanrecord = {};

			Object.keys(record).forEach(function(key)
			{
				cleanrecord[key] = self.formatResponseRecord(record[key]);
			});

			if (!record.internalId && record.$ && record.$.internalId)
			{
				cleanrecord.internalId = (/^\d+$/.test(record.$.internalId))? parseInt(record.$.internalId) : record.$.internalId;
			}

		}
		else
		{
			if (typeof record === 'string')
			{
				try
				{
					record = JSON.parse(record);
				}
				catch (err) {}
			}

			cleanrecord = record;
		}

		return cleanrecord;
	}


,	generateSearchFilters: function(fieldsAvailable, fieldsValues)
	{
		var self = this;

		var filters = {};

		var filterTypeHandlers = {
			'boolean'  : self.generateBooleanSearchFilter
		,	'enum'     : self.generateEnumSearchFilter
		,	'recordRef': self.generateRecordRefSearchFilter
		,	'string'   : self.generateStringSearchFilter
		,	'long'     : self.generateLongSearchFilter
		,	'integer'  : self.generateLongSearchFilter
		,	'double'   : self.generateDoubleSearchFilter
		};

		_(fieldsAvailable).forEach(function(filterType, filterName)
		{
			var filterParams = fieldsValues[filterName];

			if (_.isUndefined(filterParams))
			{
				return false;
			}

			var filterHandler = filterTypeHandlers[filterType];

			if (_.isUndefined(filterHandler))
			{
				throw '"' + filterType + '" is an invalid filter type.';
			}

			var generatedFilter = filterHandler.apply(self, [filterParams]);

			//console.log(generatedFilter); process.exit(0);

			filters[filterName] = generatedFilter;
		});

		return filters;
	}


,	generateBooleanSearchFilter: function(value)
	{
		return {
			searchValue: JSON.stringify(value)// true or false string
		};
	}

,	generateStringSearchFilter: function(params)
	{
		var value = params.value || params;

		// POSSIBLE OPERATORS:
		// contains, doesNotContain, doesNotStartWith, empty, hasKeywords, is, isNot, notEmpty, startsWith
		var operator = params.operator || 'is';

		return {
			type: 'SearchStringField'
		,	operator: operator
		,	searchValue: value
		};
	}


,	generateMultiSelectSearchFilter: function(params)
	{
		var values = params.value || params.values || params;
		var recordType = params.type || params.recordType || 'RecordRef';

		values = Array.isArray(values)? values : [ values ];

		// POSSIBLE OPERATORS: anyOf, noneOf
		var operator = params.operator || 'anyOf';

		return {
			type: 'SearchMultiSelectField'
		,	operator: operator
		,	searchValue: _(values).map(function(internalId)
			{
				return { type: recordType,	internalId: internalId + '' }
			})
		};
	}


,	generateRecordRefSearchFilter: function(values)
	{
		var params = {
			recordType: 'RecordRef'
		,	values: values
		};

		return this.generateMultiSelectSearchFilter(params);
	}


,	generateEnumSearchFilter: function(values)
	{
		values = Array.isArray(values)? values : [ values ];

		// POSSIBLE OPERATORS: anyOf, noneOf
		var operator = values.operator || 'anyOf';

		return {
			type: 'SearchEnumMultiSelectField'
		,	operator: operator
		,	searchValue: values
		};
	}

,	generateDoubleSearchFilter: function(params)
	{
		return this.generateNumberSearchFilter(params, 'SearchDoubleField')
	}

,	generateLongSearchFilter: function(params)
	{
		return this.generateNumberSearchFilter(params, 'SearchLongField')
	}

,	generateNumberSearchFilter: function(params)
	{
		if (!_(params).isObject())
		{
			params = {
				value: params
			};
		}

		var fieldType = params.fieldType || 'SearchLongField';

		// POSSIBLE OPERATORS:
		// equalTo, between, empty, greaterThan, greaterThanOrEqualTo, lessThan, lessThanOrEqualTo
		// notBetween, notEmpty, notEqualTo, notGreaterThan, notGreaterThanOrEqualTo, notLessThan, notLessThanOrEqualTo
		var operator = params.operator || 'equalTo';

		var record = {
			type: fieldType
		,	operator: operator
		};

		if (['empty', 'notEmpty'].indexOf(record.operator) === -1)
		{
			record.searchValue = params.value + '';
		}

		return record;
	}
};

module.exports = SearchHelper;