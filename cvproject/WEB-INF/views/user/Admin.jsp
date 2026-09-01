<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="<c:url value="/resources/user/css/bootstrap.min.css"/>"  type="text/css" ></link>
<script  src="<c:url value="/resources/user/js/bootstrap.min.js"/>"  type="text/javascript"></script> 
<%-- <script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script> --%>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.buttons.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.print.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.html5.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.flash.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/pdfmake.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jszip.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/vfs_fonts.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.dataTables.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> 

<script src="<c:url value="https://code.jquery.com/jquery-1.12.4.js"/>" type="text/javascript"></script>
<script src="<c:url value="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="https://cdn.datatables.net/select/1.2.5/js/dataTables.select.min.js"/>" type="text/javascript"></script> 
<link rel="stylesheet" href="<c:url value="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="https://cdn.datatables.net/select/1.2.5/css/select.dataTables.min.css"/>"  type="text/css" ></link>

<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.checkboxes.css"/>"  type="text/css" ></link>
<script src="<c:url value="/resources/user/js/dataTables.checkboxes.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.checkboxes.js"/>" type="text/javascript"></script>



<html>



<!-- 
<script type="text/javascript">

$body = $("body");

$(document).on({
    ajaxStart: function() { $body.addClass("loading");    },
     ajaxStop: function() { $body.removeClass("loading"); }    
});

// Initiates an AJAX request on click
/* $(document).on("click", function(){
    $.get("/mockjax");        
});
 */
