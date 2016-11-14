<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="construction-permitting">
<html>

<head>
   <link rel="stylesheet" href="https://js.arcgis.com/3.18/esri/css/esri.css"/> 
   <link rel="stylesheet" href="https://js.arcgis.com/3.18/dijit/themes/tundra/tundra.css"/>
    
    <link href="https://coraleigh.github.io/cor.css" rel="stylesheet"/>
    <link href="https://coraleigh.github.io/css/style.css" rel="stylesheet"/>
    <link href="https://coraleigh.github.io/css/print.css" media="print" rel="stylesheet"/>  
  <script src="https://js.arcgis.com/3.18/"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"/>

  <!-- Google Charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
        google.charts.load('current', {'packages':['corechart']});
    </script>
    <style>
      #legendDiv {
        color: black;
        background-color: white;
      }
      .gsa-widget .arcgis-map {
          min-height: 380px;
      }      
      div.esriPopupWrapper .zoomTo {
        display: none;
      }    
      .esriPopup .content {
        padding: 0;
      }
      .esriPopup .contentPane {
        margin-bottom: 0;
      }
      .esriPopup .sizer {
        width: 180px;
      }
    </style>
  <script type="text/javascript">
    require([
      "esri/map",
      "esri/layers/FeatureLayer",
      "esri/renderers/smartMapping",
      "esri/renderers/SimpleRenderer", "esri/Color", 
      "esri/symbols/SimpleFillSymbol", "esri/symbols/SimpleLineSymbol", 
      "esri/tasks/query",
      "esri/dijit/Legend",
      "esri/geometry/Point",
      "esri/InfoTemplate",
      "dojo/dom",      
      "dojo/dom-construct",
      "dojo/domReady!"
    ], function(Map, FeatureLayer, smartMapping, SimpleRenderer, Color, 
        SimpleFillSymbol, SimpleLineSymbol, Query, Legend, Point, InfoTemplate, dom, domConstruct) {

      var map = new Map("arcgis-map", {
        basemap: 'dark-gray',
        center: [-78.65, 35.85], // longitude, latitude
        zoom: 10
      });
      var legend = null;


      $.ajax({
        url: 'https://raw.githubusercontent.com/CORaleigh/dataviz_search/censusmap/data/construction-permitting.json',
        type: 'GET',
        dataType: 'json'
      })
      .done(function(data) {
          var where = "GEOID10 in (";
          var geoids = [];
          $.each(data, function (i, d) {
            geoids.push("'" + d.geoid_blgrp + "'");
          });

          where += geoids.toString() + ")";
        var featureLayer = new FeatureLayer("https://services1.arcgis.com/a7CWfuGP5ZnLYE7I/arcgis/rest/services/CensusBlockGroups2010/FeatureServer/0", 
          {
            definitionExpression: where, 
            outFields: ['*'], 
            mode: FeatureLayer.MODE_SNAPSHOT,
            minZoom: 8,
            opacity: 0.6
          }
        );
        var q = new Query();
        q.where = where;
        var cnt = 0;
        featureLayer.queryCount(q, function (count) {
          featureLayer.on('graphic-add', function (g) {
            var match = $(data).filter(function (i) {
              if (g.graphic.attributes) {
                return data[i].geoid_blgrp === g.graphic.attributes.GEOID10.toString();
              }
            });
            if (match.length > 0) {
              g.graphic.attributes.count_permitnum = parseInt(match[0].count_permitnum);
              g.graphic.attributes.sum_estprojectcost = parseInt(match[0].sum_estprojectcost);
            }
            console.log(g);
            if (cnt === count - 1) {
              setRenderer(featureLayer, smartMapping);
            }
            cnt += 1;
          });
        });
        map.addLayer(featureLayer);
        featureLayer.on("load", function(){
          navigator.geolocation.getCurrentPosition(function (position) {
            var point = new Point(position.coords.longitude, position.coords.latitude)
            map.centerAndZoom(point, 15);
            var q = new Query();
            q.geometry = point;
            featureLayer.queryFeatures(q, function (results) {
              if (results.features.length > 0) {
                map.infoWindow.setFeatures(results.features);
                map.infoWindow.show(point);
              }
            });
          })
        });
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });

    function setInfoTemplate (featureLayer) {
      var infoTemplate = new InfoTemplate();
      infoTemplate.setTitle("${GEOID10}<br/>");
      infoTemplate.setContent("<b>Estimated Total Project Cost</b><br/>$${sum_estprojectcost}"); 
      featureLayer.setInfoTemplate(infoTemplate);  
    }

    function setRenderer (featureLayer, smartMapping) {
        featureLayer.fields.push({
          alias: 'Estimated Project Cost',
          editable: true,
          name: 'sum_estprojectcost',
          nullable: true,
          type: 'esriFieldTypeDouble'
        });
        featureLayer.fields.push({
          alias: 'Count',
          editable: true,
          name: 'Permits',
          nullable: true,
          type: 'esriFieldTypeDouble'
        });        
            //smart mapping functionality begins
            smartMapping.createClassedColorRenderer({
               layer: featureLayer,
               field: 'sum_estprojectcost',
               basemap: 'dark-gray',
               classificationMethod: "quantile"
            }).then(function (response) {
               featureLayer.setRenderer(response.renderer);
               featureLayer.redraw();
               createLegend(map, featureLayer, 'sum_estprojectcost');
            });
        setInfoTemplate(featureLayer);
    }
         //Create a legend
         function createLegend(map, layer, field) {
            //If applicable, destroy previous legend
            if (legend) {
               legend.destroy();
               domConstruct.destroy(dom.byId("legendDiv"));
            }

            legend = new Legend({
               map: map,
               layerInfos: [{
                  layer: layer,
                  title: " "
            }]
            }, 'legendDiv');
            legend.startup();
         };      
    });
