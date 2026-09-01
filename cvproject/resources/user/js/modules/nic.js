function scrollToHere(gohere){
   	var dest = $("#"+gohere).offset().top;
	$("html:not(:animated),body:not(:animated)").animate({ scrollTop: dest}, 800 );	
}
(function ($) {

  Drupal.behaviors.exampleModule = {
    attach: function (context, settings) {
	// For slider background colour
		//$(".slide").each(function(index) {
		//	var color = $(this).attr('slidecolor');
		//	console.log('color: ' + color);
		//	$(this).css("background-color", color);
		//});
		
		$(window).ready(function(){
			$('.project_list li ul').hide();
			$('.services_list li ul').hide();
			$('.left_link li ul').hide();
			$('.contact_persons ul').hide();
			$('.point .add_details').hide();
			/*$('.spotlight').css('right', '-945px');*/
			//$(".nav ul li a:contains('State Centres')").parent().addClass('states');
			$(".breath .breath_menu").show();
		});
		$(document).ready(function(){
			if(_getCookie("fontSize") != null){
				var fontSize = _getCookie("fontSize");
			}else{
				var fontSize = 100;
			}
			$("#content").css("font-size",fontSize + "%");
			
			
			//---------Code for stqc tabindex problem start----			
			
			var n = 100; 
			jQuery('a, input, select').attr('tabindex' , 0);
			
			var n = 100; 
			jQuery('a, input, select').each( function() {               
			//jQuery(this).attr('title', n);
			jQuery(this).attr('tabindex', n++);
			});
					
			$('body').keyup(function(e) {
			//console.log('keyup called');
			var code = e.keyCode || e.which;
			if (code == '9') {
			//alert('Tab pressed');
			   $('#banner .view-content').cycle('pause'); 
				
				//$('.banner_play').fadeIn('fast');
			}
			});
 			
			//------------Code for stqc tabindex problem end----

			
			page_nav(1);
			
			/* Contact Page State list and state location id adding */
			var totState = $('.state_link li').size();
			var totStateInfo = $('.state_dist_list').size();
			var i = 0;
			var j = 0;
			$('.state_link li').each(function(){
				i++;		
				$(this).children('a').attr("onclick","scrollToHere('state" + i +"')");
			});
			$('.state_dist_list').each(function(){
				j++;		
				$(this).attr("id", "state"+j);
			});
			
			/* Map */
			$('.map .point').click(function(){
				$(this).children('.add_details').toggle('fast');	
				$(this).toggleClass('active_point');
			});
			
			/* Contact Address show/hide */
			$('.contact_persons li a').click(function(){
				$(this).parent().children('ul').slideToggle('fast');									 
			});
			
			/* State list hover */
			$('.left_link li').hover(function(){
				$(this).addClass('over');
				$(this).children('ul').show('fast');
			}, function() {
				$(this).removeClass('over');
				if($(this).hasClass('active')){
					$(this).children('ul').show();	
				} else {
				$(this).children('ul').hide('fast');
				}
			});
			if($('.left_link li').hasClass('active')){
				$('.left_link li.active ul').show();		
			}
			
			/* HOG imahe hover effect */
			/*$('.lists li .img img').mouseover(function(){
				var imgPath1 = $(this).attr('src');
				var name1 = imgPath1.replace(/^.*\/|\.jpg$/g, '');
				$(this).attr('src','images/hog/'+name1+'_c.jpg');
			});
			$('.lists li .img img').mouseout(function(){
				var imgPath2 = $(this).attr('src');
				var name2 = imgPath2.replace(/^.*\/|\_c.jpg$/g, '');
				$(this).attr('src','images/hog/'+name2+'.jpg');
			});*/
			
			/* State Awards Page slider */
			$('#quicktabs-states .view-id-award .view-content').cycle({
				fx: 'scrollHorz',
				timeout: 10000,
				next:'.awrd_next',
				prev:'.awrd_prev'
			});
			/* Hearquarters Awards Page slider */
			$('#quicktabs-head_quarter .view-id-award .view-content').cycle({
				fx: 'scrollHorz',
				timeout: 10000,
				next:'.awrd_next',
				prev:'.awrd_prev'
			});
			/* District Awards Page slider */
			$('#quicktabs-tabpage-district_new-1  .view-content').cycle({
				fx: 'scrollHorz',
				timeout: 10000,
				next:'.awrd_next',
				prev:'.awrd_prev'
			});
			/* District Awards Page slider */
			$('#quicktabs-tabpage-district-1  .view-content').cycle({
				fx: 'scrollHorz',
				timeout: 10000,
				next:'.awrd_next',
				prev:'.awrd_prev'
			});
			
			/* State Project collapsible */
			$('.project_list li ul:first').show();
			$('.project_list li:first').addClass('active');
			$('.project_list li a.proj').click(function(){
				if($('.project_list li ul:visible'))
				{
					$('.project_list li ul').slideUp('slow');		
				}
				$(this).parent().children('ul').slideDown('slow');	
				if($('.project_list li').hasClass('active'))
				{
					$('.project_list li').removeClass('active');	
				}
				$(this).parent().addClass('active');
			});
			/* State Services collapsible */
			$('.services_list li ul:first').show();
			$('.services_list li:first').addClass('active');
			$('.services_list li a.proj').click(function(){
				if($('.services_list li ul:visible'))
				{
					$('.services_list li ul').slideUp('slow');		
				}
				$(this).parent().children('ul').slideDown('slow');	
				if($('.services_list li').hasClass('active'))
				{
					$('.services_list li').removeClass('active');	
				}
				$(this).parent().addClass('active');
			});
			
			
			/* Search Animation*/
			$('.search').hide();
			
			$('.srch_show').click(function(){
				$(".search").stop().animate({width:'toggle'},200);
				$('.search_form .form-text').focus();
			});
			
			$('.search_close').click(function(){
				$(".search").stop().animate({width:'toggle'},150);
				$('.search_form .form-text').val('Search');
			});
			
			/* navigation animation */
			/*$('.nav ul li').hover(function(){
				$(this).children('ul').stop().slideDown(100);
				$(this).addClass("sub");								 
			}, function(){
				$(this).children('ul').stop().slideUp(100);
				$(this).removeClass("sub");
			});
			$('.nav ul li li.states').hover(function(){
				$(this).children('.stateSub').stop().slideDown(100);
				$(this).children('.stateSub').children('ul').show();
			}, function(){
				$(this).children('.stateSub').stop().slideUp(100);
				$(this).children('.stateSub').children('ul').hide();
			});
			*/
			
			
			/* Banner background color change */
			$('.slide').each(function(){
				//$(this).css('background-color', $(this).attr('rel'));
				$(this).css('background-color', $(this).children().children().children(".color_hide").text());
			});
			
			/* Banner slider */
			$('#banner .view-content').cycle({
				fx: 'fade',
				timeout: 4000,
				pager:  '.slide_num'
				
			});
			
			/*$('#banner .slide_num').after('<div id="slide_controls"><a class="banner_pause" href="#"><img src="' +theme_path + '/images/Stop1PressedBlue.png" alt="Stop" title="stop"/> </a><a class="banner_play" style="display:none" href="#"><img src="' +theme_path + '/images/Play1Pressed.png" alt="Play" title="Play"/></a></div>');*/
		
		
			/* Banner slider */
			
			/*$('#banner .view-content').cycle({
				fx: 'fade', /*scrollHorz/
				timeout: 10000,
				next:  '.banner_next',
				prev:  '.banner_prev'
			});*/
			
			$('.banner_pause').click(function() { 
				$('#banner .view-content').cycle('pause'); 
				$(this).fadeOut('fast');
				$('.banner_play').fadeIn('fast');
			});
			
			$('.banner_play').click(function() { 
				$('#banner .view-content').cycle('resume'); 
				$(this).fadeOut('fast');
				$('.banner_pause').fadeIn('fast');
			});
			
			/* Blocks animation */
			$('.services_block').hover(function(){
				$(this).children().children().children('.view-header').stop().animate({padding:'0 0 0 50px'}, 'fast');									
				$(this).children().children().children('.view-header').css('background', 'url('+theme_path+'/images/services_icon.png) 0 0 no-repeat');									
			}, function(){
				$(this).children().children().children('.view-header').stop().animate({padding:'0'}, 'fast');	
				$(this).children().children().children('.view-header').css('background', 'none');
			});
			
			$('.projects_block').hover(function(){
				$(this).children().children().children('.view-header').stop().animate({padding:'0 0 0 50px'}, 'fast');									
				$(this).children().children().children('.view-header').css('background', 'url('+theme_path+'/images/projects_icon.png) 0 0 no-repeat');									
			}, function(){
				$(this).children().children().children('.view-header').stop().animate({padding:'0'}, 'fast');	
				$(this).children().children().children('.view-header').css('background', 'none');
			});
			
			$('.accolades_block').hover(function(){
				$(this).children().children().children('.view-header').stop().animate({padding:'0 0 0 50px'}, 'fast');									
				$(this).children().children().children('.view-header').css('background', 'url('+theme_path+'/images/awards_icon.png) 0 0 no-repeat');									
			}, function(){
				$(this).children().children().children('.view-header').stop().animate({padding:'0'}, 'fast');	
				$(this).children().children().children('.view-header').css('background', 'none');
			});
			
			/* Spotlight Animation */
			/*$('#spot_slide .view-header').click(function(){
					if($(this).children().children('a').hasClass('close')){
						$('#spot_slide .view-spotlight').stop().animate({bottom:'-945px'}, 350);	
						//$(this).children().children('a').css('background','url('+theme_path+'/images/spotlight_open.png) center center no-repeat');	
						//$(this).children().children('a').removeClass('close');
					} else {
						$('.spotlight').stop().animate({bottom:'0px'}, 350);	
						$(this).children().children('a').css('background','url('+theme_path+'/images/spotlight_close.png) center center no-repeat');	
						$(this).children().children('a').addClass('close');
							$('#spot_slide ul').carouFredSel({
								auto: true,
								prev: '.spot_prev',
								next: '.spot_next'
							});
					}
			});
			*/
			/* banner spotlight slider */
			$('.spot_slide_new ul').carouFredSel({
				auto: true,
				direction: 'up',
				prev: '.spot_prev',
				next: '.spot_next'
			});
			/* Banner Spotlight */
			$('.spotlight').css('width','38px').css('overflow','hidden');
			$('.spotlight .spot_slider').css('width','0');
			
			$('.spotlight .close').hide();
			
			
			
			/*STQC Error Fixing Start*/
			
			$('#quicktabs-district_new ul.quicktabs-tabs li a').attr("tabindex","0");
			$('#quicktabs-states ul.quicktabs-tabs li a').attr("tabindex","0");			
			$('#quicktabs-district ul.quicktabs-tabs li a').attr("tabindex","0");
			$('#quicktabs-projects ul.quicktabs-tabs li a').attr("tabindex","0");
			$('.close img').attr("tabindex","0");
			$('#alertimp img').attr("tabindex","0");
			
			
			/*Project search submit button*/
			$('.views-submit-button input').attr("role","button");
			
			/*Project search input  button*/
			$('.form-item-title input').attr("role","textbox")			
			$('.form-item-title input').attr("Name","ProjectSearch")
	
			$('.video_details a').attr("alt","newsimage")
			
			
			$('.spotlight .open').click(function(){
				//alert("ok");
				$('.spotlight').stop().animate({width: '241px'}, 200);
				$('.spotlight .spot_slider').stop().animate({width: '203px'}, 200);
				$('.spotlight .close').show();
				$('.spotlight .open').hide();
				$('.spotlight .spot_prev').attr("tabindex","0");
				$('.spotlight .spot_next').attr("tabindex","0");
			});
			$('.spotlight .open').focus(function(){
				$('.spotlight').stop().animate({width: '241px'}, 200);
				$('.spotlight .spot_slider').stop().animate({width: '203px'}, 200);
				$('.spotlight .close').show();
				$('.spotlight .open').hide();
				$('.spotlight .spot_prev').removeAttr("tabindex");
				$('.spotlight .spot_next').removeAttr("tabindex");				
			});
			
			
			$('.spotlight .close').click(function(){
				$('.spotlight').stop().animate({width: '38px'}, 200);
				$('.spotlight .spot_slider').stop().animate({width: '0'}, 200);
				$('.spotlight .open').show();
				$('.spotlight .close').hide();
				$('.spot_slide_new ul').cycle('pause');
				$('.spotlight .spot_prev').attr("tabindex","0");
				$('.spotlight .spot_next').attr("tabindex","0");
			});
			$('.spotlight .close').focus(function(){
				$('.spotlight').stop().animate({width: '38px'}, 200);
				$('.spotlight .spot_slider').stop().animate({width: '0'}, 200);
				$('.spotlight .open').show();
				$('.spotlight .close').hide();
				$('.spot_slide_new ul').cycle('pause');
				$('.spotlight .spot_prev').removeAttr("tabindex");
				$('.spotlight .spot_next').removeAttr("tabindex");
			});
			
			
			
			
			/* News Ticker slider */
			/* News Scrolling Start */ 
			$('.news_ticker .view-content').cycle({
				fx: 'scrollUp',
				timeout: 5000
			});
			
						

			/*$('.news_ticker .view-content').before('<div id="news_controls"><a class="ticker_pause" href="#"><img src="' +theme_path + '/images/Stop1PressedBlue.png" alt="Stop" title="stop"/> </a><a class="ticker_play" style="display:none" href="#"><img src="' +theme_path + '/images/Play1Pressed.png" alt="Play" title="Play"/></a></div>');*/
			
			$('.ticker_pause').click(function() { 
				$('.news_ticker .view-content').cycle('pause'); 
				$(this).fadeOut('fast');
				$('.ticker_play').fadeIn('fast');
				
				
			});
			
			
			
			$('.ticker_play').click(function() { 
				$('.news_ticker .view-content').cycle('resume'); 
				$(this).fadeOut('fast');
				$('.ticker_pause').fadeIn('fast');
				
			});
			/* News Scrolling End */ 

			
			/* 4 blocks animation */
			//$('.index_blocks .inside .middle').hide();
			$('.index_blocks  .middle').hide();		
			$('body').keydown(function (){		
				$('.index_blocks a .middle').hide();	
			});			
			$('.index_blocks  a').hover(function(){
				$(this).children().children('.middle').stop().animate({height:'toggle'},1);											 
			}, function(){
				$(this).children().children('.middle').stop().animate({height:'toggle'},1);											 
			});
			$('.index_blocks a').focus(function (){
				$(this).children().children('.middle').stop().animate({height:'toggle'},1);											 
			});
			/* Right Spotlight slider */
			$('.spot_images').cycle({
				fx: 'fade',
				timeout: 5000
			});
			
			
			/* Hindi Website 
			jQuery(".access .hindi").click(function() {
				
				if (!confirm('This will Lead you to NIC Hindi Website.'))
				return false;
			});*/
			 /*english website 
			jQuery(".access .english").click(function() {
				
				if (!confirm('This will Lead you to NIC English Website.'))
				return false;
			});*/
			
			jQuery(".access .hindi").attr("title"," Hindi Version of NIC website");
			jQuery(".access .english").attr("title"," English Version of NIC website");
			jQuery("#quicktabs-tab-whoswho-2").attr("title","Head of Group");
			jQuery("#quicktabs-tab-whoswho-3").attr("title","Head of Division/Office Incharge");

			
			/* Director General form */
			$('.write_form').hide();
			$('.write a').click(function(){
				$('.write_form').slideToggle('fast');
				$('.write a').toggleClass('active');												  
			});

			/* Image Zoom Popup */
					/*	$(".zoomIn").fancybox({
						helpers: {
							title : {
								type : 'outside'
							},
							overlay : {
								speedOut : 0
							}
						}
					});*/
			
			/* Awards Tabs */
			//$( "#award_panel .panels-flexible-region-inside" ).tabs();
			$('#award_panel .view-display-id-block_2 .view-content').cycle({
				fx: 'scrollHorz',
				timeout: 0,
				next:'.award_next',
				prev:'.award_prev'
			});
			
			$('#award_panel .view-display-id-block_2 .view-content').cycle({
				fx: 'scrollHorz',
				timeout: 0,
				next:'.award_next',
				prev:'.award_prev'
			});
			 $('#banner .slide').each(function(){
					   $(this).css('background-color', $(this).attr('rel'));
			   });
			   
			   /* State Awards Page slider */
			$('#quicktabs-container-states .quicktabs-tabpage-states-2 .view-content').cycle({
				fx: 'scrollHorz',
				timeout: 10000,
				next:'.awrd_next',
				prev:'.awrd_prev'
			});
			/* Banner slider */
			$('.view-home-banner-animation .slider').cycle({
				fx: 'fade', /*scrollHorz*/
				timeout: 10000,
				next:  '.banner_next',
				prev:  '.banner_prev'
			});
			
			$('.banner_pause').click(function() { 
				$('.slider').cycle('pause'); 
				$(this).fadeOut('fast');
				$('.banner_play').fadeIn('fast');
			});
			
			$('.banner_play').click(function() { 
				$('.slider').cycle('resume'); 
				$(this).fadeOut('fast');
				$('.banner_pause').fadeIn('fast');
			});

			/***********************Drop down menu***************************/
			dropdown('nav', 'hover', 10);
		});
		/* Top Login block animation start */
	$('.loginPanel').hide();



	/* About US LInk rename */ 
	$('a[href=http://www.nic.in/node/41]').attr('href' , '/about-us');
	
	
	$('.signin').click(function(){
		$('.loginPanel').slideToggle(200);
		$('.contfpanel').hide();
		$('.sendme').show();
	});
	
	
	$('.loginPanel .close').click(function(){
		$('.loginPanel').slideUp(200);	
		
	});
  if ($('.page-home').length == 0 )
  {

	$('.alertimp').hide();
	
  }
	$('.signinalert').click(function(){
		$('.alertimp').slideToggle(200);
		$('.contfpanel').hide();
		$('.sendme').show();
	});
	
	
	$('.alertimp .close').click(function(){
		$('.alertimp').slideUp(200);		
	});

	
	
	$('.sendme').click(function(){
		$('.contfpanel').slideToggle(200);
		$('.sendme').hide();
	});
	$('.contfpanel .close02').click(function(){
		$('.contfpanel').slideUp(200);
		$('.sendme').show();
		
	});
	/* Top Login block animation end */
	}
	
	
  };
})(jQuery);
function _getCookie (name) {
	var arg = name + "=";
	var alen = arg.length;
	var clen = document.cookie.length;
	var i = 0;
	while (i < clen) {
		var j = i + alen;
		if (document.cookie.substring(i, j) == arg) {
			return _getCookieVal (j);
		}
		i = document.cookie.indexOf(" ", i) + 1;
		if (i == 0) 
			break;
	}
	return null;
}
function deleteCookie (name,path,domain) {
	if (_getCookie(name)) {
		document.cookie = name + "=" +
		((path) ? "; path=" + path : "") +
		((domain) ? "; domain=" + domain : "") +
		"; expires=Thu, 01-Jan-70 00:00:01 GMT";
	}
}
function _setCookie (name,value,expires,path,domain,secure) {
	var vurl = true;
	if(path != '' && path != undefined){
		vurl = validUrl(path);
	}
	if(jQuery.type(name) == "string" &&  vurl){
		document.cookie = name + "=" + escape (value) +
		((expires) ? "; expires=" + expires.toGMTString() : "") +
		((path) ? "; path=" + path : "") +
		((domain) ? "; domain=" + domain : "") +
		((secure) ? "; secure" : "");
	}
}
function _getCookieVal (offset) {
	var endstr = document.cookie.indexOf (";", offset);
	if (endstr == -1) { endstr = document.cookie.length; }
	return unescape(document.cookie.substring(offset, endstr));
}
function validUrl(url){	
	if(/^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/|www\.)[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/.test(url)){
		return true;
	} else {
	   return false;
	}
}
/*********Font size resize**********/
function set_font_size(fontType){
	
	if(fontType == "increase"){
			 if(fontSize < 130){
			  fontSize = parseInt(fontSize) + 15;
			 }
		  }else if(fontType == "decrease"){
			  if(fontSize > 70){
				fontSize = parseInt(fontSize) - 15;
			  }
		  }else{
			  fontSize = 100;
		  }
	_setCookie("fontSize",fontSize);
	jQuery("#content").css("font-size",fontSize + "%");
	jQuery("#template_three_column").css("font-size",fontSize + "%");
} 

function page_nav(id){
	jQuery(".hod_page ul").css("display","none");
	jQuery(".hod_page ul#division_"+id).css("display","block");
	jQuery(".pager a").removeClass("active");
	jQuery(".page_"+id+" a").addClass("active");
}