/*!
 * MockJax - jQuery Plugin to Mock Ajax requests
 *
 * Version:  1.5.3
 * Released:
 * Home:   http://github.com/appendto/jquery-mockjax
 * Author:   Jonathan Sharp (http://jdsharp.com)
 * License:  MIT,GPL
 *
 * Copyright (c) 2011 appendTo LLC.
 * Dual licensed under the MIT or GPL licenses.
 * http://appendto.com/open-source-licenses
 */ (function($) {
    var _ajax = $.ajax,
        mockHandlers = [],
        mockedAjaxCalls = [],
        CALLBACK_REGEX = /=\?(&|$)/,
        jsc = (new Date()).getTime();


    // Parse the given XML string.
    function parseXML(xml) {
        if (window.DOMParser == undefined && window.ActiveXObject) {
            DOMParser = function() {};
            DOMParser.prototype.parseFromString = function(xmlString) {
                var doc = new ActiveXObject('Microsoft.XMLDOM');
                doc.async = 'false';
                doc.loadXML(xmlString);
                return doc;
            };
        }

        try {
            var xmlDoc = (new DOMParser()).parseFromString(xml, 'text/xml');
            if ($.isXMLDoc(xmlDoc)) {
                var err = $('parsererror', xmlDoc);
                if (err.length == 1) {
                    throw ('Error: ' + $(xmlDoc).text());
                }
            } else {
                throw ('Unable to parse XML');
            }
            return xmlDoc;
        } catch (e) {
            var msg = (e.name == undefined ? e : e.name + ': ' + e.message);
            $(document).trigger('xmlParseError', [msg]);
            return undefined;
        }
    }

    // Trigger a jQuery event
    function trigger(s, type, args) {
        (s.context ? $(s.context) : $.event).trigger(type, args);
    }

    // Check if the data field on the mock handler and the request match. This
    // can be used to restrict a mock handler to being used only when a certain
    // set of data is passed to it.
    function isMockDataEqual(mock, live) {
        var identical = true;
        // Test for situations where the data is a querystring (not an object)
        if (typeof live === 'string') {
            // Querystring may be a regex
            return $.isFunction(mock.test) ? mock.test(live) : mock == live;
        }
        $.each(mock, function(k) {
            if (live[k] === undefined) {
                identical = false;
                return identical;
            } else {
                // This will allow to compare Arrays
                if (typeof live[k] === 'object' && live[k] !== null) {
                    identical = identical && isMockDataEqual(mock[k], live[k]);
                } else {
                    if (mock[k] && $.isFunction(mock[k].test)) {
                        identical = identical && mock[k].test(live[k]);
                    } else {
                        identical = identical && (mock[k] == live[k]);
                    }
                }
            }
        });

        return identical;
    }

    // See if a mock handler property matches the default settings
    function isDefaultSetting(handler, property) {
        return handler[property] === $.mockjaxSettings[property];
    }

    // Check the given handler should mock the given request
    function getMockForRequest(handler, requestSettings) {
        // If the mock was registered with a function, let the function decide if we
        // want to mock this request
        if ($.isFunction(handler)) {
            return handler(requestSettings);
        }

        // Inspect the URL of the request and check if the mock handler's url
        // matches the url for this ajax request
        if ($.isFunction(handler.url.test)) {
            // The user provided a regex for the url, test it
            if (!handler.url.test(requestSettings.url)) {
                return null;
            }
        } else {
            // Look for a simple wildcard '*' or a direct URL match
            var star = handler.url.indexOf('*');
            if (handler.url !== requestSettings.url && star === -1 || !new RegExp(handler.url.replace(/[-[\]{}()+?.,\\^$|#\s]/g, "\\$&").replace(/\*/g, '.+')).test(requestSettings.url)) {
                return null;
            }
        }

        // Inspect the data submitted in the request (either POST body or GET query string)
        if (handler.data && requestSettings.data) {
            if (!isMockDataEqual(handler.data, requestSettings.data)) {
                // They're not identical, do not mock this request
                return null;
            }
        }
        // Inspect the request type
        if (handler && handler.type && handler.type.toLowerCase() != requestSettings.type.toLowerCase()) {
            // The request type doesn't match (GET vs. POST)
            return null;
        }

        return handler;
    }

    // Process the xhr objects send operation
    function _xhrSend(mockHandler, requestSettings, origSettings) {

        // This is a substitute for < 1.4 which lacks $.proxy
        var process = (function(that) {
            return function() {
                return (function() {
                    var onReady;

                    // The request has returned
                    this.status = mockHandler.status;
                    this.statusText = mockHandler.statusText;
                    this.readyState = 4;

                    // We have an executable function, call it to give
                    // the mock handler a chance to update it's data
                    if ($.isFunction(mockHandler.response)) {
                        mockHandler.response(origSettings);
                    }
                    // Copy over our mock to our xhr object before passing control back to
                    // jQuery's onreadystatechange callback
                    if (requestSettings.dataType == 'json' && (typeof mockHandler.responseText == 'object')) {
                        this.responseText = JSON.stringify(mockHandler.responseText);
                    } else if (requestSettings.dataType == 'xml') {
                        if (typeof mockHandler.responseXML == 'string') {
                            this.responseXML = parseXML(mockHandler.responseXML);
                            //in jQuery 1.9.1+, responseXML is processed differently and relies on responseText
                            this.responseText = mockHandler.responseXML;
                        } else {
                            this.responseXML = mockHandler.responseXML;
                        }
                    } else {
                        this.responseText = mockHandler.responseText;
                    }
                    if (typeof mockHandler.status == 'number' || typeof mockHandler.status == 'string') {
                        this.status = mockHandler.status;
                    }
                    if (typeof mockHandler.statusText === "string") {
                        this.statusText = mockHandler.statusText;
                    }
                    // jQuery 2.0 renamed onreadystatechange to onload
                    onReady = this.onreadystatechange || this.onload;

                    // jQuery < 1.4 doesn't have onreadystate change for xhr
                    if ($.isFunction(onReady)) {
                        if (mockHandler.isTimeout) {
                            this.status = -1;
                        }
                        onReady.call(this, mockHandler.isTimeout ? 'timeout' : undefined);
                    } else if (mockHandler.isTimeout) {
                        // Fix for 1.3.2 timeout to keep success from firing.
                        this.status = -1;
                    }
                }).apply(that);
            };
        })(this);

        if (mockHandler.proxy) {
            // We're proxying this request and loading in an external file instead
            _ajax({
                global: false,
                url: mockHandler.proxy,
                type: mockHandler.proxyType,
                data: mockHandler.data,
                dataType: requestSettings.dataType === "script" ? "text/plain" : requestSettings.dataType,
                complete: function(xhr) {
                    mockHandler.responseXML = xhr.responseXML;
                    mockHandler.responseText = xhr.responseText;
                    // Don't override the handler status/statusText if it's specified by the config
                    if (isDefaultSetting(mockHandler, 'status')) {
                        mockHandler.status = xhr.status;
                    }
                    if (isDefaultSetting(mockHandler, 'statusText')) {
                        mockHandler.statusText = xhr.statusText;
                    }

                    this.responseTimer = setTimeout(process, mockHandler.responseTime || 0);
                }
            });
        } else {
            // type == 'POST' || 'GET' || 'DELETE'
            if (requestSettings.async === false) {
                // TODO: Blocking delay
                process();
            } else {
                this.responseTimer = setTimeout(process, mockHandler.responseTime || 50);
            }
        }
    }

    // Construct a mocked XHR Object
    function xhr(mockHandler, requestSettings, origSettings, origHandler) {
        // Extend with our default mockjax settings
        mockHandler = $.extend(true, {}, $.mockjaxSettings, mockHandler);

        if (typeof mockHandler.headers === 'undefined') {
            mockHandler.headers = {};
        }
        if (mockHandler.contentType) {
            mockHandler.headers['content-type'] = mockHandler.contentType;
        }

        return {
            status: mockHandler.status,
            statusText: mockHandler.statusText,
            readyState: 1,
            open: function() {},
            send: function() {
                origHandler.fired = true;
                _xhrSend.call(this, mockHandler, requestSettings, origSettings);
            },
            abort: function() {
                clearTimeout(this.responseTimer);
            },
            setRequestHeader: function(header, value) {
                mockHandler.headers[header] = value;
            },
            getResponseHeader: function(header) {
                // 'Last-modified', 'Etag', 'content-type' are all checked by jQuery
                if (mockHandler.headers && mockHandler.headers[header]) {
                    // Return arbitrary headers
                    return mockHandler.headers[header];
                } else if (header.toLowerCase() == 'last-modified') {
                    return mockHandler.lastModified || (new Date()).toString();
                } else if (header.toLowerCase() == 'etag') {
                    return mockHandler.etag || '';
                } else if (header.toLowerCase() == 'content-type') {
                    return mockHandler.contentType || 'text/plain';
                }
            },
            getAllResponseHeaders: function() {
                var headers = '';
                $.each(mockHandler.headers, function(k, v) {
                    headers += k + ': ' + v + "\n";
                });
                return headers;
            }
        };
    }

    // Process a JSONP mock request.
    function processJsonpMock(requestSettings, mockHandler, origSettings) {
        // Handle JSONP Parameter Callbacks, we need to replicate some of the jQuery core here
        // because there isn't an easy hook for the cross domain script tag of jsonp

        processJsonpUrl(requestSettings);

        requestSettings.dataType = "json";
        if (requestSettings.data && CALLBACK_REGEX.test(requestSettings.data) || CALLBACK_REGEX.test(requestSettings.url)) {
            createJsonpCallback(requestSettings, mockHandler, origSettings);

            // We need to make sure
            // that a JSONP style response is executed properly

            var rurl = /^(\w+:)?\/\/([^\/?#]+)/,
                parts = rurl.exec(requestSettings.url),
                remote = parts && (parts[1] && parts[1] !== location.protocol || parts[2] !== location.host);

            requestSettings.dataType = "script";
            if (requestSettings.type.toUpperCase() === "GET" && remote) {
                var newMockReturn = processJsonpRequest(requestSettings, mockHandler, origSettings);

                // Check if we are supposed to return a Deferred back to the mock call, or just
                // signal success
                if (newMockReturn) {
                    return newMockReturn;
                } else {
                    return true;
                }
            }
        }
        return null;
    }

    // Append the required callback parameter to the end of the request URL, for a JSONP request
    function processJsonpUrl(requestSettings) {
        if (requestSettings.type.toUpperCase() === "GET") {
            if (!CALLBACK_REGEX.test(requestSettings.url)) {
                requestSettings.url += (/\?/.test(requestSettings.url) ? "&" : "?") + (requestSettings.jsonp || "callback") + "=?";
            }
        } else if (!requestSettings.data || !CALLBACK_REGEX.test(requestSettings.data)) {
            requestSettings.data = (requestSettings.data ? requestSettings.data + "&" : "") + (requestSettings.jsonp || "callback") + "=?";
        }
    }

    // Process a JSONP request by evaluating the mocked response text
    function processJsonpRequest(requestSettings, mockHandler, origSettings) {
        // Synthesize the mock request for adding a script tag
        var callbackContext = origSettings && origSettings.context || requestSettings,
            newMock = null;


        // If the response handler on the moock is a function, call it
        if (mockHandler.response && $.isFunction(mockHandler.response)) {
            mockHandler.response(origSettings);
        } else {

            // Evaluate the responseText javascript in a global context
            if (typeof mockHandler.responseText === 'object') {
                $.globalEval('(' + JSON.stringify(mockHandler.responseText) + ')');
            } else {
                $.globalEval('(' + mockHandler.responseText + ')');
            }
        }

        // Successful response
        jsonpSuccess(requestSettings, callbackContext, mockHandler);
        jsonpComplete(requestSettings, callbackContext, mockHandler);

        // If we are running under jQuery 1.5+, return a deferred object
        if ($.Deferred) {
            newMock = new $.Deferred();
            if (typeof mockHandler.responseText == "object") {
                newMock.resolveWith(callbackContext, [mockHandler.responseText]);
            } else {
                newMock.resolveWith(callbackContext, [$.parseJSON(mockHandler.responseText)]);
            }
        }
        return newMock;
    }


    // Create the required JSONP callback function for the request
    function createJsonpCallback(requestSettings, mockHandler, origSettings) {
        var callbackContext = origSettings && origSettings.context || requestSettings;
        var jsonp = requestSettings.jsonpCallback || ("jsonp" + jsc++);

        // Replace the =? sequence both in the query string and the data
        if (requestSettings.data) {
            requestSettings.data = (requestSettings.data + "").replace(CALLBACK_REGEX, "=" + jsonp + "$1");
        }

        requestSettings.url = requestSettings.url.replace(CALLBACK_REGEX, "=" + jsonp + "$1");


        // Handle JSONP-style loading
        window[jsonp] = window[jsonp] || function(tmp) {
            data = tmp;
            jsonpSuccess(requestSettings, callbackContext, mockHandler);
            jsonpComplete(requestSettings, callbackContext, mockHandler);
            // Garbage collect
            window[jsonp] = undefined;

            try {
                delete window[jsonp];
            } catch (e) {}

            if (head) {
                head.removeChild(script);
            }
        };
    }

    // The JSONP request was successful
    function jsonpSuccess(requestSettings, callbackContext, mockHandler) {
        // If a local callback was specified, fire it and pass it the data
        if (requestSettings.success) {
            requestSettings.success.call(callbackContext, mockHandler.responseText || "", status, {});
        }

        // Fire the global callback
        if (requestSettings.global) {
            trigger(requestSettings, "ajaxSuccess", [{},
            requestSettings]);
        }
    }

    // The JSONP request was completed
    function jsonpComplete(requestSettings, callbackContext) {
        // Process result
        if (requestSettings.complete) {
            requestSettings.complete.call(callbackContext, {}, status);
        }

        // The request was completed
        if (requestSettings.global) {
            trigger("ajaxComplete", [{},
            requestSettings]);
        }

        // Handle the global AJAX counter
        if (requestSettings.global && !--$.active) {
            $.event.trigger("ajaxStop");
        }
    }


    // The core $.ajax replacement.
    function handleAjax(url, origSettings) {
        var mockRequest, requestSettings, mockHandler;

        // If url is an object, simulate pre-1.5 signature
        if (typeof url === "object") {
            origSettings = url;
            url = undefined;
        } else {
            // work around to support 1.5 signature
            origSettings.url = url;
        }

        // Extend the original settings for the request
        requestSettings = $.extend(true, {}, $.ajaxSettings, origSettings);

        // Iterate over our mock handlers (in registration order) until we find
        // one that is willing to intercept the request
        for (var k = 0; k < mockHandlers.length; k++) {
            if (!mockHandlers[k]) {
                continue;
            }

            mockHandler = getMockForRequest(mockHandlers[k], requestSettings);
            if (!mockHandler) {
                // No valid mock found for this request
                continue;
            }

            mockedAjaxCalls.push(requestSettings);

            // If logging is enabled, log the mock to the console
            $.mockjaxSettings.log(mockHandler, requestSettings);


            if (requestSettings.dataType === "jsonp") {
                if ((mockRequest = processJsonpMock(requestSettings, mockHandler, origSettings))) {
                    // This mock will handle the JSONP request
                    return mockRequest;
                }
            }


            // Removed to fix #54 - keep the mocking data object intact
            //mockHandler.data = requestSettings.data;

            mockHandler.cache = requestSettings.cache;
            mockHandler.timeout = requestSettings.timeout;
            mockHandler.global = requestSettings.global;

            copyUrlParameters(mockHandler, origSettings);

            (function(mockHandler, requestSettings, origSettings, origHandler) {
                mockRequest = _ajax.call($, $.extend(true, {}, origSettings, {
                    // Mock the XHR object
                    xhr: function() {
                        return xhr(mockHandler, requestSettings, origSettings, origHandler);
                    }
                }));
            })(mockHandler, requestSettings, origSettings, mockHandlers[k]);

            return mockRequest;
        }

        // We don't have a mock request
        if ($.mockjaxSettings.throwUnmocked === true) {
            throw ('AJAX not mocked: ' + origSettings.url);
        } else { // trigger a normal request
            return _ajax.apply($, [origSettings]);
        }
    }

    /**
     * Copies URL parameter values if they were captured by a regular expression
     * @param {Object} mockHandler
     * @param {Object} origSettings
     */
    function copyUrlParameters(mockHandler, origSettings) {
        //parameters aren't captured if the URL isn't a RegExp
        if (!(mockHandler.url instanceof RegExp)) {
            return;
        }
        //if no URL params were defined on the handler, don't attempt a capture
        if (!mockHandler.hasOwnProperty('urlParams')) {
            return;
        }
        var captures = mockHandler.url.exec(origSettings.url);
        //the whole RegExp match is always the first value in the capture results
        if (captures.length === 1) {
            return;
        }
        captures.shift();
        //use handler params as keys and capture resuts as values
        var i = 0,
            capturesLength = captures.length,
            paramsLength = mockHandler.urlParams.length,
            //in case the number of params specified is less than actual captures
            maxIterations = Math.min(capturesLength, paramsLength),
            paramValues = {};
        for (i; i < maxIterations; i++) {
            var key = mockHandler.urlParams[i];
            paramValues[key] = captures[i];
        }
        origSettings.urlParams = paramValues;
    }


    // Public

    $.extend({
        ajax: handleAjax
    });

    $.mockjaxSettings = {
        //url:        null,
        //type:       'GET',
        log: function(mockHandler, requestSettings) {
            if (mockHandler.logging === false || (typeof mockHandler.logging === 'undefined' && $.mockjaxSettings.logging === false)) {
                return;
            }
            if (window.console && console.log) {
                var message = 'MOCK ' + requestSettings.type.toUpperCase() + ': ' + requestSettings.url;
                var request = $.extend({}, requestSettings);

                if (typeof console.log === 'function') {
                    console.log(message, request);
                } else {
                    try {
                        console.log(message + ' ' + JSON.stringify(request));
                    } catch (e) {
                        console.log(message);
                    }
                }
            }
        },
        logging: true,
        status: 200,
        statusText: "OK",
        responseTime: 500,
        isTimeout: false,
        throwUnmocked: false,
        contentType: 'text/plain',
        response: '',
        responseText: '',
        responseXML: '',
        proxy: '',
        proxyType: 'GET',

        lastModified: null,
        etag: '',
        headers: {
            etag: 'IJF@H#@923uf8023hFO@I#H#',
            'content-type': 'text/plain'
        }
    };

    $.mockjax = function(settings) {
        var i = mockHandlers.length;
        mockHandlers[i] = settings;
        return i;
    };
    $.mockjaxClear = function(i) {
        if (arguments.length == 1) {
            mockHandlers[i] = null;
        } else {
            mockHandlers = [];
        }
        mockedAjaxCalls = [];
    };
    $.mockjax.handler = function(i) {
        if (arguments.length == 1) {
            return mockHandlers[i];
        }
    };
    $.mockjax.mockedAjaxCalls = function() {
        return mockedAjaxCalls;
    };
})(jQuery);

$.mockjax({ url: "/mockjax", responseTime: 2500 });
</script>


 -->




<script type="text/javascript">

function transfer()
{
	 /* $.get("/mockjax");  */
	var account2=document.getElementById("sel_officer2").value;
	var temp=account2.split("-");
	var dairystatus=temp[0];
	
	var account1=document.getElementById("sel_officer1").value;
	var temp=account1.split("-");
	var old_dairystatus=temp[0];
	
	var complaint=null;
	
	
    
	for (var i = 0; i < $('#acc1').DataTable().rows('.selected').data().length; i++) {
		complaint=$('#acc1').DataTable().rows('.selected').data()[i].complainNo;
	     
	       $.ajax({
				type : "POST" ,
				url  : "<c:url value='/user/admin/getComplaintTransfer'/>" ,
				data : {
					"complaint":complaint,
					"dairystatus":dairystatus,
					"old_dairystatus":old_dairystatus
				},
				success : function(data) {
				getAcc1();
				getAcc2();
				
				console.log("SUCCESS: ", data);
				},
				error : function(e) {
					console.log("ERROR: ", e);
					
				},
				done : function(e) {
					console.log("DONE");
				}
			});
	       
	    }
	
		alert("Proccess Completed....");
}
$(document).ready(function() {
	var complaint='complaintTransfer';
		 $('#sel_officer').empty();
		$.ajax({
			type : "POST" ,
			url  : "<c:url value='/user/getAllOfficer'/>" ,
			data : {
				"complaint":complaint,	
			},
			success : function(data) {
				$.each(data, function(key, value) {
					$('#sel_officer1').append("<option value='" + value.officerName +"-"+value.dairyStatus + "'>" + value.officerName + ","+ value.officerDesiganation +", Section-"+ value.dairyStatus +"</option>");
					$('#sel_officer2').append("<option value='" + value.officerName +"-"+value.dairyStatus+ "'>" + value.officerName + ","+ value.officerDesiganation +", Section-"+ value.dairyStatus +"</option>");
				});

			console.log("SUCCESS: ", data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	
});


function getAcc1()
{
	var account1=document.getElementById("sel_officer1").value;
	//alert(account1);
	var temp=account1.split("-");
	var dairystatus=temp[0];
	var section=temp[1];
	//alert(dairystatus+"========="+section);
	 $.ajax({
			type : "POST",
			url : "<c:url value='/user/admin/getComplaintAcc'/>",
			data : {
				"section" : section,
				"dairystatus" : dairystatus,
				
			},
			success : function(data) {
				var table=$("#acc1").dataTable(
						{

							"sPaginationType" : "full_numbers",
							"bProcessing" : false,
							"bServerSide" : false,
							"destroy" : true,
							"orderable": false,
				            "className": 'select-checkbox',
				            "targets":   '0',
				            "checkboxes": {
				                "selectRow": true
				             },
							"bAutoWidth" : false,
							"select": {
					            "style":    'multi',
					            /* "selector": 'td:first-child' */
					        },
					        "order": [[ 1, 'asc' ]],
					        'columnDefs': [
					            {
					               'targets': 0,
					               'checkboxes': {
					                  'selectRow': true
					               }
					            }
					         ],
								
							"aaData" : data,
							
							"aoColumns" : [ 
								{

									"sTitle" : "Complaint",
									"mData" : "complainNo",
									"className" : "dt-left",

								},{

								"sTitle" : "Complaint",
								"mData" : "complainNo",
								"className" : "dt-left",

							},{

								"sTitle" : "Sender Name",
								"mData" : "senderName",
								"className" : "dt-left",

							},{
								"sTitle" : "Organization Name",
								"mData" : "organizationName",
								"className" : "dt-left",
							}, {
								"sTitle" : "Created Date",
								"mData" : "createdDate",
								"className" : "dt-left",
							}, {
								"sTitle" : "Dairy Status",
								"mData" : "dairyStatus",
								"className" : "dt-left",

							},{

								"sTitle" : "BO Decision",
								"mData" : "decision",
								"className" : "dt-left",

							}							

							],
							"dom" : 'lBfrtip',
							

							"buttons" : [
									

							],
						

						});
				
			console.log("SUCCESS: ", data);
			},

			error : function(e) {
				console.log("ERROR: ", e);
				
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	}

function getAcc2()
{
	var account1=document.getElementById("sel_officer2").value;
	//alert(account1);
	var temp=account1.split("-");
	var dairystatus=temp[0];
	var section=temp[1];
	//alert(dairystatus+"========="+section);
	 $.ajax({
			type : "POST",
			url : "<c:url value='/user/admin/getComplaintAcc'/>",
			data : {
				"section" : section,
				"dairystatus" : dairystatus,
				
			},
			success : function(data) {
				var table=$("#acc2").dataTable(
						{

							"sPaginationType" : "full_numbers",
							"bProcessing" : false,
							"bServerSide" : false,
							"destroy" : true,
							/* "bRetrieve" : false,	 */			
							"bAutoWidth" : false,		
								
							"aaData" : data,
							
							"aoColumns" : [ {

								"sTitle" : "Complaint",
								"mData" : "complainNo",
								"className" : "dt-left",

							},{

								"sTitle" : "Sender Name",
								"mData" : "senderName",
								"className" : "dt-left",

							},{
								"sTitle" : "Organization Name",
								"mData" : "organizationName",
								"className" : "dt-left",
							}, {
								"sTitle" : "Created Date",
								"mData" : "createdDate",
								"className" : "dt-left",
							}, {
								"sTitle" : "Dairy Status",
								"mData" : "dairyStatus",
								"className" : "dt-left",

							},{

								"sTitle" : "BO Decision",
								"mData" : "decision",
								"className" : "dt-left",

							}							

							],
							dom : 'lBfrtip',

							buttons : [
									{
										

									}

							]

						});
				
			console.log("SUCCESS: ", data);
			},

			error : function(e) {
				console.log("ERROR: ", e);
				
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	}


</script>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column {
    float: left;
    width: 50%;
    padding-left:100px;
    padding-right:150px;
    height: 300px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}
.modal {
    display:    none;
    position:   fixed;
    z-index:    1000;
    top:        0;
    left:       0;
    height:     100%;
    width:      100%;
    background: rgba( 255, 255, 255, .8 ) 
                url('https://i.pinimg.com/originals/ac/44/71/ac4471291c620d8dd47697a1d8da4975.gif') 
                50% 50% 
                no-repeat;
}

/* When the body has the loading class, we turn
   the scrollbar off with overflow:hidden */
body.loading {
    overflow: hidden;   
}

/* Anytime the body has the loading class, our
   modal element will be visible */
body.loading .modal {
    display: block;
}


</style>
</head>

<body >

<p style="text-align: center;"><span style="font-size: 26pt; font-family: arial, helvetica, sans-serif;"><strong>Complaint Transfer</strong></span></p>
<div class="row">
  
  <div class="column" >
    <h2 align="center">From Account</h2>
    
   <div class="form-group">
			<div class="form-list">
			<select class="form-control select2" id="sel_officer1" onchange="getAcc1();"
					 name="forwardto"  style="width: 300px;">
					<option  value="None" >Select officer to send</option>
					<c:forEach var="officer" items="${mapOfOfficer}">
							 <option value='"${officer.officerName}"'>${officer.officerName},${officer.officerDesiganation} </option>
					</c:forEach>
			</select> 
				<input type="text" name="forwradvalue" id="forwradvalue" hidden="true"></input>
			</div>
	</div>
    <br></br>
    <div>
		<table id="acc1" class ="display" style="width: 100%"  >
			
		</table>	
	</div>
    
  </div>
  
  <div class="column" >
    <h2 align="center">To Account</h2>
   
   <div class="form-group">
			<div class="form-list">
			<select class="form-control select2" id="sel_officer2" onchange="getAcc2();"
					 name="forwardto"  style="width: 300px;">
					<option  value="None" >Select officer to send</option>
					<c:forEach var="officer" items="${mapOfOfficer}">
							 <option value='"${officer.officerName}"'>${officer.officerName},${officer.officerDesiganation} </option>
					</c:forEach>
			</select> 
				<input type="text" name="forwradvalue" id="forwradvalue" hidden="true"></input>
			</div>
	</div>
    <br></br>
     <div>
		<table id="acc2" class ="display" style="width: 100%"  >
			
		</table>	
	</div>
    
  </div>
</div>
<div style="padding-left:47%; ">
	 <button  style="width:135px; height:115px; background-image:url('https://findicons.com/files/icons/99/office/128/forward.png'); " type="button" class="button-2" id="transfer" onclick="transfer();" >Transfer</button> 
	
</div>

</body>
</html>
