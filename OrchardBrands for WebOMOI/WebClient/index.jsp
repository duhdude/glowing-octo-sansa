<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <!--<meta name="servleturl" content="http://localhost:8080/client" />-->
    <title>LegaSuite Web Client</title>
    <style type="text/css">
        html {
            height: 100%;
        }

        body {
            background: url(resource/ajaxclient/icons/loader.gif) no-repeat center center;
        }
    </style>

    <script type="text/javascript">
        //<![CDATA[
        /*
         * Add HTML client parameters here ...
         */
        function ls_init() {
            var params = ajaxclient.Parameters.getInstance();
            params.addParameter('theme', 'custtheme');
            params.addParameter('BrowserEmbedded', 'yes');
            params.addParameter('FontUsage', '0');
            params.addParameter('NoSplash', 'yes');
            params.addParameter('SystemMenu', '0');
            params.addParameter('TitleBar', 'no');
            params.addParameter('@RemoteAddr', '<%= request.getRemoteAddr() %>');
            params.addParameter('@UserAgent', '<%= request.getHeader("User-Agent") %>');
        }

        function startClient() {
            var head = document.getElementsByTagName("head")[0];
            var ajaxJS = document.createElement('script');
            ajaxJS.setAttribute("type", "text/javascript");
            ajaxJS.setAttribute("src", 'script/ajaxclient.js');
            head.appendChild(ajaxJS);
        }

        function onClientStart() {
            qx.$$packageData['0']['resources']['ajaxclient/icons/16/wait.gif'][0] = 84;
			qx.$$packageData['0']['resources']['ajaxclient/icons/16/wait.gif'][1] = 84;
        }

        //]]>
    </script>
</head>
<body onload="startClient()"></body>
</html>
