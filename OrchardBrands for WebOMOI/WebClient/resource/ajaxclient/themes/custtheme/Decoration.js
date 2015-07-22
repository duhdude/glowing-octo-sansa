/**
 * * The custtheme decoration theme.
 */
qx.Theme.define("qx.theme.custtheme.Decoration", {
	// extend: qx.theme.modern.Decoration,
	extend : ajaxclient.theme.modern.Decoration,
	aliases : {
		decoration : "qx/decoration/Modern"
	},
	decorations : {
		"button" : {
			style : {
				radius : 7,
				//color : "#BABABA",
				startColor : "#F0F0F0",
				endColor : "#AFAFAF",
				startColorPosition : 35,
				endColorPosition : 65
			}
		},
	
        "buttongradient": {
        	style : {
                radius: 5,
                width: 1,
                innerColor: "buttongradiant-border",
                innerWidth: 2,
                startColor: "buttongradiant-label",
                endColor: "buttongradiant-border",
                startColorPosition: 2,
                endColorPosition: 50
        	}
        },
        
        "buttongradient-focused": {
        	style : {
                radius: 5,
                width: 1,
                innerColor: "buttongradiant-border-focus",
                innerWidth: 2,
                startColor: "buttongradiant-label",
                endColor: "buttongradiant-border",
                startColorPosition: 2,
                endColorPosition: 50
        	}
        },
	}
});