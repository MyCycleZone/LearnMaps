<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneMap.aspx.cs" Inherits="MyCycleZone.ZoneMap" %>

<!DOCTYPE html>

<html>
<head>

        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
        html, body, #map-canvas {
            height: 100%;
            margin: 0px;
            padding: 0px;
        }

        .controls {
            margin-top: 16px;
            border: 1px solid transparent;
            border-radius: 2px 0 0 2px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            height: 32px;
            outline: none;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        }

        #pac-input {
            background-color: #fff;
            padding: 0 11px 0 13px;
            width: 400px;
            font-family: Roboto;
            font-size: 15px;
            font-weight: 300;
            text-overflow: ellipsis;
        }

            #pac-input:focus {
                border-color: #4d90fe;
                margin-left: -1px;
                padding-left: 14px; /* Regular padding-left + 1. */
                width: 401px;
            }

        .pac-container {
            font-family: Roboto;
        }

        #type-selector {
            color: #fff;
            background-color: #4d90fe;
            padding: 5px 11px 0px 11px;
        }

            #type-selector label {
                font-family: Roboto;
                font-size: 13px;
                font-weight: 300;
            }

        }
    </style>
    <title>Places search box</title>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>


<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyD-Dw9BaIX9ATKWhEeqq6zRiWDmaveaIY8&sensor=false">
</script>

<script>
    var myCenter = new google.maps.LatLng(18.490446, 73.790208);
    var markers = [];
    var myCity;
    var map;
    var zoomLevel = 17;
    var radiusLevels = ["10000","9000","8000","7000","6000","5000","4000","3000","2000","1000","10000","8500","7000","5000","2750","1500","800","500","300","150","25"];
    function initialize() {
        var mapProp = {
            center: myCenter,
            zoom: zoomLevel,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

        google.maps.event.addListener(map, 'zoom_changed', newZoom);

        google.maps.event.addListener(map, 'center_changed', newCenter);


        newCenter();
    }

    function newZoom() {
        if (map.getZoom() < 10)
            map.setZoom(10);
        else if (map.getZoom() > 19)
            map.setZoom(19);

        zoomLevel = map.getZoom();
        newCenter();
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
        //newZoom();
       
        

        var radiusLevel = +radiusLevels[map.getZoom()];
        //alert("Zoom Level: " + map.getZoom() + " Radius Level: " + radiusLevel );
        myCity = new google.maps.Circle({
            center: center,
            radius: radiusLevel,
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
    <input id="pac-input" class="controls" type="text" placeholder="Search Box">

        <div id="googleMap" style="width:100%;height:580px;"></div>

</body>
</html>
