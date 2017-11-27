{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

<div class="transaction-line-views-selected-option" name="{{label}}">
	<p>
		<span class="transaction-line-views-selected-option-label">{{label}}: </span>
		<span class="transaction-line-views-selected-option-value">{{selectedValue.label}}</span>
	</p>
</div>



{{!----
Use the following context variables when customizing this template: 
	
	model (Object)
	model.cartOptionId (String)
	model.itemOptionId (String)
	model.label (String)
	model.type (String)
	model.value (Object)
	model.value.label (String)
	model.value.internalid (String)
	values (Array)
	showSelectedValue (Boolean)
	isMandatory (Boolean)
	itemOptionId (String)
	cartOptionId (String)
	label (String)
	selectedValue (Object)
	selectedValue.label (String)
	selectedValue.internalid (String)
	selectedValue.isAvailable (Boolean)
	selectedValue.isActive (Boolean)
	selectedValue.color (String)
	selectedValue.isColorTile (Boolean)
	selectedValue.isImageTile (Boolean)
	selectedValue.image (Object)
	selectedValue.isLightColor (Boolean)
	isTextArea (Boolean)
	isEmail (Boolean)
	isText (Boolean)
	isSelect (Boolean)
	isCheckbox (Boolean)
	isDate (Boolean)
	htmlId (String)
	htmlIdContainer (String)

----}}
