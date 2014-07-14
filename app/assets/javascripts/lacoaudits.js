// CUSTOM JS/QUERY

$( document ).ready(function() {
  //Hide the Title from nav-bar on load
	$(".subnav-auditName").hide();
	


});

// Custom close js for foundation reveal modals
$(document).foundation();
$('a.custom-close-reveal-modal').click(function(){
  $( this ).foundation('reveal', 'close');
});


$('.photoset-grid-lightbox').photosetGrid({
  highresLinks: true,
  gutter: '3px',

  onComplete: function(){
    $('.photoset-grid-lightbox').attr('style', '');
    $('.photoset-grid-lightbox a').colorbox({
      photo: true,
      scalePhotos: true,
      maxHeight:'90%',
      maxWidth:'90%',
      rel: 'nofollow'
    });
  }
});



// Backstrech image in a div $("#WPtopHead").backstretch("./img/LABanner.jpg");

// Check if the background images have been set
// and set default background colors
var has_bgOne = typeof bgOne != 'undefined';
var bgOne_default = "#F9FBFB";
var has_bgTwo = typeof bgTwo != 'undefined';
var bgTwo_default = "#F3F7F7";
var has_bgThree = typeof bgThree != 'undefined';
var bgThree_default = "#EDF3F3";
var has_bgFour = typeof bgFour != 'undefined';
var bgFour_default = "#E7EFEF";
var has_bgFive = typeof bgFive != 'undefined';
var bgFive_default = "#E0EAEA";

if (has_bgOne) {
	$.backstretch( bgOne, {fade: 500});	
} else {
	$( 'body' ).css( "background-color", bgOne_default );
};


// Five Minute Summary Waypoints

$('#WPtop').waypoint(function() {
	if (has_bgOne) {
		$.backstretch( bgOne, {fade: 500});	
	} else {
		$( 'body' ).css( "background-color", bgOne_default );
	};
});

$('#WPsummary').waypoint(function() {
	if (has_bgTwo) {
		$.backstretch( bgTwo, {fade: 500});	
	} else {
		$( 'body' ).css( "background-color", bgTwo_default );
	};
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});

$('#WPsummary').waypoint(function(direction) {
	if (direction == 'up') {
		if (has_bgTwo) {
			$.backstretch( bgTwo, {fade: 500});	
		} else {
			$( 'body' ).css( "background-color", bgTwo_default );
		};
	}
}, {
	offset: function() {
		return -($(this).height()*.95);
	}
});

$('#WPbackground').waypoint(function() {
	if (has_bgThree) {
		$.backstretch( bgThree, {fade: 500});	
	} else {
		$( 'body' ).css( "background-color", bgThree_default );
	};
}, {
offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});

$('#WPoverallassessment').waypoint(function() {
	if (has_bgFour) {
		$.backstretch( bgFour, {fade: 500});	
	} else {
		$( 'body' ).css( "background-color", bgFour_default );
	};
}, {
offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});

$('#WPoverallassessment').waypoint(function() {
	if (has_bgFive) {
		$.backstretch( bgFive, {fade: 500});	
	} else {
		$( 'body' ).css( "background-color", bgFive_default );
	};
}, {
	offset: function() {
	return -$(window).height();
}
});


// Background shade waypoints

$('#backgroundShadeTop').waypoint(function(direction) {
	if (direction == 'down') {
		$('#backgroundShade').fadeIn(500);
	}
}, {
	offset: function() {
		var raWindow = $.waypoints('viewportHeight');
		return raWindow * 0.75;
	}
});

$('#backgroundShadeTop').waypoint(function(direction) {
	if (direction == 'up') {
		$('#backgroundShade').fadeOut(500);
	}
}, {
	offset: function() {
		var raWindow = $.waypoints('viewportHeight');
		return raWindow * 0.75;
	}
});

$('#backgroundShadeBottom').waypoint(function(direction) {
	if (direction == 'down') {
		$('#backgroundShade').fadeOut(500);
	}
}, {
	offset: function() {
		var raWindow = $.waypoints('viewportHeight');
		return raWindow * 0.35;
	}
});

$('#backgroundShadeBottom').waypoint(function(direction) {
	if (direction == 'up') {
		$('#backgroundShade').fadeIn(500);
	}
}, {
	offset: function() {
		var raWindow = $.waypoints('viewportHeight');
		return raWindow * 0.35;
	}
});


// Background Shade for "Go to Full Audit"

$('#gotoFull').waypoint(function(direction) {
	if (direction == 'down') {
		$('#backgroundShade').fadeIn(500);
	}
}, {
	offset: function() {
		var raWindow = $.waypoints('viewportHeight');
		return raWindow * 0.75;
	}
});

$('#gotoFull').waypoint(function(direction) {
	if (direction == 'up') {
		$('#backgroundShade').fadeOut(500);
	}
}, {
	offset: function() {
		var raWindow = $.waypoints('viewportHeight');
		return raWindow * 0.75;
	}
});


// hide subnav when final div off viewport  
$('#WPoverallassessment').waypoint(function() {
	if ($(window).scrollTop() + $(window).height() <= $(document).height()) {
		$('.RAmagellan[data-magellan-expedition]').toggle(500,'swing');
	}

}, {
	offset: function() {
		return -$(this).height();
	}
});

// unhide when scrolling up if still hidden
// 5 Minute Summary
$('#WPoverallassessment').waypoint(function(direction) {
	if (direction == 'up') {
		$('.RAmagellan[data-magellan-expedition]').show(500,'swing');
	}
}, {
	offset: function() {
		return -($(this).height()*.85);
	}
});

