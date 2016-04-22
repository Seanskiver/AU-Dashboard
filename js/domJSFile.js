console.log('hello world');

function initializeSwitches(){
    $("[name='3News']").bootstrapSwitch();
    $("[name='4Weather']").bootstrapSwitch();
    $("[name='5Laundry']").bootstrapSwitch();
    $("[name='6Mail']").bootstrapSwitch();
    $("[name='7Quick Links']").bootstrapSwitch();
    $("[name='8Dining Meals']").bootstrapSwitch();
    $("[name='9Favorite Links']").bootstrapSwitch();
    $("[name='14Meow Sauce']").bootstrapSwitch();
    $("[name='15Jimmy Jim Jim']").bootstrapSwitch();
    $("[name='16Sean']").bootstrapSwitch();
    $("[name='17Dogs Woof']").bootstrapSwitch();
    $("[name='18Quarter']").bootstrapSwitch();

    $('input[name="3News"]').on('switchChange.bootstrapSwitch', function(event, state) {
      //console.log(this); // DOM element
      //console.log(event); // jQuery event
      //console.log(state); // true | false
      if($(this).is(':checked')){
          var cardTitle = "News";
          var hiddenValue = "false";  
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "News";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });
    $('input[name="4Weather"]').on('switchChange.bootstrapSwitch', function(event, state) {
      if($(this).is(':checked')){
          var cardTitle = "Weather";
          var hiddenValue = "false";
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "Weather";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });
    $('input[name="5Laundry"]').on('switchChange.bootstrapSwitch', function(event, state) {
      if($(this).is(':checked')){
          var cardTitle = "Laundry";
          var hiddenValue = "false";
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "Laundry";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });
    $('input[name="6Mail"]').on('switchChange.bootstrapSwitch', function(event, state) {
      if($(this).is(':checked')){
          var cardTitle = "Mail";
          var hiddenValue = "false";
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "Mail";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });

    $('input[name="7Quick Links"]').on('switchChange.bootstrapSwitch', function(event, state) {
      if($(this).is(':checked')){
          var cardTitle = "Quick Links";
          var hiddenValue = "false";
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "Quick Links";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });

    $('input[name="8Dining Meals"]').on('switchChange.bootstrapSwitch', function(event, state) {
      if($(this).is(':checked')){
          var cardTitle = "Dining Meals";
          var hiddenValue = "false";
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "Dining Meals";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });

    $('input[name="9Favorite Links"]').on('switchChange.bootstrapSwitch', function(event, state) {
      if($(this).is(':checked')){
          var cardTitle = "Favorite Links";
          var hiddenValue = "false";
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "Favorite Links";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });

    $('input[name="14Meow Sauce"]').on('switchChange.bootstrapSwitch', function(event, state) {
      if($(this).is(':checked')){
          var cardTitle = "Meow Sauce";
          var hiddenValue = "false";
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "Meow Sauce";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });

    $('input[name="15Jimmy Jim Jim"]').on('switchChange.bootstrapSwitch', function(event, state) {
      if($(this).is(':checked')){
          var cardTitle = "Jimmy Jim Jim";
          var hiddenValue = "false";
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "Jimmy Jim Jim";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });

    $('input[name="16Sean"]').on('switchChange.bootstrapSwitch', function(event, state) {
      if($(this).is(':checked')){
          var cardTitle = "Sean";
          var hiddenValue = "false";
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "Sean";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });

    $('input[name="17Dogs Woof"]').on('switchChange.bootstrapSwitch', function(event, state) {
      if($(this).is(':checked')){
          var cardTitle = "Dogs Woof";
          var hiddenValue = "false";
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "Dogs Woof";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });

    $('input[name="18Quarter"]').on('switchChange.bootstrapSwitch', function(event, state) {
      if($(this).is(':checked')){
          var cardTitle = "Quarter";
          var hiddenValue = "false";
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }else{
          var cardTitle = "Quarter";
          var hiddenValue = "true";
          $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                $(this).closest('.panel').remove();
          });
          $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
      }
    });
};//end InitializeFunction

$(".openCtrlPanel").on("tap",function(event){
    console.log("open the modal");
    $.get('cfc/test.cfc?method=getCardsQuery', function(result){
        var html = $.parseHTML(result);
        $('.insertSwitches').empty();
        $('.insertSwitches').append(html);
        //$('.insertSwitches').innerHTML(html);
        initializeSwitches();
    });
    $("#controlPanel").modal();
});


$(".closeCard").on("tap",function(event){
    var cardTitle = $(this).closest('.panel').find('.title').text();    
    var hiddenValue = true;
    console.log(cardTitle);
    $(this).closest('.panel').hide(250, function(){
        $(this).closest('.panel').remove();
    });
    $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
});

//$(".closeModal").on("tap",function(event){
//    $.get('cfc/test.cfc?method=gushingGrannnies', function(result){
//        var html = $.parseHTML(result);
//        $('#page').empty();
//        $('#page').append(html);
//    });
//});

//WEATHER API STUFF
// v3.1.0
//Docs at http://simpleweatherjs.com
$(document).ready(function() {
  $.simpleWeather({
    location: 'Alfred, NY',
    woeid: '',
    unit: 'f',
    success: function(weather) {
      html = '<h2><i class="icon-'+weather.code+'"></i> '+weather.temp+'&deg;'+weather.units.temp+'</h2>';
      html += '<ul><li>'+weather.city+', '+weather.region+'</li>';
      html += '<li class="currently">'+weather.currently+'</li>';
      html += '<li>'+weather.wind.direction+' '+weather.wind.speed+' '+weather.units.speed+'</li></ul>';
  
      $("#weather").html(html);
    },
    error: function(error) {
      $("#weather").html('<p>'+error+'</p>');
    }
  });
});