</script>      
</head>
<body>
<div class="gsa-widget">
  <!-- Widget Header -->
  <header class="gsa-widget__header">
    <h2 class="gsa-widget__title no-margin">Construction Permitting</h2>
  </header>





  <!-- Common Permit Downloads -->
  <div class="panel">
    <header class="panel__header">
      <div class="filter push-right">
        <label for="filter-permits" class="visuallyhidden">Filter Common Permits</label>
        <span class="filter__icon gsa-icon-filter gsa-icon--lrg"></span>
        <select name="filter-permits" id="filter-permits" class="select-boxit">
          <option value="">Select One</option>
          <option value="residential">Residential</option>
          <option value="option-2">Option 2</option>
          <option value="option-3">Option 3</option>
        </select>
      </div>
      <h3 class="panel__title">Common Permits</h3>
    </header>
    <div class="panel__content">
      <ul class="file-downloads">
        <li class="file-downloads__item">
          <a href="#" target="_blank">
            <span class="file-downloads__icon">
              <span class="file-downloads__icon-text">Download</span>
              <span class="gsa-icon-download gsa-icon--lrg"></span>
            </span>
            Standard Residentail Review
          </a>
        </li>
        <li class="file-downloads__item">
          <a href="#" target="_blank">
            <span class="file-downloads__icon">
              <span class="file-downloads__icon-text">Download</span>
              <span class="gsa-icon-download gsa-icon--lrg"></span>
            </span>
            Standard Residential Review
          </a>
        </li>
        <li class="file-downloads__item">
          <a href="#" target="_blank">
            <span class="file-downloads__icon">
              <span class="file-downloads__icon-text">Download</span>
              <span class="gsa-icon-download gsa-icon--lrg"></span>
            </span>
            Residential Certified Review
          </a>
        </li>
        <li class="file-downloads__item">
          <a href="#" target="_blank">
            <span class="file-downloads__icon">
              <span class="file-downloads__icon-text">Download</span>
              <span class="gsa-icon-download gsa-icon--lrg"></span>
            </span>
            Residential Redi Review
          </a>
        </li>
        <li class="file-downloads__item">
          <a href="#" target="_blank">
            <span class="file-downloads__icon">
              <span class="file-downloads__icon-text">Download</span>
              <span class="gsa-icon-download gsa-icon--lrg"></span>
            </span>
            Existing Private Well and Wastewater (Septic) Systems
          </a>
        </li>
      </ul>
    </div>
    <div class="panel__foot text-right">
      <a href="#">View All Residential Permit Forms</a>
    </div>
  </div>




  <!-- Common Permit Stats -->
  <div class="panel panel--plain">
    <div class="panel__content panel__content--dark-blue">
      <div class="cta-stats">
        <span class="gsa-icon-hammer cta-stats__icon"></span>
        <div class="cta-stats__item">
          <div class="cta-stats__item-text">Building permits my neighborhood</div>
          <div class="cta-stats__item-count">5</div>
        </div>
        <div class="cta-stats__item">
          <div class="cta-stats__item-text">Building permits last 30 days</div>
          <div class="cta-stats__item-count">14</div>
        </div>
      </div>
    </div>
    <div class="panel__foot panel__foot--border-bottom text-right">
      <a href="" class=""><strong>View More Data at data.raleighnc.gov</strong> <span class="gsa-icon--sm gsa-icon-arrow-right gsa-icon--sm"></span></a>
    </div>
    <!-- Common Permits Chart -->
    <div class="panel__content panel__content--dark-blue">
      <div class="gsa-chart__title">Most Common Permits</div>
      <div id="chart-common-permits" class="gsa-chart gsa-chart--short"></div>
    </div>
    <div class="panel__foot text-right">
      <a href="" class=""><strong>View More Data at data.raleighnc.gov</strong> <span class="gsa-icon--sm gsa-icon-arrow-right gsa-icon--sm"></span></a>
    </div>
  </div>






    <!-- Quick Links Panel -->
  <div class="panel">
    <header class="panel__header">
      <h3 class="panel__title">Regulations</h3>
    </header>
    <div class="panel__content">
      <ul class="quick-links">
        <li class="quick-links__item">
          <a class="quick-links__link" href="#">Regulations I <span class="gsa-icon-arrow-right gsa-icon--sm"></span>
          </a>
        </li>
        <li class="quick-links__item">
          <a class="quick-links__link" href="#">Regulations II <span class="gsa-icon-arrow-right gsa-icon--sm"></span>
          </a>
        </li>
        <li class="quick-links__item">
          <a class="quick-links__link" href="#">Regulations II <span class="gsa-icon-arrow-right gsa-icon--sm"></span>
          </a>
        </li>
      </ul>
    </div>
  </div>




  <!-- Parks Near Me With: -->
