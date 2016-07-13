jQuery(document).ready(function($){
	/*******************
		main  navigation
	********************/
	var contentSections = $('main section');
	//open navigation on mobile
	$('.cd-nav-trigger').on('click', function(){
		$('header').toggleClass('nav-is-visible');
	});
	//smooth scroll to the selected section
	$('.cd-main-nav a[href^="#"]').on('click', function(event){
        event.preventDefault();
        $('header').removeClass('nav-is-visible');
        var target = $(this.hash),
        	topMargin = target.css('marginTop').replace('px', ''),
        	headerHeight = $('header').height();
        $('body,html').animate({'scrollTop': parseInt(target.offset().top)}, 400);
    });
    //update selected navigation element
    $(window).on('scroll', function(){
    	updateNavigation();
    });

    function updateNavigation() {
		contentSections.each(function(){
			var actual = $(this),
				actualHeight = actual.height(),
				topMargin = actual.css('marginTop').replace('px', ''),
				actualAnchor = $('.cd-main-nav').find('a[href="#'+actual.attr('id')+'"]');

			if ( ( parseInt(actual.offset().top - $('.cd-main-nav').height() - topMargin )<= $(window).scrollTop() ) && ( parseInt(actual.offset().top +  actualHeight - topMargin )  > $(window).scrollTop() +1 ) ) {
				actualAnchor.addClass('selected');
			}
			else {
				actualAnchor.removeClass('selected');
			}
		});
	}
});
