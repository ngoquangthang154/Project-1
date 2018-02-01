  $(document).ready(function(){
	var submitIcon = $('.searchbox-icon');
	var inputBox = $('.searchbox-input');
	var searchBox = $('.searchbox');
	var isOpen = false;
	submitIcon.click(function(){
		if(isOpen == false){
			searchBox.addClass('searchbox-open');
			inputBox.focus();
			isOpen = true;
		} else {
			searchBox.removeClass('searchbox-open');
			inputBox.focusout();
			isOpen = false;
		}
	});  
	submitIcon.mouseup(function(){
		return false;
	});
	searchBox.mouseup(function(){
		return false;
	});
	$(document).mouseup(function(){
		if(isOpen == true){
			$('.searchbox-icon').css('display','block');
			submitIcon.click();
		}
	});
});
function buttonUp(){
	var inputVal = $('.searchbox-input').val();
	inputVal = $.trim(inputVal).length;
	if( inputVal !== 0){
		$('.searchbox-icon').css('display','block');
	} else {
		$('.searchbox-input').val('');
		$('.searchbox-icon').css('display','block');
	}
}

$(function(){
    $('.selectpicker').selectpicker();
});

// Popular Products Tabs
$('.fr-pop-tabs li').on('click', 'a', function () {
    if ($(this).hasClass('active') || $(this).attr('data-frpoptab') == '')
        return false;
    $(this).parents('.fr-pop-tabs').find('li a').removeClass('active');
    $(this).addClass('active');

    // mobile
    $('.fr-pop-tab-mob[data-frpoptab-num=' + $(this).data('frpoptab-num') + ']').parents('.fr-pop-tab-cont').find('.fr-pop-tab-mob').removeClass('active');
    $('.fr-pop-tab-mob[data-frpoptab-num=' + $(this).data('frpoptab-num') + ']').addClass('active');

    $($(this).attr('data-frpoptab')).parents('.fr-pop-tab-cont').find('.fr-pop-tab').css('height', '0px');
    $($(this).attr('data-frpoptab')).css('height', 'auto').hide().fadeIn();
    return false;
});