# dataviz_search
Prototype for applying visualizations as responses for common search requests

Project is simple in concept. Match open data up with visualizations designed to respond to the most common search terms on the City of Raleigh's website. For example, search "weather" in google search bar and check out the response.

As part of the [Knight Foundation Prototype](http://www.knightfoundation.org/grants/201551998/) project, we are going to apply human-centered designs to the most common search stories to inform our visualizations. 

**City of Raleigh v1 Technology Stack**

* Google Search Appliance - [OneBox Module](https://www.google.com/support/enterprise/static/gsa/docs/admin/72/gsa_doc_set/oneboxguide/oneboxguide.html) - XSLT Templates (Front End for Search Results and OneBox Module Specific)
* CSS / HTML5 - for styling, mobile responsiveness
* JavaScript - Uses Google Charts libraries and APIs from Socrata [Data Portal](https://data.raleighnc.gov/) to connect data to widgets
* Red Hat [JBoss Fuse](http://developers.redhat.com/products/fuse/overview/?referrer=jbd) to translate data from Socrata to XML template as a URL source for the Google OneBox External Provider to improve load times
* [Alfresc0 CMS](https://www.alfresco.com/)

Official Partner(s):
* Knight Foundation - Prototype Grant Funder ($35,000)
* AtlanticBT - User Research, Design and Front End Development Vendor

Peer City Partners:
These cities provided google analytics for their search results to validate high value use cases for structured responses and visualizations.
* Chatannooga, TN
* Nashville, TN
* Virginia Beach, VA
* Boston, MA
* New Orleans, LA
