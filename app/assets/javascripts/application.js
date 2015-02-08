// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require underscore
//= require gmaps/google
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datepicker
//= require cocoon
//= require turbolinks
//= require_tree .

　　var message;
 
      // 位置情報取得
      function start_func(){
        get_location();       
      }
 
      // ( 1 )位置情報を取得します。
      function get_location(){
        document.getElementById("area_name").innerHTML
              = '位置情報取得します';
          if (navigator.geolocation) {
              // 現在の位置情報取得を実施 正常に位置情報が取得できると、
              // successCallbackがコールバックされます。
              navigator.geolocation.getCurrentPosition
               (successCallback,errorCallback);
          } else {
                message = "本ブラウザではGeolocationが使えません";
                document.getElementById("area_name").innerHTML
                      = message;
          }
      }
       // ( 2 )位置情報が正常に取得されたら
       function successCallback(pos) {
          var Potition_latitude = pos.coords.latitude;
          var Potition_longitude = pos.coords.longitude;
 
           // 位置情報が取得出来たらGoogle Mapを表示する
           initialize(Potition_latitude,Potition_longitude);
           var myLatlng = new google.maps.LatLng(Potition_latitude,Potition_longitude);
           get_area_name(myLatlng);
        }
 
      function errorCallback(error) {
        message = "位置情報が許可されていません";
       document.getElementById("area_name").innerHTML = message;
      }
 
      // ( 3 )Google Map API を使い、地図を読み込み
      function initialize(x,y) {
/*
        document.getElementById("area_name").innerHTML
            = 'google map情報を取得中';
*/

       // Geolocationで取得した座標を代入
        var myLatlng = new google.maps.LatLng(x,y);
        var mapOptions = {
          zoom: 17,
          center: myLatlng
          mapTypeId: google.maps.MapTypeId.HYBRID
        }
        // MapTypeId に、地図タイプを指定
        // HYBRID 衛星画像と主要な通りが表示されます
        // ROADMAP 通常の地図画像が表示されます
        // SATELLITE 衛生画像が表示されます。
        // TERRAIN 地形や植生などのマッピングをします。
 
        var map = new google.maps.Map
           (document.getElementById("map"), mapOptions);
 
        //document.getElementById("lat").innerHTML = x;
        //document.getElementById("lng").innerHTML = y;

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title:"Your position"
        });

        document.getElementById("latitude").value = x;
        document.getElementById("longitude").value = y;

        google.maps.event.addListener(map, "click", function(e) {
        	//var p = map.getCenter();
            var p = e.latLng;
        	document.getElementById("latitude").value = p.lat();
        	document.getElementById("longitude").value = p.lng();
        	marker.setPosition(p);
        });

      }
 
    function get_area_name(latLng_now){
      // 座標から住所名を取得
      var geocoder = new google.maps.Geocoder();
        geocoder.geocode({latLng: latLng_now}, function(results, status){
        if(status == google.maps.GeocoderStatus.OK){
            document.getElementById("area_name").innerHTML
               = results[0].formatted_address+'付近にいます';
        } else {
          // エラーの場合
        }
      });
    }

    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      // markers = handler.addMarkers(<%=raw @hash.to_json %>);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    });