<!--   <div class="panel">
    <header class="panel__header">
      <h3 class="panel__title">Upcoming Road Closures</h3>
    </header>
    <div class="panel__content">
      <table class="gsa-table">
        <thead>
          <tr>
            <th>Name</th>
            <th>Distance</th>
            <th>Level of Closure</th>
          </tr>
        </thead>
        <tbody>
          <tr class="gsa-table__row">
            <td><strong>Cary Parkway</strong></td>
            <td>0.2 mi</td>
            <td>Total</td>
          </tr>
          <tr class="gsa-table__row">
            <td><strong>William St.</strong></td>
            <td>3.0 mi</td>
            <td>Partial</td>
          </tr>
          <tr class="gsa-table__row">
            <td><strong>Salem St.</strong></td>
            <td>0.3 mi</td>
            <td>Partial</td>
          </tr>
          <tr class="gsa-table__row">
            <td><strong>Holly Springs Rd.</strong></td>
            <td>6.0 mi</td>
            <td>Partial</td>
          </tr>
          <tr class="gsa-table__row">
            <td><strong>US 1</strong></td>
            <td>0.5 mi</td>
            <td>Partial</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div> -->




  <div class="panel">
    <header>
      <h2 class="panel__title">$ Amount of Construction Planned in Past One Year</h2>
    </header>
    <div class="panel__content panel__content--dark-blue">
      <!-- Census Map -->
      <div id="arcgis-map" class="arcgis-map">
      </div>
      <div id="legendDiv">
      </div>
      <!-- End Census Map-->
    </div>
    <div class="panel__foot text-right">
      <a href="#"><strong>View More Data at data.raleighnc.gov</strong><span class="gsa-icon-arrow-right gsa-icon--sm gsa-icon--sm"></span></a>
    </div>
  </div>

  


</div>

</body>
</html>  
</xsl:template>
</xsl:stylesheet>