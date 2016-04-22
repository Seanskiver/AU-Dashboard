<cfinclude template="/includes/portal/head-start.alfred">
<!---Custom CSS--->
<link href="css/bootstrap-switch.css" rel="stylesheet">
<link href="css/domCSSFile.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/cardStyle.css">
<link rel="stylesheet" type="text/css" href="css/cardStyle.css">
<link rel="stylesheet" type="text/css" href="css/modules.css">
<!-- Font Awesome Icons -->
<link href='css/font-awesome.min.css' rel='stylesheet' type='text/css' />
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/hover-dropdown-menu.css" rel="stylesheet" />
<!-- Icomoon Icons -->
<link href="css/icons.css" rel="stylesheet" />
<link href="css/custom.css"/>
<title>title:MyAU</title>
<cfinclude template="/includes/portal/head-end.alfred">
<cfinclude template="/includes/portal/header.alfred">
<cfinclude template="/includes/portal/menu.alfred">

<!--- content goes here --->
<script src="https://code.jquery.com/jquery-1.12.1.min.js" integrity="sha256-I1nTg78tSrZev3kjvfdM5A5Ak/blglGzlaZANLPDl3I=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js" integrity="sha256-WyjlLy3rvVSitHOXMctYkMCOU6GAletPg+qniNKLCQM=" crossorigin="anonymous"></script> 
<script src="js/resize.js"></script>
<script src="js/minimize-close.js"></script>




<!-- Start modal -->
<div class="modal fade panel-info" id="controlPanel" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-heading-style">
        <a class="close close-btn close-color-white" data-dismiss="modal"><i class="icon-close3"></i></a>
        <h4 class="panel-heading">Control Panel (Settings)</h4>
      </div>
      <div class="text-purple">
        <h6 class="text-center">Click the switch to add or remove cards to your dashboard.</h6>
        <ul class="row insertSwitches" style="padding-bottom: 10px;">
<!--            Body of the switches for control panel-->
        </ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default closeModal" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
 
</div>
<!-- End Modal -->
    
<!-- Modules-->
<section id="modules" class="page-section light-bg border-tb">
    
<!--    CF INCLUDE SEAN'S CFCARD-->
<cfinclude template="./included/cfcard.cfm">
    <!-- END SEAN'S STUFF -->
    
    <div class="fixed-action-btn bottom-right icons-circle icons-bg-color fa-1x openCtrlPanel" id="openModal">
    <i class="icon-pencil pad-20"></i>
    </div>

</section>
       
<cfinclude template="/includes/portal/footer-open.alfred">
<!--- Cusotn scripts go here --->

<script type="text/javascript" src="js/jquery.mobile-1.4.5.min.js"></script>
<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.simpleWeather/3.1.0/jquery.simpleWeather.min.js"></script>
<script type="text/javascript" src="js/bootstrap-switch.js"></script>
<script type="text/javascript" src="js/domJSFile.js"></script>
<!--<script src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js" integrity="sha256-WyjlLy3rvVSitHOXMctYkMCOU6GAletPg+qniNKLCQM=" crossorigin="anonymous"></script> -->
<script src="js/resize.js"></script>
<script src="js/minimize-close.js"></script>
<cfinclude template="/includes/portal/footer-close.alfred">