// Full Audit


$('#auditContentBottom').waypoint(function(direction) {
	if (direction == 'up') {
		$('.RAmagellan[data-magellan-expedition]').show(500,'swing');
	}
}, {
	offset: function() {
		var raWindow = $.waypoints('viewportHeight');
		return raWindow * 0.75;
	}
});

// hide subnav when hit bottom (in cases where final div still in viewport due to browser size)

$(window).scroll(function() {
	if(
		$(window).scrollTop() + $(window).height() == $(document).height()
	) {
		$('.RAmagellan[data-magellan-expedition]').hide(500,'swing');
	}
});


// Full Audit Waypoints

$('#WPFAtop').waypoint(function() {
	$("#pageMap").hide();
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return -(raWindow / 2);
}
});

$('#WPexecutivesummary').waypoint(function() {
		$("#pageMap").show();
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});

// lets go with the pages now


$('#p1').waypoint(function() {
		$("#pageMap").html("Page 1 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});

$('#p2').waypoint(function() {
		$("#pageMap").html("Page 2 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});

$('#p3').waypoint(function() {
		$("#pageMap").html("Page 3 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});

$('#p4').waypoint(function() {
		$("#pageMap").html("Page 4 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});

$('#p5').waypoint(function() {
		$("#pageMap").html("Page 5 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p6').waypoint(function() {
		$("#pageMap").html("Page 6 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p7').waypoint(function() {
		$("#pageMap").html("Page 7 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p8').waypoint(function() {
		$("#pageMap").html("Page 8 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p9').waypoint(function() {
		$("#pageMap").html("Page 9 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p10').waypoint(function() {
		$("#pageMap").html("Page 10 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p11').waypoint(function() {
		$("#pageMap").html("Page 11 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p12').waypoint(function() {
		$("#pageMap").html("Page 12 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p13').waypoint(function() {
		$("#pageMap").html("Page 13 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p14').waypoint(function() {
		$("#pageMap").html("Page 14 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p15').waypoint(function() {
		$("#pageMap").html("Page 15 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p16').waypoint(function() {
		$("#pageMap").html("Page 16 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p17').waypoint(function() {
		$("#pageMap").html("Page 17 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p18').waypoint(function() {
		$("#pageMap").html("Page 18 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p19').waypoint(function() {
		$("#pageMap").html("Page 19 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p20').waypoint(function() {
		$("#pageMap").html("Page 20 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p21').waypoint(function() {
		$("#pageMap").html("Page 21 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p22').waypoint(function() {
		$("#pageMap").html("Page 22 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p23').waypoint(function() {
		$("#pageMap").html("Page 23 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p24').waypoint(function() {
		$("#pageMap").html("Page 24 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p25').waypoint(function() {
		$("#pageMap").html("Page 25 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p26').waypoint(function() {
		$("#pageMap").html("Page 26 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p27').waypoint(function() {
		$("#pageMap").html("Page 27 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p28').waypoint(function() {
		$("#pageMap").html("Page 28 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p29').waypoint(function() {
		$("#pageMap").html("Page 29 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p30').waypoint(function() {
		$("#pageMap").html("Page 30 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p31').waypoint(function() {
		$("#pageMap").html("Page 31 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p32').waypoint(function() {
		$("#pageMap").html("Page 32 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p33').waypoint(function() {
		$("#pageMap").html("Page 33 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p34').waypoint(function() {
		$("#pageMap").html("Page 34 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p35').waypoint(function() {
		$("#pageMap").html("Page 35 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p36').waypoint(function() {
		$("#pageMap").html("Page 36 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p37').waypoint(function() {
		$("#pageMap").html("Page 37 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p38').waypoint(function() {
		$("#pageMap").html("Page 38 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p39').waypoint(function() {
		$("#pageMap").html("Page 39 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p40').waypoint(function() {
		$("#pageMap").html("Page 40 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p41').waypoint(function() {
		$("#pageMap").html("Page 41 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p42').waypoint(function() {
		$("#pageMap").html("Page 42 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p43').waypoint(function() {
		$("#pageMap").html("Page 43 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p44').waypoint(function() {
		$("#pageMap").html("Page 44 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p45').waypoint(function() {
		$("#pageMap").html("Page 45 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p46').waypoint(function() {
		$("#pageMap").html("Page 46 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p47').waypoint(function() {
		$("#pageMap").html("Page 47 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p48').waypoint(function() {
		$("#pageMap").html("Page 48 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});
$('#p49').waypoint(function() {
		$("#pageMap").html("Page 49 of PDF");
}, {
	offset: function() {
	  var raWindow = $.waypoints('viewportHeight');
	  return raWindow / 2;
}
});


// Content Block Helper JQuery
$( document ).ready(function() {
	// Selectors for each helper type
	var helperList = 
		'#keyfindingsHelperForm, ' + 
		'#simpleformatHelperForm, ' + 
		'#pagenumberHelperForm, ' +
		'#unorderedlistHelperForm'
		;
	$( helperList ).submit(function( event ) {
	 	
	  // Stop form from submitting normally
	  event.preventDefault();
	 
	  // Get some values from elements on the page:
	  var $form = $( this ),
			data = $form.serialize(),
	    url = $form.attr( "action" );
	 
	  // Send the data using post
	  var posting = $.post( url, data );

	  // Put the results in a div
	  posting.done(function( data ) {
	    $( "#content_block_content" ).val( $('#content_block_content').val() + data );
	  });
	  $( helperList ).foundation('reveal', 'close');
	});
});


