<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="construction-permitting">
	<html>
		<head>
                    <link href="https://js.arcgis.com/3.18/esri/css/esri.css" rel="stylesheet"/>
  <style>
    html, 
    body, 
    #map {
      height: 100%;
      width: 100%;
      margin: 0;
      padding: 0;
    }
  </style>
  <script src="https://js.arcgis.com/3.18/"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"/>
  <script>
    require([
      "esri/map",
      "esri/layers/VectorTileLayer",
      "esri/layers/FeatureLayer",
      "esri/renderers/smartMapping",
      "esri/renderers/SimpleRenderer", "esri/Color", 
      "esri/symbols/SimpleFillSymbol", "esri/symbols/SimpleLineSymbol",      
      "dojo/domReady!"
    ], function(Map, VectorTileLayer, FeatureLayer, smartMapping, SimpleRenderer, Color, 
        SimpleFillSymbol, SimpleLineSymbol) {

      var map = new Map("map", {
        center: [-78.65, 35.5], // longitude, latitude
        zoom: 8
      });

      //The URL referenced in the constructor may point to a style url JSON (as in this sample)
      //or directly to a vector tile service
      var vtlayer = new VectorTileLayer("https://www.arcgis.com/sharing/rest/content/items/bf79e422e9454565ae0cbe9553cf6471/resources/styles/root.json");
      map.addLayer(vtlayer);

      $.ajax({
        url: 'https://raw.githubusercontent.com/CORaleigh/dataviz_search/censusmap/data/construction-permitting.json',
        type: 'GET',
        dataType: 'json'
      })
      .done(function(data) {
      		var where = "GEOID10 in (";
      		var geoids = [];
      		var maxVal = 16123394;
      		var minVal = 1;
      		$.each(data, function (i, d) {
      			// if (d.sum_estprojectcost > maxVal) {
      			// 	maxVal = d.sum_estprojectcost;
      			// }
      			// if (d.sum_estprojectcost < minVal) {
      			// 	minVal = d.sum_estprojectcost;
      			// }
      			geoids.push("'" + d.geoid_blgrp + "'");
      		});

      		where += geoids.toString() + ")";
	  		var featureLayer = new FeatureLayer("https://services1.arcgis.com/a7CWfuGP5ZnLYE7I/arcgis/rest/services/CensusBlockGroups2010/FeatureServer/0", 
	  			{definitionExpression: where, outFields: ['*'], mode: FeatureLayer.MODE_SNAPSHOT}
	  		);

	  		//map.addLayer(featureLayer);
	  		featureLayer.on('graphic-add', function (g) {
  				var match = $(data).filter(function (i) {
  					if (g.graphic.attributes) {
  						return data[i].geoid_blgrp === g.graphic.attributes.GEOID10.toString();
  					}
  				});
  				if (match.length > 0) {
  					g.graphic.attributes.count_permitnum = match[0].count_permitnum;
  					g.graphic.attributes.sum_estprojectcost = match[0].sum_estprojectcost;
  				}
  				console.log(g);
	  		});
	        featureLayer.on("load", function(){
	          var renderer = new SimpleRenderer(new SimpleFillSymbol().setOutline(new SimpleLineSymbol().setWidth(0.1).setColor(new Color([128,128,128]))));
	          renderer.setColorInfo({
	            field: "sum_estprojectcost",
	            minDataValue: minVal,
	            maxDataValue: maxVal,
	            colors: [
	              new Color([255, 0, 0]),
	              new Color([255, 255, 0])
	            ]
	          });
	          featureLayer.setRenderer(renderer);
	          map.addLayer(featureLayer);
	        });
 		
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });
    });
  </script>
		</head>
		<body>
<div id="map"></div>
		</body>
	</html>  	
  </xsl:template>
</xsl:stylesheet>  	