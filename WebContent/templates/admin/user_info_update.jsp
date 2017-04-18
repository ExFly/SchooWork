<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="base/_base.jsp"%>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <title>用户信息 |Admin</title>
        <%@ include file="base/_head.jsp"%>
    </head>

    <body>
        <div class="navbar navbar-fixed-top">            
            <%@ include file="base/_header.jsp"%>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
            		<%@ include file="base/_asidenav.jsp"%>
                </div>
                <div class="span9" id="content"> 
            		<%@ include file="_user_info_update.jsp"%>
                </div>
            </div>
            <hr>
            <footer>
            	<%@ include file="base/_footer.jsp"%>
            </footer>
        </div>
        <link href="${admin_path}vendors/datepicker.css" rel="stylesheet" media="screen">
        <link href="${admin_path}vendors/uniform.default.css" rel="stylesheet" media="screen">
        <link href="${admin_path}vendors/chosen.min.css" rel="stylesheet" media="screen">

        <link href=${admin_path}"vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">

        <script src="${admin_path}vendors/jquery-1.9.1.js"></script>
        <script src="${admin_path}bootstrap/js/bootstrap.min.js"></script>
        <script src="${admin_path}vendors/jquery.uniform.min.js"></script>
        <script src="${admin_path}vendors/chosen.jquery.min.js"></script>
        <script src="${admin_path}vendors/bootstrap-datepicker.js"></script>

        <script src="${admin_path}vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
        <script src="${admin_path}vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

        <script src="${admin_path}vendors/wizard/jquery.bootstrap.wizard.min.js"></script>

    <script type="text/javascript" src="${admin_path}vendors/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="${admin_path}assets/form-validation.js"></script>
        
    <script src="${admin_path}assets/scripts.js"></script>
        <script>
    jQuery(document).ready(function() {   
       FormValidation.init();
    });
        $(function() {
            $(".datepicker").datepicker();
            $(".uniform_on").uniform();
            $(".chzn-select").chosen();
            $('.textarea').wysihtml5();

            $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index+1;
                var $percent = ($current/$total) * 100;
                $('#rootwizard').find('.bar').css({width:$percent+'%'});
                // If it's the last tab then hide the last button and show the finish instead
                if($current >= $total) {
                    $('#rootwizard').find('.pager .next').hide();
                    $('#rootwizard').find('.pager .finish').show();
                    $('#rootwizard').find('.pager .finish').removeClass('disabled');
                } else {
                    $('#rootwizard').find('.pager .next').show();
                    $('#rootwizard').find('.pager .finish').hide();
                }
            }});
            $('#rootwizard .finish').click(function() {
                alert('Finished!, Starting over!');
                $('#rootwizard').find("a[href*='tab1']").trigger('click');
            });
        });
        </script>
    </body>
</html>
