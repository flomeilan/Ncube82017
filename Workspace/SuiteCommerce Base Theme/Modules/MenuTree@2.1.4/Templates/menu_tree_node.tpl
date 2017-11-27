{{!
	© 2017 NetSuite Inc.
	User may not copy, modify, distribute, or re-bundle or otherwise make available this code;
	provided, however, if you are an authorized user with a NetSuite account or log-in, you
	may use this code subject to the terms that govern your access and use.
}}

{{#if node.showChildren}}

<div class="menu-tree-node" data-type="menu-tree-node-expandable" data-type="menu-tree-node-expandable" data-id='{{node.id}}' data-permissions="{{node.permission}}" data-permissions-operator="{{node.permissionOperator}}">

	<a class="menu-tree-node-item-anchor" data-target="#menu-tree-node-{{node.id}}" data-action="expander" data-id="{{node.id}}">
		{{node.name}}
		<i class="menu-tree-node-item-icon"></i>
	</a>

	<div id="menu-tree-node-{{node.id}}" data-type="menu-tree-node-expander" class="menu-tree-node-submenu menu-tree-node-submenu-level-{{level}} collapse">
		<div class="menu-tree-node-submenu-wrapper" data-view="MenuItems.Collection"></div>
	</div>

</div>

{{else}}

<div class="menu-tree-node" data-type="menu-tree-node" data-permissions="{{node.permission}}" data-permissions-operator="{{node.permissionOperator}}">

	<a class="menu-tree-node-item-anchor" href="{{node.url}}" target="{{node.target}}" data-id="{{node.id}}">{{node.name}}</a>

</div>

{{/if}}



{{!----
Use the following context variables when customizing this template: 
	
	node (Object)
	node.id (String)
	node.name (String)
	node.url (String)
	node.index (Number)
	node.children (Array)
	node.showChildren (Boolean)
	level (Number)

----}}
