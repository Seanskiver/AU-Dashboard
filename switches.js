console.log('hello world');

// TODO: Make this more modular. 




function initializeSwitches(){
//    $.get('cfc/test.cfc?method=getCardsQuery', function(result){
//        console.log(result);
//        var html = $.parseHTML(result);
//        $(".test").append(html);
//        //get data back from CF as JSON object and then parse as JS array
//        //http://stackoverflow.com/questions/4822649/return-data-using-coldfusion-and-jquery-ajax
//        //http://stackoverflow.com/questions/23015944/jquery-datatables-coldfusion-how-do-i-get-the-array-source-data-in-that-form
//    });
    
    //This array needs to be replaced with the result
    var titles = ["'News'","'Weather'","'Laundry'","'Mail'","'Quick Links'","'Dining Meals'","'Favorite Links'","'Meow Sauce'","'Jimmy Jim Jim'","'Sean'","'Dogs Woof'","'Quarter'"];
    
    for(var i=0; i<titles.length; i++){
        $("[name="+ titles[i] +"]").bootstrapSwitch();
//        console.log(titles[i]);
    }
    
//    $("[name='News']").bootstrapSwitch();
//    $("[name='Weather']").bootstrapSwitch();
//    $("[name='Laundry']").bootstrapSwitch();
//    $("[name='Mail']").bootstrapSwitch();
//    $("[name='Quick Links']").bootstrapSwitch();
//    $("[name='Dining Meals']").bootstrapSwitch();
//    $("[name='Favorite Links']").bootstrapSwitch();
//    $("[name='Meow Sauce']").bootstrapSwitch();
//    $("[name='Jimmy Jim Jim']").bootstrapSwitch();
//    $("[name='Sean']").bootstrapSwitch();
//    $("[name='Dogs Woof']").bootstrapSwitch();
//    $("[name='Quarter']").bootstrapSwitch();

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
//Open the Control Panel and populate it with the proper switch settings
$(".openCtrlPanel").on("tap",function(event){
    console.log("open the modal");
    $.get('cfc/test.cfc?method=getSwitchStates', function(result){
        var html = $.parseHTML(result);
        $('.insertSwitches').empty();
        $('.insertSwitches').append(html);
        //$('.insertSwitches').innerHTML(html);
        initializeSwitches();
    });
    $("#controlPanel").modal();
});

//When the 'X' on a card is taped we update what it was and make the changes
$(".closeCard").on("tap",function(event){
    var cardTitle = $(this).closest('.panel').find('.title').text();    
    var hiddenValue = true;
    console.log(cardTitle);
    $(this).closest('.panel').hide(250, function(){
        $(this).closest('.panel').remove();
    });
    $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
});

//When we close the Control Panel we need to re-populate the cards on screen to the new settings
//more or less for adding cards.
//$(".closeCtrlPanel").on("tap",function(event){
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