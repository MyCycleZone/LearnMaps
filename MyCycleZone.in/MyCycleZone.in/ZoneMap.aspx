<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneMap.aspx.cs" Inherits="MyCycleZone.ZoneMap" %>

<!DOCTYPE html>

<html>
<head>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyD-Dw9BaIX9ATKWhEeqq6zRiWDmaveaIY8&sensor=false">
</script>

<script>
    var myCenter = new google.maps.LatLng(18.490446, 73.790208);
    var markers = [];
    var myCity;
    var map;
    function initialize() {
        var mapProp = {
            center: myCenter,
            zoom: 17,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

        //var marker = new google.maps.Marker({
        //    position: myCenter,
        //    animation: google.maps.Animation.BOUNCE
        //});

        //marker.setMap(map);
        
        //var zoom = GetZoomLevel(map);
        //alert(zoom);
        google.maps.event.addListener(map, 'zoom_changed', newZoom);

        google.maps.event.addListener(map, 'center_changed', newCenter);

        newCenter();
    }

    function newZoom() {
        var zoomLevel = map.getZoom();
        //map.setCenter(myLatLng);
        //infowindow.setContent('Zoom: ' + zoomLevel);
        alert(zoomLevel);
    }

    function newCenter() {

        
        setAllMap(null);
        markers = [];
        //myCity = null;
        if(myCity != null)
            myCity.setMap(null);
        //myCity.setMap(null);
        var center = map.getCenter();
        //map.setCenter();
        var marker = new google.maps.Marker({
            position: center,
            animation: google.maps.Animation.BOUNCE,
            map: map
        });
        markers.push(marker);

        myCity = new google.maps.Circle({
            center: center,
            radius: 200,
            strokeColor: "#0000FF",
            strokeOpacity: 0.8,
            strokeWeight: 1,
            fillColor: "#0000FF",
            fillOpacity: 0.4,
            map: map
        });
        
        myCity.setMap(map);


        //marker.setMap(map);

    }

    function setAllMap(map) {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
        }

    }



    function GetZoomLevel(map) {
        alert(map.getZoom());
            return map.getZoom();
      
    }

    google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body>
<div id="googleMap" style="width:100%;height:580px;"></div>

</body>
</html>
