console.log('hello world');

// TODO: Make this more modular. 

function initializeSwitches(){
    var titles = [];
    
    $.get('cfc/test.cfc?method=switchInitialization', function(result){
//        console.log(result);    
        titles = result.split(',');
        for(var i=0; i<titles.length; i++){
            //initialize the switch itself
            $("[name="+ titles[i] +"]").bootstrapSwitch();
            //itinialize the on switch change
            $("input[name="+ titles[i] +"]").on('switchChange.bootstrapSwitch', function(event, state) {
//                console.log("switch name: " + this.name);
                //console.log(this); // DOM element
                //console.log(event); // jQuery event
                //console.log(state); // true | false
                if($(this).is(':checked')){
                    var cardTitle = this.name;
                    var hiddenValue = "false";  
                    $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
                }else{
                    var cardTitle = this.name;
                    var hiddenValue = "true";
                    $(".title:contains("+cardTitle+")").closest('.panel').hide(250, function(){
                        $(this).closest('.panel').remove();
                    });
                    $.get('cfc/test.cfc?method=updateHidden&cardTitle='+cardTitle+'&hiddenValue='+hiddenValue);
                }//end if checked
            });//end on switch change
        }//end for loop
    });//end get cards query
    $('.modal-content').delay(300).fadeIn(1000); //move this to .done to remove the lag in loading...
};//end InitializeFunction

//Open the Control Panel and populate it with the proper switch settings
$(".openCtrlPanel").on("tap",function(event){
    console.log("open the modal");
    $('.modal-content').fadeOut(0);
    $.get('cfc/test.cfc?method=getSwitchStates', function(result){
        var html = $.parseHTML(result);
        $('.insertSwitches').empty();
        $('.insertSwitches').append(html);
        //$('.insertSwitches').innerHTML(html);
        initializeSwitches();
    });
    $(".controlPanel").modal();
});

function openCtrlPanel() {
    console.log("open the modal function");
    $('.modal-content').fadeOut(0);
    $.get('cfc/test.cfc?method=getSwitchStates', function(result){
        var html = $.parseHTML(result);
        $('.insertSwitches').empty();
        $('.insertSwitches').append(html);
        //$('.insertSwitches').innerHTML(html);
        initializeSwitches();
    });
    $(".controlPanel").modal("show");
};

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

//Set the tour
//docs: http://bootstraptour.com/api/
//help for opening the modal with tour: http://stackoverflow.com/questions/35221860/bootstrap-tour-wont-load-on-a-modal
var tour = new Tour({
    debug: true,
    orphan: true,
    steps: [
        {
            //index of 0
            element: "#step1",
            title: "Welcome to the Dashboard Tour!",
            content: "We'll be giving you a series of steps to show you how to use this page. 'Cause dumb people. Shall we begin?",
            placement: "auto",
            orphan: true,
            backdrop: true,
        },
        {
            //index of 1
            element: "#step2",
            title: "Your Control Panel",
            content: "This little nifty cog wheel opens your control panel. He is one of two ways. Let me show you the other way.",
            placement: "left auto",
        },
        {
            //index of 2
            element: "#step3",
            title: "Your Control Panel Pt. 2",
            content: "You can also open your control panel with this nifty floating button! Look at that amazing thing! So, do it. Now. NOW!",
            placement: "left auto",
            onNext: function (tour) {
                if($('.controlPanel').hasClass('in') == true){
                    
                }else{
                    openCtrlPanel();
                    tour.goTo(4);
                }
            },
        },
        {   
            //index of 3
            element: "#step4",
            title: "Control Panel",
            content: "So, yeah, this is your control panel. It does things like, ya know... control things...",
            placement: "bottom auto",
            onNext: function (tour) {
                tour.goTo(5);
            },
        },
        {   
            //index of 4
            delay: 2000,  //needed to show the panel of the tour
            element: "#step4",
            title: "Control Panel",
            content: "So, yeah, this is your control panel. It does things like, ya know... control things...",
            placement: "bottom auto",
        },
        {
            //index of 5
            element: "#step5",
            title: "Switches",
            content: "These little do-dad's are the brains of the dashboard. They boss everything else around and tell things if they should be loved or not. Basicly they turn on your cards if you didn't get the metaphor.",
            placement: "right auto",
            onNext: function (tour) {
                $(".controlPanel").modal("hide");
            },
        },
        {
            //index of 6
            element: "#step6",
            title: "It's the end and I'm sad",
            content: "That concludes our tour of tour dashboard! I hope I didn't hurt your feelings and you took something away from this expereience! ~Love, your mystic tour buddy <3 P.S. Press 'End Tour' otherwise I'll keep on coming back to pester you!",
            placement: "bottom auto",
        }
]});

// Initialize the tour
tour.init();

//debug - remove (set to a button or trigger when done)
function startBSTour(){
    // Start the tour
    tour.end();
    tour.restart();
};
//debug - remove
function stopTour(){
    tour.end();
}

function startTour(){
    var intro = introJs();
      intro.setOptions({
        steps: [
          { 
            intro: "Hello world!"
          },
          { 
            intro: "You <b>don't need</b> to define element to focus, this is a floating tooltip."
          },
          {
            element: document.querySelector('#step1'),
            intro: "This is a tooltip.",
            position: 'left'
          },
          {
            element: document.querySelectorAll('#step2')[0],
            intro: "Ok, wasn't that fun?",
            position: 'right'
          },
          {
            element: '#step3',
            intro: 'More features, more fun.',
            position: 'right'
          }
        ]
      });
      intro.start();
};

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