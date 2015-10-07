$('.tabs li').click(function(){
    var c = $(this).attr('data-sec');
    $('.view').empty().html($(".hidden ."+c).html());
});