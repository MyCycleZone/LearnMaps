<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneMap.aspx.cs" Inherits="MyCycleZone.ZoneMap" %>

<!DOCTYPE html>

<html>
<head>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyD-Dw9BaIX9ATKWhEeqq6zRiWDmaveaIY8&sensor=false">
</script>

<script>
    var myCenter = new google.maps.LatLng(18.490446, 73.790208);
    function initialize() {
        var mapProp = {
            center: myCenter,
            zoom: 14,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

        var marker = new google.maps.Marker({
            position: myCenter,
            animation: google.maps.Animation.BOUNCE
        });

        //var circle = new google.maps.Circle({
        //    center: myCenter,
        //    radus: 20000,
        //    strokeColor: "red",
        //    strokeOpacity: 0.8,
        //    strokeWeight: 2,
        //    fillColor: "red"
        //});
        //circle.setMap(map);
        //circle.bindTo('center', marker, 'position');
        marker.setMap(map);

     

    }

    google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>
<div id="googleMap" style="width:100%;height:580px;"></div>

</body>
</html>
