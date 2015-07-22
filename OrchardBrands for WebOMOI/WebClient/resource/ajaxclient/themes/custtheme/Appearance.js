/* ************************************************************************ */

qx.Theme.define("qx.theme.custtheme.Appearance", {
	// extend: qx.theme.modern.Appearance,
	extend : ajaxclient.theme.modern.Appearance,

	appearances : {

		"checkboxbig" : {
			alias : "atom",

			style : function(states) {
				var icon;
				if (states.checked) {
					icon = "resource/ajaxclient/themes/custtheme/checked.png";
				} else if (states.undetermined) {
					icon = "decoration/form/undetermined.png";
				} else {
					icon = "qx/static/blank.gif";
				}

				return {
					icon : icon,
					minWidth : 14,
					gap : 8,
					paddingLeft : 4
				};
			}
		},

		"checkboxbig/icon" : {
			style : function(states) {
				var decorator;
				if (states.disabled) {
					decorator = "checkbox-disabled";
				} else if (states.focused) {
					decorator = "checkbox-focused";
				} else if (states.hovered) {
					decorator = "checkbox-hovered";
				} else {
					decorator = "checkbox";
				}

				decorator += states.invalid && !states.disabled ? "-invalid" : "";

				var padding = states.undetermined ? [ 3, 1 ] : 1;
				
				return {
					decorator : decorator,
					padding : padding,
					width : 17,
					height : 17
				};
			}
		},
		
		"buttongradient" : {
			style : function(states) {
				var decorator;
				if (states.focused) {
					decorator = "buttongradient-focused";
				} else {
					decorator = "buttongradient";
				}
				
				return {
					decorator : decorator,
					textColor : states.hovered ? "buttongradiant-label-hover" : "buttongradiant-label"
				}
			}
		},

	}
});
