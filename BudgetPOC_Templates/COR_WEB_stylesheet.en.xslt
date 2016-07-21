<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
<xsl:include href="customer-onebox.xsl"/>

<!-- **** Custom Variables **** -->
<xsl:variable name="choose_result_page_header">mine</xsl:variable>
<xsl:variable name="cor_gsa">192.168.54.229</xsl:variable>
<xsl:variable name="cor_client">COR_WEB</xsl:variable>
<xsl:variable name="cor_collection">portalprd</xsl:variable>
<xsl:variable name="cor_env">www.raleighnc.gov</xsl:variable>
<xsl:variable name="cor_cache_url">www.raleighnc.gov/home/content</xsl:variable>
<xsl:variable name="analytics_account">UA-9880547-1</xsl:variable>

<!-- **** GSA Variables **** -->

<!-- ** Sidebar ** -->
<xsl:variable name="show_sort_by">1</xsl:variable>
<xsl:variable name="show_dynamic_navigation">0</xsl:variable>
<xsl:variable name="dyn_nav_max_rows">5</xsl:variable>
<xsl:variable name="render_dynamic_navigation">
	<xsl:if test="$show_dynamic_navigation != '0' and count(/GSP/RES/PARM) > 0">1</xsl:if>
</xsl:variable>

<!-- ** Results ** -->
<xsl:variable name="show_search_info">1</xsl:variable>
<xsl:variable name="show_spelling">1</xsl:variable>
<xsl:variable name="show_synonyms">1</xsl:variable>
<xsl:variable name="show_keymatch">1</xsl:variable>
<xsl:variable name="show_res_title">1</xsl:variable>
<xsl:variable name="show_document_previews">1</xsl:variable>
<xsl:variable name="choose_bottom_navigation">google</xsl:variable>
<xsl:variable name="secure_bottom_navigation_type">simple</xsl:variable>

<!-- ** Misc ** -->
<xsl:variable name="search_collections_xslt"></xsl:variable>
<xsl:variable name="uar_provider">GSA User-Added Results </xsl:variable>
<xsl:variable name="show_swr_link">0</xsl:variable>
<xsl:variable name="swr_search_anchor_text">Search Within Results</xsl:variable>
<xsl:variable name="show_result_page_adv_link">1</xsl:variable>
<xsl:variable name="adv_search_anchor_text">Advanced Search</xsl:variable>
<xsl:variable name="show_result_page_help_link">0</xsl:variable>
<xsl:variable name="search_help_anchor_text">Search Tips</xsl:variable>

<!-- <xsl:variable name="show_top_search_box">1</xsl:variable>
<xsl:variable name="show_bottom_search_box">0</xsl:variable>
<xsl:variable name="search_box_size">32</xsl:variable> -->

<xsl:variable name="choose_search_button">text</xsl:variable>
<xsl:variable name="search_button_image_url"></xsl:variable>

<xsl:variable name="choose_sep_bar">ltblue</xsl:variable>
<xsl:variable name="sep_bar_error_text">Error</xsl:variable>

<xsl:variable name="spelling_text">Did you mean:</xsl:variable>
<xsl:variable name="spelling_text_color">#cc0000</xsl:variable>

<xsl:variable name="synonyms_text">You could also try:</xsl:variable>

<xsl:variable name="keymatch_text">KeyMatch</xsl:variable>
<xsl:variable name="keymatch_text_color">#2255aa</xsl:variable>
<xsl:variable name="keymatch_bg_color">#e8e8ff</xsl:variable>

<xsl:variable name="egds_show_search_tabs">0</xsl:variable>
<xsl:variable name="egds_appliance_tab_label">Appliance</xsl:variable>
<xsl:variable name="egds_show_desktop_results">0</xsl:variable>

<xsl:variable name="show_asr">1</xsl:variable>
<!-- ** Other sidebar options -->
<xsl:variable name="show_people_search">1</xsl:variable>

<xsl:variable name="show_apps_segmented_ui">1</xsl:variable>

<xsl:variable name="show_gss_results">1</xsl:variable>
<xsl:variable name="gss_search_engine_id"></xsl:variable>

<xsl:variable name="show_twitter_results">0</xsl:variable>
<xsl:variable name="twitter_search_operators"></xsl:variable>

<!-- Turn OFF -->
<xsl:variable name="show_top_navigation">0</xsl:variable>
<xsl:variable name="my_nav_align">right</xsl:variable>
<xsl:variable name="my_nav_size">2</xsl:variable>
<xsl:variable name="my_nav_color"></xsl:variable>
<xsl:variable name="show_onebox">1</xsl:variable>

<xsl:variable name="res_title_length">255</xsl:variable>
<xsl:variable name="res_title_length_default">255</xsl:variable>
<xsl:variable name="res_title_color">#0000cc</xsl:variable>
<xsl:variable name="res_title_size">1.25em</xsl:variable>
<xsl:variable name="show_res_snippet">1</xsl:variable>
<xsl:variable name="res_snippet_size">80%</xsl:variable>

<xsl:variable name="res_keyword_color"></xsl:variable>
<xsl:variable name="res_keyword_size"></xsl:variable>
<xsl:variable name="res_keyword_format">b</xsl:variable>

<xsl:variable name="show_res_url">1</xsl:variable>
<xsl:variable name="res_url_color">#008000</xsl:variable>
<xsl:variable name="res_url_size">-1</xsl:variable>
<xsl:variable name="truncate_result_urls">1</xsl:variable>
<xsl:variable name="truncate_result_url_length">65</xsl:variable>

<xsl:variable name="show_meta_tags">1</xsl:variable>
<xsl:variable name="show_res_size">1</xsl:variable>
<xsl:variable name="show_res_date">1</xsl:variable>
<xsl:variable name="show_res_cache">1</xsl:variable>

<xsl:variable name="show_secure_radio">0</xsl:variable>

<xsl:variable name="show_suggest">1</xsl:variable>

<xsl:variable name="front_page_title">Search Home</xsl:variable>
<xsl:variable name="result_page_title">Search Results</xsl:variable>
<xsl:variable name="adv_page_title">Advanced Search</xsl:variable>
<xsl:variable name="error_page_title">Error</xsl:variable>
<xsl:variable name="swr_page_title">Search Within Results</xsl:variable>

<xsl:variable name="choose_adv_search_page_header">both</xsl:variable>

<xsl:variable name="cached_page_header_text">This is the cached copy of</xsl:variable>

<xsl:variable name="server_error_msg_text">A server error has occurred.</xsl:variable>
<xsl:variable name="server_error_des_text">Check server response code in details.</xsl:variable>
<xsl:variable name="xml_error_msg_text">Unknown XML result type.</xsl:variable>
<xsl:variable name="xml_error_des_text">View page source to see the offending XML.</xsl:variable>

<xsl:variable name="adv_search_panel_bgcolor">#cbdced</xsl:variable>

<xsl:variable name="show_res_clusters">0</xsl:variable>
<xsl:variable name="res_cluster_position">right</xsl:variable>

<xsl:variable name="show_alerts2">0</xsl:variable>

<xsl:variable name="show_sidebar">
	<xsl:choose>
		<xsl:when test="($show_apps_segmented_ui = '1'
					or $show_gss_results = '1'
					or $show_twitter_results = '1'
					or $show_people_search = '1')
					and $show_dynamic_navigation != '1'
					and /GSP/Q != ''
					and ($show_res_clusters = '0' or $res_cluster_position != 'right')">
			<xsl:value-of select="'1'"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="'0'"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:variable>

<xsl:variable name="msg_uar_added_by"><![CDATA[Added by]]></xsl:variable>
<xsl:variable name="msg_uar_edit"><![CDATA[Edit]]></xsl:variable>
<xsl:variable name="msg_uar_title"><![CDATA[Title]]></xsl:variable>
<xsl:variable name="msg_uar_save"><![CDATA[Save]]></xsl:variable>
<xsl:variable name="msg_uar_cancel"><![CDATA[Cancel]]></xsl:variable>
<xsl:variable name="msg_uar_address"><![CDATA[Address]]></xsl:variable>
<xsl:variable name="msg_uar_or"><![CDATA[or]]></xsl:variable>
<xsl:variable name="msg_uar_delete"><![CDATA[delete]]></xsl:variable>
<xsl:variable name="msg_uar_username"><![CDATA[UserName]]></xsl:variable>
<xsl:variable name="msg_uar_less"><![CDATA[Less]]></xsl:variable>
<xsl:variable name="msg_uar_more"><![CDATA[More]]></xsl:variable>
<xsl:variable name="msg_uar_add_another_result"><![CDATA[Add another result]]></xsl:variable>
<xsl:variable name="msg_uar_add_a_result"><![CDATA[Add a result]]></xsl:variable>
<xsl:variable name="msg_uar_saving"><![CDATA[Saving]]></xsl:variable>
<xsl:variable name="msg_uar_deleting"><![CDATA[Deleting]]></xsl:variable>
<xsl:variable name="msg_uar_save_failed"><![CDATA[Save failed]]></xsl:variable>
<xsl:variable name="msg_uar_delete_failed"><![CDATA[Deletion failed]]></xsl:variable>
<xsl:variable name="msg_uar_error_handling_request"><![CDATA[Error handling this request]]></xsl:variable>
<xsl:variable name="msg_uar_error_deleting"><![CDATA[Error deleting this result! Could not create the request]]></xsl:variable>
<xsl:variable name="msg_uar_error_add_or_update"><![CDATA[Problem adding/updating this result: Could not create the request]]></xsl:variable>

<xsl:template name="sanitize_uar_i18n_message">
	<xsl:param name="uar_message_to_be_sanitized"/>
	<xsl:variable name="uar_message_without_apos">
		<xsl:call-template name="replace_string">
			<xsl:with-param name="find" select='"&apos;"'/>
			<xsl:with-param name="replace" select='"\&apos;"'/>
			<xsl:with-param name="string" select="$uar_message_to_be_sanitized"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="uar_message_without_apos_double_quotes">
		<xsl:call-template name="escape_quot">
			<xsl:with-param name="string" select="$uar_message_without_apos"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="uar_message_without_apos_double_quotes_lt">
		<xsl:call-template name="replace_string">
			<xsl:with-param name="find" select='"&lt;"'/>
			<xsl:with-param name="replace" select='"&amp;lt;"'/>
			<xsl:with-param name="string" select="$uar_message_without_apos_double_quotes"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="uar_message_without_apos_double_quotes_lt_gt">
		<xsl:call-template name="replace_string">
			<xsl:with-param name="find" select='"&gt;"'/>
			<xsl:with-param name="replace" select='"&amp;gt;"'/>
			<xsl:with-param name="string" select="$uar_message_without_apos_double_quotes_lt"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:value-of select="$uar_message_without_apos_double_quotes_lt_gt"/>
</xsl:template>

<xsl:template name="populate_uar_i18n_array">
	<script type="text/javascript">
	<xsl:comment>
	// User added results - i18n messages.
		var uar_i18n_messages = {};
		uar_i18n_messages['ADDED_BY'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_added_by"/>
		</xsl:call-template>' + ' ';
		uar_i18n_messages['EDIT'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_edit"/>
		</xsl:call-template>';
		uar_i18n_messages['TITLE'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_title"/>
		</xsl:call-template>'  + ':';
		uar_i18n_messages['SAVE'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_save"/>
		</xsl:call-template>';
		uar_i18n_messages['CANCEL'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_cancel"/>
		</xsl:call-template>';
		uar_i18n_messages['ADDRESS'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_address"/>
		</xsl:call-template>'  + ':';
		uar_i18n_messages['OR'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_or"/>
		</xsl:call-template>'  + ' ';
		uar_i18n_messages['DELETE'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_delete"/>
		</xsl:call-template>';
		uar_i18n_messages['USERNAME'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_username"/>
		</xsl:call-template>'  + ':';
		uar_i18n_messages['LESS'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_less"/>
		</xsl:call-template>';
		uar_i18n_messages['MORE'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_more"/>
		</xsl:call-template>';
		uar_i18n_messages['ADD_ANOTHER_RESULT'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_add_another_result"/>
		</xsl:call-template>';
		uar_i18n_messages['ADD_A_RESULT'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_add_a_result"/>
		</xsl:call-template>';
		uar_i18n_messages['SAVING'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_saving"/>
		</xsl:call-template>'  + '...';
		uar_i18n_messages['DELETING'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_deleting"/>
		</xsl:call-template>'  + '...';
		uar_i18n_messages['SAVE_FAILED'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_save_failed"/>
		</xsl:call-template>'  + '!';
		uar_i18n_messages['DELETE_FAILED'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_delete_failed"/>
		</xsl:call-template>'  + '!';
		uar_i18n_messages['ERROR_HANDLING_REQUEST'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_error_handling_request"/>
		</xsl:call-template>'  + '.';
		uar_i18n_messages['ERROR_DELETING'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_error_deleting"/>
		</xsl:call-template>'  + '.';
		uar_i18n_messages['ERROR_ADD_OR_UPDATE'] = '<xsl:call-template name="sanitize_uar_i18n_message">
			<xsl:with-param name="uar_message_to_be_sanitized" select="$msg_uar_error_add_or_update"/>
		</xsl:call-template>'  + '.';
	//</xsl:comment>
	</script>
</xsl:template>

<xsl:variable name="msg_previewer_error"><![CDATA[Transformation error]]></xsl:variable>
<xsl:variable name="msg_previewer_connecting"><![CDATA[Connecting]]></xsl:variable>
<xsl:variable name="msg_previewer_document_too_large"><![CDATA[Document too large]]></xsl:variable>
<xsl:variable name="msg_previewer_hit_page"><![CDATA[Hit page]]></xsl:variable>
<xsl:variable name="msg_previewer_initializing"><![CDATA[Initializing]]></xsl:variable>
<xsl:variable name="msg_previewer_page"><![CDATA[Page]]></xsl:variable>
<xsl:variable name="msg_previewer_pending"><![CDATA[Pending]]></xsl:variable>
<xsl:variable name="msg_previewer_preview_unavailable"><![CDATA[Preview unavailable]]></xsl:variable>

<xsl:template name="populate_previewer_i18n_array">
	<script type="text/javascript">
	<xsl:comment>
		// Document previews - i18n messages.
		var previewer_i18n_messages = {
			'connecting': '<xsl:value-of select="$msg_previewer_connecting"/>',
			'document_too_large': '<xsl:value-of select="$msg_previewer_document_too_large"/>',
			'hitpage': '<xsl:value-of select="$msg_previewer_hit_page"/>',
			'initializing': '<xsl:value-of select="$msg_previewer_initializing"/>',
			'page': '<xsl:value-of select="$msg_previewer_page"/>',
			'pending': '<xsl:value-of select="$msg_previewer_pending"/>',
			'preview_unavailable': '<xsl:value-of select="$msg_previewer_preview_unavailable"/>',
			'transformation_aborted': '<xsl:value-of select="$msg_previewer_error"/>',
			'transformation_cancelled': '<xsl:value-of select="$msg_previewer_error"/>',
			'transformation_error': '<xsl:value-of select="$msg_previewer_error"/>'
		};
		//</xsl:comment>
	</script>
</xsl:template>

<!-- **********************************************************************
  GSA embedded mode support for websites that wants to display GSA search
  experience embedded inside the parent container via  proxying the
  request to the GSA. DO NOT EDIT the below part.
*************************************************************************** -->
<!-- Incoming query parameter identifying root path prefix to be used for links
     that should refresh the main page. -->
<xsl:variable name="embedded_mode_root_path_param" select="'emmain'" />
<!-- Incoming query parameter identifying root path prefix to be used for
     resources that should be loaded in isolation e.g. images, CSS, JS,
     AJAX requests etc. over an HTTP connection. -->
<xsl:variable name="embedded_mode_resource_root_path_param"
    select="'emsingleres'" />
<!-- Incoming query parameter for enabling/disabling style for embedded
     mode. -->
<xsl:variable name="embedded_mode_disable_style" select="'emdstyle'" />
<!-- Incoming query parameter specifying the GSA host name to be used for
     documill full preview viewer. -->
<xsl:variable name="embedded_mode_dps_viewer_param" select="'emdvhost'" />
<!-- Root path prefix for full-refresh requests that should be used instead
     of GSA's default "/search" root path prefix. -->
<xsl:variable name="embedded_mode_root_path_prefix"
    select="/GSP/PARAM[@name=$embedded_mode_root_path_param]/@value" />
<!-- Root path prefix for resources (e.g. CSS, images, JavaScript, AJAX requests
     etc.) that should be used instead of GSA's default "/" root path
     prefix. -->
<xsl:variable name="embedded_mode_resource_root_path_prefix"
    select="/GSP/PARAM[@name=$embedded_mode_resource_root_path_param]/@value" />
<!-- The GSA host to be used for documill full preview viewer. -->
<xsl:variable name="embedded_mode_dps_viewer_host"
    select="/GSP/PARAM[@name=$embedded_mode_dps_viewer_param]/@value" />
<!-- Checks if style should be disabled in embedded mode or not. -->
<xsl:variable name="is_disable_style_in_embedded_mode"
  select="
  if (/GSP/PARAM[@name=$embedded_mode_disable_style]/@value = 'true') then '1'
  else '0'" />
<!-- Regex for matching relative path starting with a '/' character
     and not having a following '/' character. -->
<xsl:variable name="relative_path_only_regex">^(/)[^/].*</xsl:variable>
<!-- Checks if the incoming root path prefix arguments are relative paths as
     we don't want to allow absolute paths. -->
<xsl:variable name="invalid_embedded_mode_request" >
  <xsl:if test="
      not(matches(
          $embedded_mode_root_path_prefix, $relative_path_only_regex)) or
      not(matches(
          $embedded_mode_resource_root_path_prefix, $relative_path_only_regex))">
    <xsl:value-of select="'1'" />
  </xsl:if>
</xsl:variable>
<!-- Flag to signal if current mode is embeddeded or not.
     '1' - yes, '0' - No -->
<xsl:variable name="is_embedded_mode"
    select="if ($embedded_mode_root_path_prefix != '' and
                $invalid_embedded_mode_request != '1') then '1' else '0'" />

<!-- **********************************************************************
  Root path prefix variables that should be used for search and static
  resources throughout.
********************************************************************** -->
<!-- Root path prefix for search requests that should be used instead of GSA's
     default "/search" root path prefix. -->
<xsl:variable name="gsa_search_root_path_prefix">
  <xsl:choose>
    <xsl:when test="$embedded_mode_root_path_prefix != '' and
                    $invalid_embedded_mode_request != '1'">
      <xsl:value-of select="$embedded_mode_root_path_prefix" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="'/search'" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>
<!-- Root path prefix for resources files (e.g. CSS, images, JavaScript etc.)
     and other HTTP requests that should be processed in isolation
     (e.g. Iframe, AJAX etc.) -->
<xsl:variable name="gsa_resource_root_path_prefix">
  <xsl:choose>
    <xsl:when test="$embedded_mode_resource_root_path_prefix != '' and
                    $invalid_embedded_mode_request != '1'">
      <xsl:value-of select="$embedded_mode_resource_root_path_prefix" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="''" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>


<xsl:template name="my_page_header">
<div id="navigation">
	<div id="Header">
		<div id="CitySeal" onclick="window.location='http://www.raleighnc.gov'">
			<img alt="Official City of Raleigh Seal" class="logo">
				<xsl:attribute name="src">
					<xsl:text>http://www.raleighnc.gov/content/static/images/City-Seal-BW.png</xsl:text>
				</xsl:attribute></img>
			<div class="raleigh">City of Raleigh</div>
		</div>
		<link rel="stylesheet" type="text/css" href="http://www.google.com/uds/api/feeds/1.0/77f89919ef841f93359ce886504e4e3f/default+en.css"/>
		<script type="text/javascript" src="http://www.google.com/jsapi?key=AIzaSyA5m1Nc8ws2BbmPRwKu5gFradvD_hgq6G0"/>
		<script type="text/javascript" src="http://www.google.com/uds/?file=feeds&amp;v=1"/>
		<script type="text/javascript" src="http://www.google.com/uds/api/feeds/1.0/77f89919ef841f93359ce886504e4e3f/default+en.I.js"/>
		<script type="text/javascript">
function searchSubmit() {window.location="http://<xsl:value-of select="$cor_gsa"/>/search?site=portalprd&amp;client=<xsl:value-of select="$cor_client"/>&amp;output=xml_no_dtd&amp;proxystylesheet=<xsl:value-of select="$cor_client"/>&amp;proxyreload=1";}</script>
	</div>
	<div id="Nav">
    <a href="http://www.raleighnc.gov" id="Home">Home</a>
		<ul>
			<li class="current"><a>
				<xsl:attribute name="href">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/>
				</xsl:attribute><span class="">Home</span></a></li>
			<li><a title="Arts &amp; Parks">
				<xsl:attribute name="href">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/arts</xsl:text>
				</xsl:attribute>Arts &amp; Parks</a></li>
                        <li><a title="Services">
				<xsl:attribute name="href">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/services</xsl:text>
				</xsl:attribute>Services</a></li>
			<li><a title="Government">
				<xsl:attribute name="href">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/government</xsl:text>
				</xsl:attribute>Government</a></li>
			<li><a title="Business">
				<xsl:attribute name="href">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/business</xsl:text>
				</xsl:attribute>Business &amp; Development</a></li>
			<li><a title="Commuity">
				<xsl:attribute name="href">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/neighbors</xsl:text>
				</xsl:attribute>Community</a></li>
			<li><a title="Environment">
				<xsl:attribute name="href">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/environment</xsl:text>
				</xsl:attribute>Environment</a></li>
			<li><a title="Projects">
				<xsl:attribute name="href">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/projects</xsl:text>
				</xsl:attribute>Projects</a></li>
			<li><a title="Public Safety">
				<xsl:attribute name="href">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/safety</xsl:text>
				</xsl:attribute>Safety</a></li>
		</ul>
	</div>
</div>
</xsl:template>

<xsl:template name="my_page_footer">
<div id="Footer">
    <div class="fixedwidth">
	<ul class="left fourth">
                <li><img alt="Official City of Raleigh Seal" class="logo">
				<xsl:attribute name="src">
					<xsl:text>http://www.raleighnc.gov/content/static/images/City-Seal-BW.png</xsl:text>
				</xsl:attribute></img></li>
	</ul>
	<ul class="left fourth">
		<li><h3>City of Raleigh</h3></li>
		<li class="socialmedia">
			<a href="http://www.facebook.com/CityofRaleigh" target="_blank"><img alt="Facebook icon" title="Facebook - Like Raleigh on Facebook to stay up to date.">
				<xsl:attribute name="src">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/images/facebook.png</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="style"><xsl:text>width:28px;height:28px;</xsl:text></xsl:attribute></img></a>
			<a href="http://twitter.com/RaleighGov" target="_blank"><img alt="Twitter icon" title="Twitter - Follow Raleigh on Twitter to get connected.">
				<xsl:attribute name="src">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/images/twitter.png</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="style"><xsl:text>width:28px;height:28px;</xsl:text></xsl:attribute></img></a>
			<a href="http://youtube.com/cityofraleigh" target="_blank"><img alt="YouTube icon" title="YouTube -- Watch City information, events, and how-to videos.">
				<xsl:attribute name="src">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/images/youtube.png</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="style"><xsl:text>width:28px;height:28px;</xsl:text></xsl:attribute></img></a>
			<a href="http://www.flickr.com/photos/raleighgov/" target="_blank"><img alt="Flickr icon" title="Flickr - From art to beautiful landmarks, view the latest and greatest City photos.">
				<xsl:attribute name="src">
					<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/images/flickr.png</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="style"><xsl:text>width:28px;height:28px;</xsl:text></xsl:attribute></img></a>
		</li>
	</ul>
        <ul class="left fourth">
		<li><h3>Physical Address</h3></li>
		<li>222 W. Hargett St. <br/>Raleigh, NC 27601</li>
	</ul>
	<ul class="left fourth">
		<li><h3>Mailing Address</h3></li>
		<li>P.O. Box 590 <br/>Raleigh, NC 27602</li>
	</ul>
		<ul class="legal">
			<li>
				<a title="Privacy Policy">
					<xsl:attribute name="href">
						<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/home/content/ITechWebServices/Articles/WebPrivacyPolicy.html</xsl:text>
					</xsl:attribute>Privacy Policy</a>
			</li>
			<li>
				<a title="Legal Notices">
					<xsl:attribute name="href">
						<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/home/content/ITechWebServices/Articles/WebLegalNotices.html</xsl:text>
					</xsl:attribute>Legal Notices</a>
			</li>
			<li>
				<a title="Site Information">
					<xsl:attribute name="href">
						<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/home/content/ITechWebServices/Articles/SiteInformation.html</xsl:text>
					</xsl:attribute>Site Information</a>
			</li>
			<li>
				<a title="Accessibility">
					<xsl:attribute name="href">
						<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/home/content/ITechWebServices/Articles/Accessibility.html</xsl:text>
					</xsl:attribute>Accessibility</a>
			</li>
			<li>
				<a title="Employee Access">
					<xsl:attribute name="href">
						<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/home/content/ITechAdmin/Articles/COREmployeeAccess.html</xsl:text>
					</xsl:attribute>Employee Access</a>
			</li>
			<li>
				<a title="Contact Us">
					<xsl:attribute name="href">
						<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/home/content/ITechWebServices/Articles/CityDepartments.html</xsl:text>
					</xsl:attribute>Contact Us</a>
			</li>
		</ul>
      </div>
</div>
<p class="copyright">Copyright © 2015 | raleighnc.gov | All Rights Reserved</p>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		jQuery('#SearchTools').click(function(){
			jQuery('#col3').toggleClass('hidden');
		});
        jQuery('#DataPortal').on('click', function() {
             typeSearch('data.raleighnc.gov | inurl:data.ral.opendata.arcgis.com');
        });
        var searchTermArray = $('#SearchInput').val().split(' ');
        var indexOfDataUrl = jQuery.inArray('inurl:data.ral.opendata.arcgis.com', searchTermArray);

        if (indexOfDataUrl > 0) {
        	$('#SearchInput').val(searchTermArray[0]);
        }
	});
	<![CDATA[
  function dateSearch(time) {
    var endDate = new Date();
    endDate.setDate(endDate.getDate() - time);
    window.location="http://gsa.raleighnc.gov/search?q="
    + $('#SearchInput').val() //.substring(0, $('#SearchInput').val().indexOf("daterange") - 1)
    + " daterange:"
    +	dateFormat(endDate)
    + ".."
    + dateFormat(new Date())
    + "&client=COR_WEB&proxystylesheet=COR_WEB&site=portalprd";
  }
  function dateFormat(date) {
    var yyyy = date.getFullYear().toString();
    var mm = (date.getMonth()+1).toString(); // getMonth() is zero-based
    var dd  = date.getDate().toString();

    return yyyy + '-' + (mm[1]?mm:"0"+mm[0]) + '-' + (dd[1]?dd:"0"+dd[0]);
  }
  ]]>
  <![CDATA[
  function typeSearch(type) {
    window.location="http://gsa.raleighnc.gov/search?q="
    + $('#SearchInput').val()
    + " inurl:"
    +	type
    + "&client=COR_WEB&proxystylesheet=COR_WEB&site=portalprd";
  }
  ]]>
</script>
	<xsl:apply-templates select="TraceNode"/>
</xsl:template>

<xsl:template match="TraceNode">
	<div id="trace">Total time taken: <em id='total_time'><xsl:value-of select="(@out-time - @in-time) div 1000000"/></em><xsl:apply-templates select="Record"/></div>
</xsl:template>

<xsl:template match="Record">
	<xsl:value-of select="Stmt/@log"/><br/><em><xsl:value-of select="@time-from-start"/></em>
</xsl:template>


<!-- **********************************************************************
 Cached page header (can be customized)
     ********************************************************************** -->
<xsl:template name="cached_page_header">
	<xsl:param name="cached_page_url"/>
	<xsl:variable name="stripped_url" select="substring-after($cached_page_url,'://')"/>
	<div id="cached_page_header">
		<xsl:value-of select="$cached_page_header_text"/>
		<xsl:call-template name="nbsp"/>
		<xsl:choose>
			<xsl:when test="starts-with($cached_page_url,$db_url_protocol)">
				<a ctype="cache" href="{concat('/db/',$stripped_url)}">
				<xsl:value-of select="$cached_page_url"/></a>.<br/>
			</xsl:when>
			<xsl:when test="starts-with($cached_page_url,$nfs_url_protocol)">
				<a ctype="cache" href="{concat('/nfs/',$stripped_url)}">
				<xsl:value-of select="$cached_page_url"/></a>.<br/>
			</xsl:when>
			<xsl:when test="starts-with($cached_page_url,$smb_url_protocol)">
				<a ctype="cache" href="{concat('/smb/',$stripped_url)}">
				<xsl:value-of select="$cached_page_url"/></a>.<br/>
			</xsl:when>
			<xsl:when test="starts-with($cached_page_url,$unc_url_protocol)">
				<xsl:variable name="display_url">
					<xsl:call-template name="convert_unc">
						<xsl:with-param name="string" select="$stripped_url"/>
					</xsl:call-template>
				</xsl:variable>
				<a ctype="cache" href="{concat('file://',$stripped_url)}">
				<xsl:value-of select="$display_url"/></a>.<br/>
			</xsl:when>
			<xsl:otherwise>
				<a ctype="cache" href="{$cached_page_url}">
				<xsl:value-of select="$cached_page_url"/></a>.<br/>
			</xsl:otherwise>
		</xsl:choose>
	</div>
<hr/>
</xsl:template>

<!-- **********************************************************************
 Suggest service javascript (do not customize)
     ********************************************************************** -->
<xsl:template name="gsa_suggest">
<xsl:variable name="ss_g_one_name_to_display">Suggestion</xsl:variable>
<xsl:variable name="ss_g_more_names_to_display">Suggestions</xsl:variable>
<xsl:variable name="ss_non_query_empty_title">No Title</xsl:variable>
<script type="text/javascript">
/**
 * HTML element names for the search form, the spellchecking suggestion, and the
 * cluster suggestions. The search form must have the following input elements:
 * "q" (for search box), "site", "client".
 * @type {string}
 */
var ss_form_element = 'suggestion_form'; // search form

/**
 * Name of search suggestion drop down.
 * @type {string}
 */
var ss_popup_element = 'search_suggest'; // search suggestion drop-down

/**
 * Types of suggestions to include.  Just one options now, but reserving the
 * code for more types
 *   g - suggest server
 * Array sequence determines how different suggestion types are shown.
 * Empty array would effectively turn off suggestions.
 * @type {object}
 */
var ss_seq = [ 'g' ];

/**
 * Suggestion type name to display when there is only one suggestion.
 * @type {string}
 */
var ss_g_one_name_to_display =
    "<xsl:value-of select="$ss_g_one_name_to_display"/>";

/**
 * Suggestion type name to display when there are more than one suggestions.
 * @type {string}
 */
var ss_g_more_names_to_display =
    "<xsl:value-of select="$ss_g_more_names_to_display"/>";

/**
 * The max suggestions to display for different suggestion types.
 * No-positive values are equivalent to unlimited.
 * For key matches, -1 means using GSA default (not tagging numgm parameter),
 * 0 means unlimited.
 * Be aware that GSA has a published max limit of 10 for key matches.
 * @type {number}
 */
var ss_g_max_to_display = 10;

/**
 * The max suggestions to display for all suggestion types.
 * No-positive values are equivalent to unlimited.
 * @type {number}
 */
var ss_max_to_display = 12;

/**
 * Idling interval for fast typers.
 * @type {number}
 */
var ss_wait_millisec = 300;

/**
 * Delay time to avoid contention when drawing the suggestion box by various
 * parallel processes.
 * @type {number}
 */
var ss_delay_millisec = 30;

/**
 * Host name or IP address of GSA.
 * Null value can be used if the JS code loads from the GSA.
 * For local test, use null if there is a &lt;base> tag pointing to the GSA,
 * otherwise use the full GSA host name
 * @type {string}
 */
var ss_gsa_host = null;

/**
 * Constant that represents legacy output format.
 * @type {string}
 */
var SS_OUTPUT_FORMAT_LEGACY = 'legacy';

/**
 * Constant that represents OpenSearch output format.
 * @type {string}
 */
var SS_OUTPUT_FORMAT_OPEN_SEARCH = 'os';

/**
 * Constant that represents rich output format.
 * @type {string}
 */
var SS_OUTPUT_FORMAT_RICH = 'rich';

/**
 * What suggest request API to use.
 *   legacy - use current protocol in 6.0
 *            Request: /suggest?token=&lt;query>&amp;max_matches=&lt;num>&amp;use_similar=0
 *            Response: [ "&lt;term 1>", "&lt;term 2>", ..., "&lt;term n>" ]
 *                   or
 *                      [] (if no result)
 *   os -     use OpenSearch protocol
 *            Request: /suggest?q=&lt;query>&amp;max=&lt;num>&amp;site=&lt;collection>&amp;client=&lt;frontend>&amp;access=p&amp;format=os
 *            Response: [
 *                        "&lt;query>",
 *                        [ "&lt;term 1>", "&lt;term 2>", ... "&lt;term n>" ],
 *                        [ "&lt;content 1>", "&lt;content 2>", ..., "&lt;content n>" ],
 *                        [ "&lt;url 1>", "&lt;url 2>", ..., "&lt;url n>" ]
 *                      ] (where the last two elements content and url are optional)
 *                   or
 *                      [ &lt;query>, [] ] (if no result)
 *   rich -   use rich protocol from search-as-you-type
 *            Request: /suggest?q=&lt;query>&amp;max=&lt;num>&amp;site=&lt;collection>&amp;client=&lt;frontend>&amp;access=p&amp;format=rich
 *            Response: {
 *                        "query": "&lt;query>",
 *                        "results": [
 *                          { "name": "&lt;term 1>", "type": "suggest", "content": "&lt;content 1>", "style": "&lt;style 1>", "moreDetailsUrl": "&lt;url 1>" },
 *                          { "name": "&lt;term 2>", "type": "suggest", "content": "&lt;content 2>", "style": "&lt;style 2>", "moreDetailsUrl": "&lt;url 2>" },
 *                          ...,
 *                          { "name": "&lt;term n>", "type": "suggest", "content": "&lt;content n>", "style": "&lt;style n>", "moreDetailsUrl": "&lt;url n>" }
 *                        ]
 *                      } (where type, content, style, moreDetailsUrl are optional)
 *                   or
 *                      { "query": &lt;query>, "results": [] } (if no result)
 * If unspecified or null, using legacy protocol.
 * @type {string}
 */
var ss_protocol = SS_OUTPUT_FORMAT_RICH;

/**
 * Whether to allow non-query suggestion items.
 * Setting it to false can bring results from "os" and "rich" responses into
 * backward compatible with "legacy".
 * @type {boolean}
 */
var ss_allow_non_query = true;

/**
 * Default title text when the non-query suggestion item does not have a useful
 * title.
 * The default display text should be internalionalized.
 * @type {string}
 */
var ss_non_query_empty_title =
    "<xsl:value-of select="$ss_non_query_empty_title"/>";

/**
 * Whether debugging is allowed.  If so, toggle with F2 key.
 * @type {boolean}
 */
var ss_allow_debug = false;
</script>
<script type="text/javascript"
    src="{$gsa_resource_root_path_prefix}/ss.js">
</script>
</xsl:template>

<xsl:template name="front_door">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
</xsl:text>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title><xsl:value-of select="$front_page_title"/> | raleighnc.gov</title>
    <link rel="shortcut icon" href="http://www.raleighnc.gov/cor-layout/content/static/styles/images/favicon.ico"/>
		<meta name="robots" content="NOINDEX,NOFOLLOW"/>
		<xsl:call-template name="style"/>
		<xsl:call-template name="analytics"/>
	</head>
	<body dir="ltr">
		<div class="wrapper">
			<xsl:call-template name="personalization"/>
			<xsl:call-template name="analytics"/>
			<xsl:call-template name="my_page_header"/>
			<div id="contentArea">
				<xsl:call-template name="search_box">
					<xsl:with-param name="type" select="'home'"/>
				</xsl:call-template>
			</div>
			<xsl:call-template name="my_page_footer"/>
		</div>
	</body>
	<xsl:if test="$show_suggest != '0'">
		<script type='text/javascript' src='common.js'></script>
		<xsl:text>
		</xsl:text>
		<script type='text/javascript' src='xmlhttp.js'></script>
		<xsl:text>
		</xsl:text>
		<script type='text/javascript' src='uri.js'></script>
		<xsl:text>
		</xsl:text>
		<xsl:call-template name="gsa_suggest" />
		<xsl:text>
		</xsl:text>
	</xsl:if>
</html>
</xsl:template>


<xsl:template name="no_RES">
	<xsl:param name="query"/>
	<xsl:if test="$show_onebox != '0'  and $show_sidebar != '1'">
		<xsl:if test="/GSP/ENTOBRESULTS/OBRES/provider = $uar_provider">
			<xsl:call-template name="onebox"/>
			<script type="text/javascript">
			<xsl:comment>
				if (window['populateUarMessages']) {populateUarMessages();}
			//</xsl:comment>
			</script>
		</xsl:if>
	</xsl:if>
	<xsl:text>
</xsl:text>
<div id="Advanced">
	<h3>Sorry, your search for "<em><xsl:value-of select="$query"/></em>" did not match any pages or documents.</h3>
	<h4>Suggestions:</h4>
	<ol style="margin-left:20px;">
		<li>Make sure all words are spelled correctly.</li>
		<li>Try different keywords.</li>
		<xsl:if test="/GSP/PARAM[(@name='access') and(@value='a')]">
			<li>Make sure your security credentials are correct.</li>
		</xsl:if>
		<li>Try more general keywords.</li>
	</ol>
</div>
	<xsl:text>
</xsl:text>
</xsl:template>

<xsl:template name="style">
	<link rel="stylesheet" type="text/css">
		<xsl:attribute name="href">
			<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/styles/main.css</xsl:text>
		</xsl:attribute>
	</link>
	<xsl:text>
	</xsl:text>
	<style>
		@media only screen and (min-width: 95em) {
			#Nav ul {padding-left:0;}
			#Nav li:first-child {width:6%;}
		}
		@media only screen and (max-width: 40em) {
			#SearchBox {display:block;}
			#SearchInput {width:85%;}
			span.toggle-preview, .floating-viewer {display:none;}
			tr, td {display:table-cell;}
		}
		#contentArea {padding:0;}
		.l{font-size:1.25em;}
		.related h3 {background:#DD4B39;}
		.related ul {background:#F76553;}
		#search_sort_by {color:#666;}
		#Search #SearchBox, #contentArea #SearchBox {position:static; width:100%; margin-bottom:10px; background:#ececec; padding:2%; clear:both; overflow:hidden;}
		#Search #SearchInput, #contentArea #SearchInput {width:70%; background:#fdfdfd; background-image:none; margin:0; padding:5px 5px 8px;}
		#SearchInput:focus {border:1px solid #537ac1; box-shadow:none;}
		#SearchBox .action {width:15%; background:#DD4B39; margin:0; margin-left:-5px; padding:9px;}
		#search_stats {clear:both; margin-bottom:10px; color:#666; border-bottom:1px solid #ddd; padding:0 2%;}
		.suggestion {padding:7px; color:#666;}
		#keymatch {margin:1em;padding:.5em;background:#fafafa;border:2px solid #e96629;border-radius:10px}
		.g a {font-size:1.4em; font-weight:normal; text-shadow:none; word-wrap:break-word;}
		.content div {margin-bottom:1em; font-family:sans-serif;}
		.content .s {margin:0;}
		.floating-viewer div {margin:0;}
		.url {color:#093; word-wrap:break-word;}
		.g {margin:0; font-family:sans-serif; line-height:1.1;}
		.content a:before, .content a:after, #bottom-navigation a:before, #bottom-navigation a:after {display:none;}
		#col2 a {border:0; vertical-align:middle;}
		.box {margin:4%;}
		.indent {margin:10px 0; padding:0 0 0 20px; border-left:1px solid #ccc;}
		table {clear:both; border:0; width:350px; margin:10px auto;}
		table td {border:0; text-align:center; background:#fff;}
		.navstart,.navcurrent,.navpage,.navend,.dn-more-img,.dn-limg,.dn-mimg,.dn-zippy-hdr-img{background:url(http://www.raleighnc.gov/content/static/images/gsa.png); display:block; height:40px;}
		.navstart {background-position:-24px 0; width:28px;}
		.navcurrent {background-position:-53px 0; width:20px;}
		.navpage {background-position:-74px 0; width:20px;}
		.navend {background-position:-96px 0; width:71px;}
		#Advanced {clear:both; padding:20px 0 0 250px; border-top:1px solid #CCC;}
		#Advanced li {margin-bottom:10px;}
		#Advanced .action {float:none; margin:10px 60px;}
		ol li {list-style-type:decimal;}
		li.dn-attr-hdr div.dn-zippy-hdr-img {background-position:166px 256px; float:right; height:16px; margin-right:4px; width:16px; display:none;}
		.dn-hidden {display:none;}
		.dn-inline-block, .dn-bar-rt, .dn-bar-rt table, .dn-img, span.dn-more-img {display:inline-block;}
		.dn-block {display:block;}
		span.dn-attr-c {color:#777;}
		a.dn-attr-v {display: block;overflow-x: hidden;width: 99%;}
		a.dn-link, .dn-img {outline-style:none;}
		.dn-overflow {overflow-x:hidden;}
		.dn-bar-v {color:#000;}
		.dn-bar-rt {border:0 none; float:right; margin:-2px 5px 0 20px;}
		.dn-bar-nav {font-size:<xsl:value-of select="$res_snippet_size"/>;}
		span.dn-more-img {margin-top:6px; height:15px; margin-right:4px; overflow:hidden; position:relative; vertical-align:text-bottom; width:15px;}
		span.dn-limg {background-position:35px 275px; width:17px; height:17px;}
		span.dn-mimg {background-position:17px 275px; width:17px; height:17px;}
		div.dn-bar {background:#E5ECF9; clear:both; font-size:<xsl:value-of select="$res_snippet_size"/>; padding:6px; width:100%;}
		div.dn-bar dfn {font-size: 1.2em; padding:4px;}
		div.dn-bar a.cancel-url:hover {text-decoration:line-through;}
		.more_results {font-size:0.9em;}
		.main-results {margin:10px 10px 0 280px;}
		.main-results h3 {margin:0; padding:0;}
		.s {font-size:0.9em; line-height:1.5;}
		.medium {width:480px; height:27px; border:1px solid #ddd; padding:2px;}
		.medium_select {width:280px; height:27px; border:1px solid #ddd; padding:2px;}
		#omitted{font-style:italic; font-size:0.9em;}
		.btnG1{cursor:pointer; width:150px; margin-left:54px; height:27px;}

		/** CSS for document previews. */
  div.result-item {position:relative; border:1px solid #fff;}
  .non-previewable {background-color:transparent !important; border:1px solid white !important;}
  .non-previewable .s {background-color:transparent !important;}
  div.result-item .dps-viewer {margin:0;}
  body.previews-enabled div.result-item-hover {background-color:#ebf2fc; border:1px solid #cddcf9;}
  body.previews-enabled div.result-item-hover .s {background-color:#ebf2fc !important;}
  span.toggle-preview {display:inline-block; margin-left:5px; cursor:pointer; width:10px; height:10px; background:transparent url(preview_off.png) no-repeat;}
  div.result-item-hover span.toggle-preview {color:#0000cc; background-image:url(preview_on.png) !important;}
  body.previews-enabled span.toggle-preview {color:#0000cc !important; background-image:url(preview_on.png);}

  .floating-viewer {top:0; right:-275px;}
  .floating-viewer-arrow {top:20px; left:-24px;}

a[href ^="https://data.raleighnc.gov"] {padding-left: 30px; background: transparent url(http://www.raleighnc.gov/content/static/images/Datasets.jpg) no-repeat;}
a[href ^="https://data.raleighnc.gov"][href*="Map"], a[href ^="https://data.raleighnc.gov"][href*="map"], a[href ^="https://data.raleighnc.gov"][href*="District"] {background: transparent url(http://www.raleighnc.gov/content/static/images/Maps.jpg) no-repeat;}
#Nav li:first-child>a:before {content:'';}
	</style>
	<xsl:text>
	</xsl:text>
	<script type="text/javascript">
		<xsl:attribute name="src"><xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/scripts/jquery.js</xsl:text></xsl:attribute>
	</script>
</xsl:template>


<xsl:variable name="is_test_search" select="/GSP/PARAM[@name='testSearch']/@value"/>

<xsl:variable name="swrnum">
	<xsl:choose>
		<xsl:when test="/GSP/PARAM[(@name='swrnum') and (@value!='')]">
			<xsl:value-of select="/GSP/PARAM[@name='swrnum']/@value"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="0"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:variable>

<xsl:variable name="help_url">/user_help.html</xsl:variable>

<xsl:variable name="base_url">
	<xsl:for-each select="/GSP/PARAM[@name = 'client' or
				@name = 'site' or
				@name = 'num' or
				@name = 'output' or
				@name = 'proxystylesheet' or
				@name = 'access' or
				@name = 'lr' or
				@name = 'ie']">
		<xsl:value-of select="@name"/>=<xsl:value-of select="@original_value"/>
		<xsl:if test="position() != last()">&amp;</xsl:if>
	</xsl:for-each>
</xsl:variable>

<xsl:variable name="home_url">search?<xsl:value-of select="$base_url"/>&amp;proxycustom=&lt;HOME/&gt;</xsl:variable>

<xsl:variable name="synonym_url"><xsl:for-each
  select="/GSP/PARAM[(@name != 'q') and
                     (@name != 'as_q') and
                     (@name != 'swrnum') and
                     (@name != 'dnavs') and
                     (@name != 'ie') and
                     (@name != 'start') and
                     (@name != 'epoch' or $is_test_search != '') and
                     not(starts-with(@name, 'metabased_'))]">
    <xsl:value-of select="@name"/><xsl:text>=</xsl:text>
    <xsl:value-of select="@original_value"/>
    <xsl:if test="position() != last()">
      <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
    </xsl:if>
  </xsl:for-each>
</xsl:variable>

<!-- *** search_url *** -->
<xsl:variable name="search_url">
  <xsl:for-each select="/GSP/PARAM[(@name != 'start') and
                                   (@name != 'swrnum') and
                     (@name != 'epoch' or $is_test_search != '') and
                     not(starts-with(@name, 'metabased_'))]">
    <xsl:choose>
      <xsl:when test="@name = 'only_apps' and $show_apps_segmented_ui = '1'">
        <xsl:value-of select="'exclude_apps=1'" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@name"/><xsl:text>=</xsl:text>
        <xsl:value-of select="@original_value"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="position() != last()">
      <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
    </xsl:if>
  </xsl:for-each>
</xsl:variable>

<!-- *** search_url minus any dynamic navigation filters *** -->
<xsl:variable name="search_url_no_dnavs">
  <xsl:for-each select="/GSP/PARAM[(@name != 'start') and
                                   (@name != 'swrnum') and
                                   (@name != 'dnavs') and
                     (@name != 'epoch' or $is_test_search != '') and
                     not(starts-with(@name, 'metabased_'))]">
    <xsl:choose>
      <xsl:when test="@name = 'only_apps' and $show_apps_segmented_ui = '1'">
        <xsl:value-of select="'exclude_apps=1'" />
      </xsl:when>
      <xsl:when test="@name = 'q' and /GSP/PARAM[@name='dnavs']">
        <xsl:value-of select="@name"/><xsl:text>=</xsl:text>
        <xsl:value-of select="substring-before(@original_value,
          concat('+', /GSP/PARAM[@name='dnavs']/@original_value))"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@name"/><xsl:text>=</xsl:text>
        <xsl:value-of select="@original_value"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="position() != last()">
      <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
    </xsl:if>
  </xsl:for-each>
</xsl:variable>

<!-- *** url without q and dnavs param *** -->
<xsl:variable name="no_q_dnavs_params">
  <xsl:for-each select="/GSP/PARAM[(@name != 'start') and
                                   (@name != 'swrnum') and
                                   (@name != 'q') and
                                   (@name != 'dnavs') and
                     (@name != 'epoch' or $is_test_search != '') and
                     not(starts-with(@name, 'metabased_'))]">
    <xsl:value-of select="@name"/><xsl:text>=</xsl:text>
    <xsl:value-of select="@original_value"/>
    <xsl:if test="position() != last()">
      <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
    </xsl:if>
  </xsl:for-each>
</xsl:variable>

 <!-- *** search_url_escaped: safe for inclusion in javascript *** -->
<xsl:variable name="search_url_escaped">
  <xsl:call-template name="replace_string">
    <xsl:with-param name="find" select='"&apos;"'/>
    <xsl:with-param name="replace" select='"%27"'/>
    <xsl:with-param name="string" select="$search_url_no_dnavs"/>
  </xsl:call-template>
</xsl:variable>

<!-- *** filter_url: everything except resetting "filter=" *** -->
<xsl:variable name="filter_url">search?<xsl:for-each
  select="/GSP/PARAM[(@name != 'filter') and
                     (@name != 'epoch' or $is_test_search != '') and
                     not(starts-with(@name, 'metabased_'))]">
    <xsl:value-of select="@name"/><xsl:text>=</xsl:text>
    <xsl:value-of select="@original_value"/>
    <xsl:if test="position() != last()">
      <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
    </xsl:if>
  </xsl:for-each>
  <xsl:text disable-output-escaping='yes'>&amp;filter=</xsl:text>
</xsl:variable>

<!-- *** adv_search_url: search? + $search_url + as_q=$q *** -->
<xsl:variable name="adv_search_url">search?<xsl:value-of
  select="$search_url_no_dnavs"/>&amp;proxycustom=&lt;ADVANCED/&gt;</xsl:variable>

<!-- *** exclude_apps: stores the value of exclude_apps query string argument,
      if present. A value of '1' indicates that segmented UI should be
      displayed. Value of '0' indicates that normal blended results UI should be
      displayed. -->
<xsl:variable name="exclude_apps">
  <xsl:choose>
    <xsl:when test="/GSP/PARAM[@name='exclude_apps']">
      <xsl:value-of select="/GSP/PARAM[@name='exclude_apps']/@original_value" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="'1'" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- *** only_apps: A value of '1' indicates returning only Google Apps results. -->
<xsl:variable name="only_apps">
  <xsl:value-of select="/GSP/PARAM[@name='only_apps']/@original_value"/>
</xsl:variable>

<!-- *** db_url_protocol: googledb:// *** -->
<xsl:variable name="db_url_protocol">googledb://</xsl:variable>

<!-- *** googleconnector_protocol: googleconnector:// *** -->
<xsl:variable name="googleconnector_protocol">googleconnector://</xsl:variable>

<!-- *** dbconnector_protocol: dbconnector:// *** -->
<xsl:variable name="dbconnector_protocol">dbconnector://</xsl:variable>

<!-- *** nfs_url_protocol: nfs:// *** -->
<xsl:variable name="nfs_url_protocol">nfs://</xsl:variable>

<!-- *** smb_url_protocol: smb:// *** -->
<xsl:variable name="smb_url_protocol">smb://</xsl:variable>

<!-- *** unc_url_protocol: unc:// *** -->
<xsl:variable name="unc_url_protocol">unc://</xsl:variable>

<!-- *** swr_search_url: search? + $search_url + as_q=$q *** -->
<!-- for secure search no estimates are available so we use a sentinel value of -1 for swrnum -->
<xsl:variable name="swr_search_url">search?<xsl:value-of
  select="$search_url_no_dnavs"/>&amp;swrnum=<xsl:choose>
    <xsl:when test="($access = 'a') or ($access = 's')">
      <xsl:value-of select="-1"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="/GSP/RES/M"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- *** analytics_script_url: http://www.google-analytics.com/ga.js *** -->
<xsl:variable name="analytics_script_url">http://www.google-analytics.com/ga.js</xsl:variable>

<!-- **********************************************************************
 Search Parameters (do not customize)
     ********************************************************************** -->

<!-- *** num_results: actual num_results per page *** -->
<xsl:variable name="num_results">
  <xsl:choose>
    <xsl:when test="/GSP/PARAM[(@name='num') and (@value!='')]">
      <xsl:value-of select="/GSP/PARAM[@name='num']/@value"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="10"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- *** form_params: parameters carried by the search input form *** -->
<xsl:template name="form_params">
  <xsl:for-each
    select="PARAM[@name != 'q' and
                  @name != 'ie' and
                  not(contains(@name, 'as_')) and
                  @name != 'btnG' and
                  @name != 'btnI' and
                  @name != 'site' and
                  @name != 'filter' and
                  @name != 'swrnum' and
                  @name != 'start' and
                  @name != 'access' and
                  @name != 'ip' and
                  @name != 'entqr' and
                  @name != 'entqrm' and
                  @name != 'dnavs' and
                  @name != 'tlen' and
                  @name != 'exclude_apps' and
                  @name != 'only_apps_deb' and
                  (@name != 'epoch' or $is_test_search != '') and
                  not(starts-with(@name ,'metabased_'))]">
        <input type="hidden" name="{@name}" value="{@value}" />
      <xsl:if test="@name = 'oe'">
        <input type="hidden" name="ie" value="{@value}" />
      </xsl:if>
    <xsl:text>
    </xsl:text>
  </xsl:for-each>
  <xsl:if test="not(/GSP/PARAM[@name='only_apps'])">
    <!-- Always provide a value for the exclude_apps hidden field if only_apps param is not present. -->
    <input type="hidden" name="exclude_apps" value="{$exclude_apps}" />
  </xsl:if>
  <xsl:if test="$search_collections_xslt = '' and PARAM[@name='site']">
    <input type="hidden" name="site" value="{PARAM[@name='site']/@value}"/>
  </xsl:if>
  <!--xsl:if test="$res_title_length != $res_title_length_default">
    <input type="hidden" name="tlen" value="{$res_title_length}"/>
  </xsl:if-->
  <input type="hidden" name="tlen" value="{$res_title_length}"/>
</xsl:template>

<!-- *** original query without any dynamic navigation filters *** -->
<xsl:variable name="qval">
  <xsl:choose>
    <xsl:when test="/GSP/PARAM[@name='dnavs']">
      <xsl:value-of select="concat(substring-before(/GSP/Q,
        /GSP/PARAM[@name='dnavs']/@value), ' ', substring-after(/GSP/Q,
        /GSP/PARAM[@name='dnavs']/@value))"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="/GSP/Q"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:variable name="original_q">
  <xsl:choose>
    <xsl:when test="count(/GSP/PARAM[@name='dnavs']) > 0">
      <xsl:value-of
        select="substring-before(/GSP/PARAM[@name='q']/@original_value,
        concat('+', /GSP/PARAM[@name='dnavs']/@original_value))"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="/GSP/PARAM[@name='q']/@original_value"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- *** space_normalized_query: q = /GSP/Q *** -->
<xsl:variable name="space_normalized_query">
  <xsl:value-of select="normalize-space($qval)"
    disable-output-escaping="yes"/>
</xsl:variable>

<!-- *** stripped_search_query: q, as_q, ... for cache highlight *** -->
<xsl:variable name="stripped_search_query"><xsl:for-each
  select="/GSP/PARAM[(@name = 'q') or
                     (@name = 'as_q') or
                     (@name = 'as_oq') or
                     (@name = 'as_epq')]"><xsl:value-of select="@original_value"
  /><xsl:if test="position() != last()"
    ><xsl:text disable-output-escaping="yes">+</xsl:text
     ></xsl:if></xsl:for-each>
</xsl:variable>

<xsl:variable name="access">
  <xsl:choose>
    <xsl:when test="/GSP/PARAM[(@name='access') and ((@value='s') or (@value='a'))]">
      <xsl:value-of select="/GSP/PARAM[@name='access']/@original_value"/>
    </xsl:when>
    <xsl:otherwise>p</xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- **********************************************************************
 Script to get current page.
     ********************************************************************** -->
<xsl:template name="search_home_script">
 <script type="text/javascript">
  function getHomeUrl() { return location.href = "/ealerts?shu=" + escape(document.location.href); }
 </script>
</xsl:template>

<!-- **********************************************************************
 Shown sign-in/sign-out links at the top of the /search page
     ********************************************************************** -->
<xsl:template name="sign_in">
    <xsl:call-template name="search_home_script"/>
    <div class="personalization" width="100%" align="right">
     <xsl:text disable-output-escaping='yes'>&lt;a href='javascript:getHomeUrl();'&gt;My Alerts&lt;/a&gt;</xsl:text>
    </div>
</xsl:template>

<xsl:template name="signed_in">
  <xsl:call-template name="search_home_script"/>
  <div class="personalization" width="100%" align="right">
    <b><xsl:value-of select="/GSP/LOGIN" /></b> |
     <xsl:text disable-output-escaping='yes'>&lt;a href='javascript:getHomeUrl();'&gt;My Alerts&lt;/a&gt;</xsl:text> |
     <xsl:text disable-output-escaping='yes'>&lt;a href='/uam?action=Logout'&gt;Sign Out&lt;/a&gt;</xsl:text>
  </div>
</xsl:template>

<xsl:template name="personalization">
 <xsl:if test="$show_alerts2 = '1'">
  <xsl:choose>
   <xsl:when test="/GSP/PERSONALIZATION">
    <xsl:choose>
      <xsl:when test="/GSP/LOGIN"><xsl:call-template name="signed_in"/></xsl:when>
      <xsl:otherwise><xsl:call-template name="sign_in" /></xsl:otherwise>
    </xsl:choose>
   </xsl:when>
  </xsl:choose>
 </xsl:if>
</xsl:template>

<!-- **********************************************************************
 Figure out what kind of page this is (do not customize)
     ********************************************************************** -->
<xsl:template match="GSP">
  <xsl:choose>
    <xsl:when test="$only_apps = '1' and $show_apps_segmented_ui = '1'">
      <xsl:call-template name="apps_only_search_results"/>
    </xsl:when>
    <xsl:when test="Q">
      <xsl:choose>
        <xsl:when test="($swrnum != 0) or
          (($swrnum = '-1') and (($access = 'a') or ($access = 's')))">
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="search_results"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="CACHE">
      <xsl:choose>
        <xsl:when test="$show_res_cache!='0'">
          <xsl:call-template name="cached_page"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="no_RES"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="CUSTOM/HOME">
      <xsl:call-template name="front_door"/>
    </xsl:when>
    <xsl:when test="CUSTOM/ADVANCED">
      <xsl:call-template name="advanced_search"/>
    </xsl:when>
    <xsl:when test="ERROR">
      <xsl:call-template name="error_page">
        <xsl:with-param name="errorMessage" select="$server_error_msg_text"/>
        <xsl:with-param name="errorDescription" select="$server_error_des_text"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="error_page">
        <xsl:with-param name="errorMessage" select="$xml_error_msg_text"/>
        <xsl:with-param name="errorDescription" select="$xml_error_des_text"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="cached_page">
	<xsl:variable name="cached_page_url" select="CACHE/CACHE_URL"/>
	<xsl:variable name="cached_page_html" select="CACHE/CACHE_HTML"/>
	<xsl:if test="'.pdf' != substring($cached_page_url,
		1 + string-length($cached_page_url) - string-length('.pdf')) and
		not(starts-with($cached_page_url, $db_url_protocol)) and
		not(starts-with($cached_page_url, $nfs_url_protocol)) and
		not(starts-with($cached_page_url, $smb_url_protocol)) and
		not(starts-with($cached_page_url, $unc_url_protocol))">
		<base href="{$cached_page_url}"/>
	</xsl:if>
	<xsl:call-template name="cached_page_header">
		<xsl:with-param name="cached_page_url" select="$cached_page_url"/>
	</xsl:call-template>
	<xsl:value-of select="$cached_page_html" disable-output-escaping="yes"/>
</xsl:template>

<xsl:template name="escape_quot">
  <xsl:param name="string"/>
  <xsl:call-template name="replace_string">
    <xsl:with-param name="find" select="'&quot;'"/>
    <xsl:with-param name="replace" select="'&amp;quot;'"/>
    <xsl:with-param name="string" select="$string"/>
  </xsl:call-template>
</xsl:template>


<!-- **********************************************************************
 Advanced search page (do not customize)
     ********************************************************************** -->
<xsl:template name="advanced_search">

<xsl:variable name="html_escaped_as_q">
    <xsl:call-template name="escape_quot">
      <xsl:with-param name="string">
        <xsl:choose>
          <xsl:when test="/GSP/PARAM[@name='dnavs']">
            <xsl:value-of select="substring-before(/GSP/PARAM[@name='q']/@value,
              /GSP/PARAM[@name='dnavs']/@value)"/>
          </xsl:when>
          <xsl:otherwise><xsl:value-of select="/GSP/PARAM[@name='q']/@value"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:if test="/GSP/PARAM[@name='as_q']/@value">
      <xsl:if test="/GSP/PARAM[@name='q']/@value">
        <xsl:value-of select="' '"/>
      </xsl:if>
      <xsl:call-template name="escape_quot">
        <xsl:with-param name="string" select="/GSP/PARAM[@name='as_q']/@value"/>
      </xsl:call-template>
    </xsl:if>
</xsl:variable>

<xsl:variable name="html_escaped_as_epq">
    <xsl:call-template name="escape_quot">
      <xsl:with-param name="string" select="/GSP/PARAM[@name='as_epq']/@value"/>
    </xsl:call-template>
</xsl:variable>

<xsl:variable name="html_escaped_as_oq">
    <xsl:call-template name="escape_quot">
      <xsl:with-param name="string" select="/GSP/PARAM[@name='as_oq']/@value"/>
    </xsl:call-template>
</xsl:variable>

<xsl:variable name="html_escaped_as_eq">
    <xsl:call-template name="escape_quot">
      <xsl:with-param name="string" select="/GSP/PARAM[@name='as_eq']/@value"/>
    </xsl:call-template>
</xsl:variable>

<!-- Start Output for Advanced Search -->
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
</xsl:text>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title><xsl:value-of select="$adv_page_title"/> | raleighnc.gov</title>
	<meta name="robots" content="NOINDEX,NOFOLLOW"/>
	<link rel="shortcut icon" href="http://www.raleighnc.gov/cor-layout/content/static/styles/images/favicon.ico"/>
	<xsl:call-template name="style"/>
	<xsl:call-template name="analytics"/>
	<script type="text/javascript">
	<xsl:comment>
function setFocus(){document.f.as_q.focus();}function esc(x){x=escape(x).replace(/\+/g,"%2b");if(x.substring(0,2)=="\%u")x="";return x;}function collecturl(target,custom){var p=new Array();var i=0;var url="";var z=document.f;if(z.as_q.value.length){p[i++]='as_q='+esc(z.as_q.value);}if(z.as_epq.value.length){p[i++]='as_epq='+esc(z.as_epq.value);}if(z.as_oq.value.length){p[i++]='as_oq='+esc(z.as_oq.value);}if(z.as_eq.value.length){p[i++]='as_eq='+esc(z.as_eq.value);}if(z.as_sitesearch.value.length){p[i++]='as_sitesearch='+esc(z.as_sitesearch.value);}if(z.as_lq.value.length){p[i++]='as_lq='+esc(z.as_lq.value);}if(z.as_occt.options[z.as_occt.selectedIndex].value.length){p[i++]='as_occt='+esc(z.as_occt.options[z.as_occt.selectedIndex].value);}if(z.as_dt.options[z.as_dt.selectedIndex].value.length){p[i++]='as_dt='+esc(z.as_dt.options[z.as_dt.selectedIndex].value);}if(z.lr.options[z.lr.selectedIndex].value !=''){p[i++]='lr='+z.lr.options[z.lr.selectedIndex].value;}if(z.num.options[z.num.selectedIndex].value !='10'){p[i++]='num='+z.num.options[z.num.selectedIndex].value;}if(z.sort.options[z.sort.selectedIndex].value !=''){p[i++]='sort='+z.sort.options[z.sort.selectedIndex].value;}if(typeof(z.client)!='undefined'){p[i++]='client='+esc(z.client.value);}if(typeof(z.site)!='undefined'){p[i++]='site='+esc(z.site.value);}if(typeof(z.output)!='undefined'){p[i++]='output='+esc(z.output.value);}if(typeof(z.proxystylesheet)!='undefined'){p[i++]='proxystylesheet='+esc(z.proxystylesheet.value);}if(typeof(z.ie)!='undefined'){p[i++]='ie='+esc(z.ie.value);}if(typeof(z.oe)!='undefined'){p[i++]='oe='+esc(z.oe.value);}if(typeof(z.access)!='undefined'){p[i++]='access='+esc(z.access.value);}if(custom!=''){p[i++]='proxycustom='+'&lt;ADVANCED/&gt;';}if(p.length&gt;0){url=p[0];for(var j=1;j&lt;p.length;j++){url+="&amp;"+p[j];}}location.href=target+'?'+ url;}
	// </xsl:comment>
	</script>
</head>
<body dir="ltr">
	<div class="wrapper">
	<xsl:call-template name="personalization"/><xsl:text>
</xsl:text>
	<xsl:call-template name="my_page_header"/><xsl:text>
</xsl:text>
	<div id="contentArea"><xsl:comment>NOT Search Results</xsl:comment>
		<xsl:call-template name="top_sep_bar">
			<xsl:with-param name="show_info" select="0"/>
			<xsl:with-param name="time" select="0"/>
		</xsl:call-template>
		<form method="get" action="search" name="f">
			<input type="hidden" name="tlen" value="255"/>
			<input type="hidden" name="proxyreload" value="1"/>
			<input type="hidden" name="filter" value="0"/>

    <!--====Carry over Search Parameters======-->
      <xsl:if test="PARAM[@name='client']">
        <input type="hidden" name="client"
          value="{PARAM[@name='client']/@value}" />
      </xsl:if>
    <!--==== site is carried over in the drop down if the menu is used =====-->
      <xsl:if test="$search_collections_xslt = '' and PARAM[@name='site']">
        <input type="hidden" name="site" value="{PARAM[@name='site']/@value}"/>
      </xsl:if>
      <xsl:if test="PARAM[@name='output']">
        <input type="hidden" name="output"
          value="{PARAM[@name='output']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='proxystylesheet']">
        <input type="hidden" name="proxystylesheet"
          value="{PARAM[@name='proxystylesheet']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='ie']">
        <input type="hidden" name="ie"
          value="{PARAM[@name='ie']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='oe']">
        <input type="hidden" name="oe"
          value="{PARAM[@name='oe']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='hl']">
        <input type="hidden" name="hl"
          value="{PARAM[@name='hl']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='getfields']">
        <input type="hidden" name="getfields"
          value="{PARAM[@name='getfields']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='requiredfields']">
        <input type="hidden" name="requiredfields"
          value="{PARAM[@name='requiredfields']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='partialfields']">
        <input type="hidden" name="partialfields"
          value="{PARAM[@name='partialfields']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='exclude_apps']">
        <input type="hidden" name="exclude_apps"
          value="{PARAM[@name='exclude_apps']/@value}" />
      </xsl:if>
      <xsl:if test="PARAM[@name='only_apps']">
        <input type="hidden" name="only_apps"
          value="{PARAM[@name='only_apps']/@value}" />
      </xsl:if>
			<div id="Advanced">
				<h3>Find pages with...</h3>
				<ul>
					<li><label>all these words</label>
					<input type="text" name="as_q" class="medium" /></li>
					<li><label>this exact word or phrase</label>
					<input type="text" name="as_epq" class="medium" /></li>
					<li><label>any of these words</label>
					<input type="text" name="as_oq" class="medium" /></li>
					<li><label>none of these words</label>
					<input type="text" name="as_eq" class="medium" /></li>
					<li>
						<label for="ck01">in area</label>
						<select id="ck01" class="medium_select">
							<option value=""></option>
							<option value="/Articles/">Articles</option>
							<option value="/Contacts/">Contacts</option>
							<option value="/BoardsCommissions/Documents/">Minutes/Agendas</option>
							<option value="/Documents/">Documents</option>
						</select>
						<input type="submit" name="btnG1" value="Advanced Search" class="action" onclick="formsubmit()"/>
					</li>
				</ul>
			</div>
			<script type="text/javascript">
				<xsl:comment>
		function formsubmit() {
			var form = document.forms[0];
			var formQuery = document.getElementsByName("as_q")[0];
			var checker = document.getElementById("ck01").value;

			if(checker != "")
				formQuery.value += " inurl:" + checker;
				form.site.value="<xsl:value-of select="$cor_collection"/>";
				form.filter.value="1";

			//Search event tracking
			 _gaq.push(['_setAccount', 'UA-9880547-1'],['_trackEvent', 'Advanced Search', window.location.href]);

			form.submit();
		}
		function getQuerystring(key, default_) {
			if (default_==null)
				default_="";
			key = key.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
			var regex = new RegExp("[\\?&amp;]"+key+"=([^&amp;#]*)");
			var qs = regex.exec(window.location.href);
			if(qs == null)
				return default_;
			else
				return qs[1];
		}
	//
	</xsl:comment>
				</script>
			</form>
		</div>
<xsl:call-template name="my_page_footer"/>
	</div>
</body>
</html>
</xsl:template>

<!-- **********************************************************************
 Resend query with filter=p to disable path_filtering
 if there is only one result cluster (do not customize)
     ********************************************************************** -->
<xsl:template name="redirect_if_few_results">
  <xsl:variable name="count" select="count(/GSP/RES/R)"/>
  <xsl:variable name="start" select="/GSP/RES/@SN"/>
  <xsl:variable name="filterall"
    select="count(/GSP/PARAM[@name='filter']) = 0"/>
  <xsl:variable name="filter" select="/GSP/PARAM[@name='filter']/@value"/>

</xsl:template>

<!-- **********************************************************************
 Google Apps search results (do not customize)
     ********************************************************************** -->
<xsl:template name="apps_only_search_results">
<html>
  <script>
    <xsl:comment>
      /**
       * Initializes the Google Apps results section by notifying the parent
       * document containing the iframe container. The results are passed to
       * the parent iframe container so that it can display the same in the
       * 'div' section reserved for Google Apps results section.
       */
      function initGoogleApps() {
        <xsl:choose>
          <xsl:when test="RES/R">
            var isNextRes = '<xsl:value-of select="/GSP/RES/NB/NU" />';
            var isPrevRes = '<xsl:value-of select="/GSP/RES/NB/PU" />';
            var topNavHtml =
                document.getElementById('top-navigation-html').innerHTML;
            var btmNavHtml =
                document.getElementById('bottom-navigation-html').innerHTML;
            var btmSearchBoxHtml =
                document.getElementById('bottom-search-box-html').innerHTML;
            var resultsDiv = document.getElementById('apps-results-container');
            var resultsContent = resultsDiv.innerHTML;
            resultsDiv.innerHTML = '';
            window.parent.displayGoogleAppsResults(
                true, resultsContent, isNextRes, isPrevRes, topNavHtml,
                btmNavHtml, btmSearchBoxHtml);
          </xsl:when>
          <xsl:otherwise>
            window.parent.displayGoogleAppsResults(false);
          </xsl:otherwise>
        </xsl:choose>
      }
    </xsl:comment>
  </script>
  <xsl:variable name="only_apps_onload">
    <xsl:if test="not(/GSP/PARAM[(@name='only_apps_deb') and (@value='1')])">
      <xsl:text disable-output-escaping="yes">initGoogleApps();</xsl:text>
    </xsl:if>
  </xsl:variable>
	<body onload="{$only_apps_onload}">
		<div id="apps-results-container">
			<div>
				<div class="sb-r-lbl-apps">Google Apps</div>
				<div>
					<xsl:apply-templates select="RES/R">
						<xsl:with-param name="query" select="Q"/>
					</xsl:apply-templates>
					<xsl:if test="RES/R">
						<div style="display:none;" id="top-navigation-html">
							<xsl:if test="$show_top_navigation != '0'">
								<xsl:call-template name="gen_top_navigation" />
							</xsl:if>
						</div>
						<div style="display:none;" id="bottom-navigation-html">
							<xsl:call-template name="gen_bottom_navigation" />
						</div>
					</xsl:if>
				</div>
			</div>
		</div>
	</body>
</html>
</xsl:template>


<!-- **********************************************************************
 Search results (do not customize)
     ********************************************************************** -->
<xsl:template name="search_results">
	<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
</xsl:text>
<html lang="en">
<head>
	<xsl:call-template name="redirect_if_few_results"/>
	<title><xsl:value-of select="$result_page_title"/>: <xsl:value-of select="$space_normalized_query"/></title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta name="robots" content="NOINDEX,NOFOLLOW"/>
	<link rel="shortcut icon" href="http://www.raleighnc.gov/cor-layout/content/static/styles/images/favicon.ico"/>
	<xsl:call-template name="style"/>
<xsl:if test="$render_dynamic_navigation = '1'">
	<script type="text/javascript" src="/dyn_nav_compiled.js"> </script>
	<script type="text/javascript">
		<xsl:variable name="dnavs_param">
			<xsl:if test="/GSP/PARAM[@name='dnavs']"><xsl:value-of select="/GSP/PARAM[@name='dnavs']/@original_value"/></xsl:if>
		</xsl:variable>
		var dynNavMgr = new gsa.search.DynNavManager("<xsl:value-of select="$dnavs_param"/>","<xsl:value-of select="/GSP/PARAM[@name='q']/@original_value"/>","<xsl:value-of select='$original_q'/>","<xsl:value-of select='$no_q_dnavs_params'/>",<xsl:value-of select='/GSP/RES/PARM/PC'/>);
	</script>
</xsl:if>

	<script type="text/javascript">
	<xsl:comment>
	<xsl:if test="$show_sidebar = '1'">
var LEFT_SIDE_RES_CONTAINER='left-side-container';var LEFT_BORDER_STYLE='sb-r-border';var SIDEBAR_CONTAINER='sidebar-container';var SIDEBAR='sidebar';var totalSidebarEleToDisplay=0;var noResultsFromEleCount=0;function initSidebar(){document.getElementById(SIDEBAR).className='';if(!isLeftResultPresent()){var sidebarContainer=document.getElementById(SIDEBAR_CONTAINER);document.getElementById(LEFT_SIDE_RES_CONTAINER).style.display='none';sidebarContainer.className='sb-r-alt';}<xsl:if test="$show_people_search = '1'">totalSidebarEleToDisplay++;</xsl:if><xsl:if test="$show_apps_segmented_ui = '1'">totalSidebarEleToDisplay++;</xsl:if><xsl:if test="$show_gss_results = '1'">totalSidebarEleToDisplay++;</xsl:if><xsl:if test="$show_twitter_results = '1'">totalSidebarEleToDisplay++;</xsl:if><xsl:if test="$show_people_search = '1'">loadPeopleSearchResults();</xsl:if><xsl:if test="$show_apps_segmented_ui = '1'">loadGoogleAppsResults();</xsl:if><xsl:if test="$show_gss_results = '1'">loadGssResults();</xsl:if><xsl:if test="$show_twitter_results = '1'">loadTwitterResults();</xsl:if>}function notifyNoResults(){noResultsFromEleCount++;if noResultsFromEleCount==totalSidebarEleToDisplay) {if(!isLeftResultPresent()){var sidebarContainer=document.getElementById(SIDEBAR_CONTAINER);sidebarContainer.style.display='none';document.getElementById('no-results').style.display='';return true;}}return false;}function notifyResultsPresent(){var sidebar=document.getElementById(SIDEBAR);if(isLeftResultPresent() &amp;&amp;sidebar.className!=LEFT_BORDER_STYLE){document.getElementById(SIDEBAR).className=LEFT_BORDER_STYLE;}}function isLeftResultPresent(){var leftResContainer=document.getElementById(LEFT_SIDE_RES_CONTAINER).getElementsByTagName('div')[0];return leftResContainer.childNodes.length != 0 ? true : false;}
	</xsl:if>
	<xsl:if test="$show_apps_segmented_ui = '1'">
var APPS_LOADING_MSG='loading-app-results';var APPS_RESULTS_CONTAINER='apps-results-container';var APPS_RESULTS_IFRAME='apps-results-iframe';var APPS_RESULTS_MSG_CONTAINER='apps-results-msg';var APPS_RESULTS_SECTION='apps-results-section';var BOTTOM_SEARCH_BOX='bottom-search-box';var NEXT_RESULTS_IN_NON_APPS='<xsl:value-of select="/GSP/RES/NB/NU" />';var ONLY_APPS_QUERY_PARAM='only_apps=1';var PREV_RESULTS_IN_NON_APPS='<xsl:value-of select="/GSP/RES/NB/PU" />';function displayGoogleAppsResults(display, opt_resultsContent, opt_isNextRes, opt_isPrevRes,opt_topNavHtml, opt_btmNavHtml, opt_btmSearchBoxHtml){document.getElementById(APPS_LOADING_MSG).style.display='none';if (!display){notifyNoResults();return;}notifyResultsPresent();if(!NEXT_RESULTS_IN_NON_APPS &amp;&amp; opt_isNextRes || !PREV_RESULTS_IN_NON_APPS &amp;&amp; opt_isPrevRes){document.getElementById('top-navigation').innerHTML=opt_topNavHtml;document.getElementById('bottom-navigation').innerHTML=opt_btmNavHtml;}var resultsDiv=document.getElementById(APPS_RESULTS_SECTION);resultsDiv.innerHTML=opt_resultsContent;resultsDiv.style.display='';if(!isLeftResultPresent()){document.getElementById(BOTTOM_SEARCH_BOX).innerHTML=opt_btmSearchBoxHtml;}}function loadGoogleAppsResults(){var excludeApps=document.getElementsByName('exclude_apps')[0];if(excludeApps.value=='1'){var resultsDiv=document.getElementById(APPS_RESULTS_SECTION);resultsDiv.style.display='none';document.getElementById(APPS_LOADING_MSG).style.display='';var appsResContainer=document.getElementById(APPS_RESULTS_CONTAINER);appsResContainer.style.visibility='visible';var url=window.location.href;if(url.indexOf('exclude_apps=') > -1){url=url.replace(/exclude_apps=./i,ONLY_APPS_QUERY_PARAM);}else{url +='&amp;'+ONLY_APPS_QUERY_PARAM;}document.getElementById(APPS_RESULTS_IFRAME).src=url;}}
	</xsl:if>
	<xsl:if test="$show_gss_results = '1'">
var GSS_LOADING_MSG='loading-gss-results';var GSS_RESULTS_MSG_CONTAINER='gss-results-msg';var GSS_RESULTS_SECTION='gss-results-section';function loadGssResults(){document.getElementById(GSS_LOADING_MSG).style.display='';if(!GSS_JS_API_LOADED){setTimeout('loadGssResults()',500);return;}var gssControl=new google.search.CustomSearchControl('<xsl:value-of select="$gss_search_engine_id" />');gssControl.setResultSetSize(google.search.Search.SMALL_RESULTSET);gssControl.setSearchCompleteCallback(this, gssSearchComplete);var drawOptions=new google.search.DrawOptions();drawOptions.setInput(document.getElementById('gss-hidden-input'));gssControl.draw('gss-results-section',drawOptions);gssControl.execute('<xsl:value-of select="Q" />');}function gssSearchComplete(searchControl,searcher){document.getElementById(GSS_LOADING_MSG).style.display='none';if(!searcher.results.length){notifyNoResults();return;}notifyResultsPresent();document.getElementById(GSS_RESULTS_SECTION).style.display='';document.getElementById(GSS_RESULTS_MSG_CONTAINER).style.display='';}
	</xsl:if>
	<xsl:if test="$show_people_search = '1'">
var PS_RESULTS_MSG_CONTAINER='ps-results-msg';var PS_RESULTS_SECTION='ps-results-section';var PS_LOADING_MSG='loading-ps-results';var PS_CONTENT_ID='people-search-ele';function loadPeopleSearchResults(){var psEle=document.getElementById(PS_CONTENT_ID);if(!psEle){notifyNoResults();return;}notifyResultsPresent();psEle.parentNode.removeChild(psEle);document.getElementById(PS_RESULTS_MSG_CONTAINER).style.display='';var psRes=document.getElementById(PS_RESULTS_SECTION);psRes.appendChild(psEle);psEle.style.display='';psRes.style.display='';}
	</xsl:if>
	<xsl:if test="$show_twitter_results = '1'">
var TWT_RESULTS_MSG_CONTAINER='twitter-results-msg';var TWT_RESULTS_SECTION='twitter-results-section';var TWT_LOADING_MSG='loading-twitter-results';function loadTwitterResults() {document.getElementById(TWT_LOADING_MSG).style.display='';var twitterSearch=new TW_TwitterSearcher(TWT_RESULTS_SECTION,'<xsl:value-of select="$search_url_escaped" />','<xsl:value-of select="$twitter_search_operators" />',3,twitterSearchComplete);twitterSearch.execute();}function twitterSearchComplete(twtResObj){document.getElementById(TWT_LOADING_MSG).style.display='none';if (!twtResObj.results.length){notifyNoResults();return false;}notifyResultsPresent();document.getElementById(TWT_RESULTS_MSG_CONTAINER).style.display='';return true;}
	</xsl:if>
function resetForms(){for(var i=0;i&lt;document.forms.length;i++){document.forms[i].reset();}}var page_query=&quot;<xsl:value-of select="$stripped_search_query"/>&quot;;var page_start=&quot;;<xsl:value-of select="/GSP/PARAM[@name='start']/@value"/>&quot;;var page_site=&quot;<xsl:value-of select="/GSP/PARAM[@name='site']/@value"/>&quot;;
	//</xsl:comment>
	</script>
	<xsl:call-template name="populate_uar_i18n_array"/>
	<xsl:choose>
		<xsl:when test="$show_sidebar = '1'">
			<xsl:if test="$show_suggest != '0' or $show_res_clusters = '1'">
				<script language='javascript' src='common.js'></script>
				<script language='javascript' src='xmlhttp.js'></script>
				<script language='javascript' src='uri.js'></script>
				<xsl:call-template name="gsa_suggest" />
			</xsl:if>
			<xsl:if test="$show_res_clusters = '1'">
				<script language='javascript' src='cluster.js'></script>
			</xsl:if>
		</xsl:when>
		<xsl:when test="$show_res_clusters != '1' and $show_suggest != '0'">
			<script language='javascript' src='common.js'></script>
			<script language='javascript' src='xmlhttp.js'></script>
			<script language='javascript' src='uri.js'></script>
			<xsl:call-template name="gsa_suggest" />
		</xsl:when>
		<xsl:when test="$show_res_clusters = '1' and $show_suggest = '0'">
			<script language='javascript' src='common.js'></script>
			<script language='javascript' src='xmlhttp.js'></script>
			<script language='javascript' src='uri.js'></script>
			<script language='javascript' src='cluster.js'></script>
		</xsl:when>
		<xsl:when test="$show_res_clusters = '1' and $show_suggest != '0'">
			<script language='javascript' src='common.js'></script>
			<script language='javascript' src='xmlhttp.js'></script>
			<script language='javascript' src='uri.js'></script>
			<script language='javascript' src='cluster.js'></script>
			<xsl:call-template name="gsa_suggest" />
		</xsl:when>
	</xsl:choose>
</head>
	<xsl:choose>
	<xsl:when test="$show_sidebar = '1'">
		<xsl:variable name="cs_load_call">
			<xsl:if test="$show_res_clusters = '1'">
				<xsl:text disable-output-escaping="yes">cs_loadClusters('</xsl:text><xsl:value-of select="$search_url_escaped" /><xsl:text disable-output-escaping="yes">', cs_drawClusters);</xsl:text>
			</xsl:if>
		</xsl:variable>
<body onLoad="resetForms(); ss_sf(); {$cs_load_call}" dir="ltr">
<div class="wrapper">
	<xsl:call-template name="search_results_body"/>
	<script type="text/javascript">initSidebar();</script>
</div>
</body>
	</xsl:when>
	<xsl:when test="$show_res_clusters != '1' and $show_suggest != '0'">
<body onLoad="resetForms(); ss_sf();" dir="ltr">
<div class="wrapper">
	<xsl:call-template name="search_results_body"/>
</div>
</body>
	</xsl:when>
	<xsl:when test="$show_res_clusters = '1' and $show_suggest = '0'">
<body onLoad="resetForms(); cs_loadClusters('{$search_url_escaped}', cs_drawClusters);" dir="ltr">
<div class="wrapper">
	<xsl:call-template name="search_results_body"/>
</div>
</body>
	</xsl:when>
	<xsl:when test="$show_res_clusters = '1' and $show_suggest != '0'">
<body onLoad="resetForms(); cs_loadClusters('{$search_url_escaped}', cs_drawClusters); ss_sf();" dir="ltr">
<div class="wrapper">
	<xsl:call-template name="search_results_body"/>
</div>
</body>
	</xsl:when>
	<xsl:otherwise>
<body onLoad="resetForms()" dir="ltr">
<div class="wrapper">
	<xsl:call-template name="search_results_body"/>
</div>
</body>
	</xsl:otherwise>
	</xsl:choose>
</html>
</xsl:template>

<!-- Search Results *********************************************************-->
<xsl:template name="search_results_body">
	<xsl:call-template name="personalization"/>
	<xsl:call-template name="analytics"/>
	<xsl:call-template name="my_page_header"/>
	<div id="contentArea">
		<xsl:call-template name="search_box">
			<xsl:with-param name="type" select="'home'"/>
		</xsl:call-template>
		<xsl:call-template name="top_sep_bar">
			<xsl:with-param name="show_info" select="$show_search_info"/>
			<xsl:with-param name="time" select="TM"/>
		</xsl:call-template>
		<xsl:choose>
			<xsl:when test="$show_sidebar = '1'"><xsl:comment>show_sidebar = '1'</xsl:comment>
				<xsl:call-template name="results">
					<xsl:with-param name="query" select="Q"/>
					<xsl:with-param name="time" select="TM"/>
				</xsl:call-template>
				<div id="no-results" style="display: none;">
					<xsl:call-template name="no_RES">
						<xsl:with-param name="query" select="Q"/>
					</xsl:call-template>
				</div>
			</xsl:when>
			<xsl:when test="RES
						or GM
						or Spelling
						or Synonyms
						or CT
						or (ENTOBRESULTS
						and not(count(ENTOBRESULTS/OBRES) = 1
						and ENTOBRESULTS/OBRES/provider = $uar_provider
						and ENTOBRESULTS/OBRES/count = 0))"><xsl:comment>big test</xsl:comment>
				<xsl:call-template name="results">
					<xsl:with-param name="query" select="Q"/>
					<xsl:with-param name="time" select="TM"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="Q=''">
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="no_RES">
					<xsl:with-param name="query" select="Q"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</div>
	<xsl:call-template name="my_page_footer"/>
	<xsl:if test="$show_asr != '0'">
		<script language='javascript' src='clicklog_compiled.js'></script>
	</xsl:if>
	<xsl:if test="$render_dynamic_navigation = '1'">
		<script type="text/javascript">dynNavMgr.init();</script>
	</xsl:if>
</xsl:template>


<!--***********************************************
    Sort-by criteria: sort by date/relevance
************************************************-->
<xsl:template name="sort_by">
  <xsl:variable name="sort_by_url"><xsl:for-each
    select="/GSP/PARAM[(@name != 'sort') and
                       (@name != 'start') and
                       (@name != 'epoch' or $is_test_search != '') and
                       not(starts-with(@name, 'metabased_'))]">
      <xsl:choose>
        <xsl:when test="@name = 'only_apps' and $show_apps_segmented_ui = '1'">
          <xsl:value-of select="'exclude_apps=1'" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@name"/><xsl:text>=</xsl:text>
          <xsl:value-of select="@original_value"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="position() != last()">
        <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="sort_by_relevance_url">
    <xsl:value-of select="$sort_by_url"/>&amp;sort=date%3AD%3AL%3Ad1</xsl:variable>
  <xsl:variable name="sort_by_date_url">
    <xsl:value-of select="$sort_by_url"/>&amp;sort=date%3AD%3AS%3Ad1</xsl:variable>
	<ul id="search_sort_by">
		<li>
		<xsl:choose>
			<xsl:when test="/GSP/PARAM[@name = 'sort' and starts-with(@value,'date:D:S')]">
				<xsl:text>sort by: </xsl:text><br/> <strong>Date</strong> <xsl:text> | </xsl:text> <a href="search?{$sort_by_relevance_url}" ctype="sort">Relevance</a>
			</xsl:when>
			<xsl:when test="/GSP/PARAM[@name = 'sort' and starts-with(@value,'date:A:S')]">
				<xsl:text>sort by: </xsl:text><br/> <strong>Date</strong> <xsl:text> | </xsl:text> <a href="search?{$sort_by_relevance_url}" ctype="sort">Relevance</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>sort by: </xsl:text><br/> <a href="search?{$sort_by_date_url}" ctype="sort">Date</a> <xsl:text> | </xsl:text> <strong>Relevance</strong>
			</xsl:otherwise>
		</xsl:choose>
		</li>
	</ul>
</xsl:template>


<xsl:template name="cluster_results">
	<div id='clustering'>
		<div class="dn-attr-hdr clustering dn-attr dn-attr-h dn-attr-narrow">Google Recommends...</div>
		<span id='cluster_status'>
			<span id='cluster_message' style="display:none">loading...</span>
			<noscript>JavaScript must be enabled.</noscript>
		</span>
		<xsl:choose>
			<xsl:when test="$res_cluster_position = 'top'">
				<ul class="dn-attr" style="margin-left: 10px;">
					<li id='cluster_label0'></li>
					<li id='cluster_label2'></li>
					<li id='cluster_label4'></li>
					<li id='cluster_label6'></li>
					<li id='cluster_label8'></li>
					<li id='cluster_label1'></li>
					<li id='cluster_label3'></li>
					<li id='cluster_label5'></li>
					<!--li id='cluster_label7'></li>
					<li id='cluster_label9'></li-->
				</ul>
			</xsl:when>
			<xsl:when test="$res_cluster_position = 'right'">
				<ul style="margin:8px 0;">
					<li id='cluster_label0'></li>
					<li id='cluster_label1'></li>
					<li id='cluster_label2'></li>
					<li id='cluster_label3'></li>
					<li id='cluster_label4'></li>
					<li id='cluster_label5'></li>
					<li id='cluster_label6'></li>
					<li id='cluster_label7'></li>
					<!--li id='cluster_label8'></li>
					<li id='cluster_label9'></li-->
				</ul>
			</xsl:when>
		</xsl:choose>
	</div>
</xsl:template>


<xsl:template name="gen_top_navigation">
	<xsl:if test="RES">
		<xsl:if test="$show_top_navigation != '0'">
			<div class="sortBy">
				<xsl:call-template name="google_navigation">
					<xsl:with-param name="prev" select="RES/NB/PU"/>
					<xsl:with-param name="next" select="RES/NB/NU"/>
					<xsl:with-param name="view_begin" select="RES/@SN"/>
					<xsl:with-param name="view_end" select="RES/@EN"/>
					<xsl:with-param name="guess" select="RES/M"/>
					<xsl:with-param name="navigation_style" select="'top'"/>
				</xsl:call-template>
			</div>
		</xsl:if>
		<!--xsl:if test="$show_sort_by != '0'">
			<div class="sortBy">
				<xsl:call-template name="sort_by"/>
			</div>
		</xsl:if-->
	</xsl:if>
</xsl:template>


<xsl:template name="gen_bottom_navigation">
	<xsl:if test="RES">
		<xsl:variable name="nav_style">
			<xsl:choose>
				<xsl:when test="($access='s') or ($access='a')"><xsl:value-of select="$secure_bottom_navigation_type"/></xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$choose_bottom_navigation"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:call-template name="google_navigation">
			<xsl:with-param name="prev" select="RES/NB/PU"/>
			<xsl:with-param name="next" select="RES/NB/NU"/>
			<xsl:with-param name="view_begin" select="RES/@SN"/>
			<xsl:with-param name="view_end" select="RES/@EN"/>
			<xsl:with-param name="guess" select="RES/M"/>
			<xsl:with-param name="navigation_style" select="$nav_style"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>


<!--****************************
    Output all results
*****************************-->
<xsl:template name="results">
	<xsl:param name="query"/>
	<xsl:param name="time"/>
	<xsl:choose>
		<xsl:when test="$render_dynamic_navigation = '1'">
			<xsl:call-template name="dynamic_navigation_results">
				<xsl:with-param name="query" select="$query"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:if test="$show_top_navigation != '0' or $show_sort_by != '0'">
				<xsl:if test="RES or $show_sidebar = '1'">
					<div id="top-navigation">
						<xsl:call-template name="gen_top_navigation" />
					</div>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$show_onebox != '0' and count(/GSP/ENTOBRESULTS) &gt; 0">
				<xsl:call-template name="onebox"/>
				<script>
					<xsl:comment>if (window['populateUarMessages']) { populateUarMessages(); } //</xsl:comment>
				</script>
			</xsl:if>
			<div id="col3" class="hidden">
				<div class="box related">
					<h3>Modified</h3>
					<ul>
						<li><a onclick="dateSearch(1);">Last day or 24 hours</a></li>
						<li><a onclick="dateSearch(7);">Last week</a></li>
						<li><a onclick="dateSearch(30);">Last month</a></li>
						<li><a onclick="dateSearch(365);">Last year</a></li>
					</ul>
				</div>
				<div class="box related">
					<h3>Type</h3>
					<ul>
						<li><a onclick="typeSearch(/Articles/);">Pages</a></li>
						<li><a onclick="typeSearch(/Documents/);">Documents</a></li>
                        <li><a id="DataPortal">Data</a></li>
						<li><a onclick="typeSearch(/CorNews/);">News/Events</a></li>
						<li><a onclick="typeSearch(/Contacts/);">Contacts</a></li>
						<li><a onclick="typeSearch(/Archive/);">Agendas/Minutes</a></li>
					</ul>

				</div>
				<xsl:if test="$show_res_clusters = '1'">
					<xsl:call-template name="cluster_results"/>
				</xsl:if>
				<xsl:if test="$show_people_search = '1'">
					<div id="ps-results-container">
						<div id="loading-ps-results" class="sb-r-ld-msg-c" style="display:none;">
							<span class="sb-r-lbl">Loading People search results...</span>
						</div>
						<div id="ps-results-msg" class="sb-r-lbl" style="display:none;" >People</div>
						<div id="ps-results-section" class="sb-r-res" style="display:none;">
						</div>
					</div>
				</xsl:if>
				<div class="box related">
					<h3>Explore Our Archive</h3>
					<ul>
						<li><a href="http://wayback.archive-it.org/2870/*/http://www.raleighnc.gov/" target="_blank">View our site by past weeks</a></li>
					</ul>
				</div>
			</div>
			<!-- <div class="content">
				<xsl:call-template name="search_box">
					<xsl:with-param name="type" select="'home'"/>
				</xsl:call-template> -->
				<xsl:call-template name="main_results">
					<xsl:with-param name="query" select="$query"/>
				</xsl:call-template>
			<!-- </div> -->
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template name="dynamic_navigation_results">
	<xsl:param name="query"/>
	<xsl:variable name="dn_tokens" select="tokenize(/GSP/PARAM[@name='dnavs']/@original_value, '\+')"/>
	<xsl:if test="$show_sort_by != '0' or $show_spelling != '0' or $show_synonyms != '0'">
		<xsl:if test="RES">
			<xsl:if test="$show_spelling != '0' or $show_synonyms != '0'">
				<div id="spelling_suggestion">
					<xsl:choose>
						<xsl:when test="$show_spelling != '0'">
							<xsl:call-template name="spelling"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="synonyms"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</xsl:if>
		</xsl:if>
	</xsl:if>
	<xsl:variable name="dn_tokens" select="tokenize(/GSP/PARAM[@name='dnavs']/@original_value, '\+')"/>
	<div id="col3" class="hidden">
		<div class="box related">
			<h3>Modified</h3>
			<ul>
				<li><a onclick="dateSearch(1);">Last day or 24 hours</a></li>
				<li><a onclick="dateSearch(7);">Last week</a></li>
				<li><a onclick="dateSearch(30);">Last month</a></li>
				<li><a onclick="dateSearch(365);">Last year</a></li>
			</ul>
		</div>
		<div class="box related">
			<h3>Type</h3>
			<ul>
				<li><a onclick="typeSearch(/Articles/);">Pages</a></li>
				<li><a onclick="typeSearch(/Documents/);">Documents</a></li>
				<li><a onclick="typeSearch(/CorNews/);">News/Events</a></li>
				<li><a onclick="typeSearch(/Contacts/);">Contacts</a></li>
				<li><a onclick="typeSearch(/Archive/);">Agendas/Minutes</a></li>
			</ul>
		</div>
		<xsl:apply-templates select="/GSP/RES/PARM/PMT">
			<xsl:with-param name="dn_tokens" select="$dn_tokens"/>
			<xsl:with-param name="partial_count" select="/GSP/RES/PARM/PC"/>
		</xsl:apply-templates>
		<xsl:if test="$show_res_clusters = '1'">
			<xsl:call-template name="cluster_results"/>
		</xsl:if>
		<script type="text/javascript">
			<xsl:for-each select="$dn_tokens">
				dynNavMgr.addSelectedAttr("<xsl:value-of select='.'/>");
			</xsl:for-each>
			<xsl:apply-templates select="/GSP/RES/PARM/PMT" mode="hidden"/>
		</script>
		<xsl:if test="$show_people_search = '1'">
			<div id="ps-results-container">
				<div id="loading-ps-results" class="sb-r-ld-msg-c" style="display:none;">
					<span class="sb-r-lbl">Loading People search results...</span>
				</div>
				<div id="ps-results-msg" class="sb-r-lbl" style="display:none;" >People</div>
				<div id="ps-results-section" class="sb-r-res" style="display:none;"></div>
			</div>
		</xsl:if>
		<div class="box related">
			<h3>Explore Our Archive</h3>
			<ul>
				<li><a href="http://wayback.archive-it.org/2870/*/http://www.raleighnc.gov/" target="_blank">View our site by past weeks</a></li>
			</ul>
		</div>
	</div>
	<xsl:call-template name="main_results">
		<xsl:with-param name="query" select="$query"/>
		<xsl:with-param name="dn_tokens" select="$dn_tokens"/>
	</xsl:call-template>
</xsl:template>


<xsl:template name="escapeQuot">
  <xsl:param name="text"/>
  <xsl:choose>
    <xsl:when test="contains($text, '&quot;')">
      <xsl:variable name="bufferBefore" select="substring-before($text, '&quot;')"/>
      <xsl:variable name="newBuffer" select="substring-after($text, '&quot;')"/>
      <xsl:value-of select="$bufferBefore"/><xsl:text>\"</xsl:text>
      <xsl:call-template name="escapeQuot">
        <xsl:with-param name="text" select="$newBuffer"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$text"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- This template is specifically needed to hide the lag in rendering for the
     dynamic navigation attributes with large set of values. Since only the top
     few values need to be displayed, the rest are added to the dynNavMgr JS
     instance for rendering later on demand ('More' click). -->
<xsl:template match="PMT" mode="hidden">
	<xsl:variable name="name"><xsl:value-of select="normalize-space(@NM)"/></xsl:variable>
  <xsl:if test="@IR != 1">
    <xsl:variable name="values">
      [<xsl:for-each select="PV[position() &gt; $dyn_nav_max_rows and @C != '0']">["<xsl:call-template
          name='escapeQuot'><xsl:with-param name="text" select="@V"/>
          </xsl:call-template>", <xsl:value-of select='@C'/>]<xsl:if
          test="position() != last()">,</xsl:if></xsl:for-each>]
    </xsl:variable>
    <xsl:variable name="attr_id"><xsl:value-of select="concat('attr_', string(position()))"/></xsl:variable>

    dynNavMgr.addAttrValues("<xsl:value-of select='$name'/>", <xsl:value-of select='$values'/>);
  </xsl:if>
</xsl:template>

<xsl:template match="PMT">
  <xsl:param name="dn_tokens"/>
  <xsl:param name="partial_count"/>

  <xsl:variable name="name"><xsl:value-of select="normalize-space(@NM)"/></xsl:variable>
  <xsl:variable name="pmt_name"><xsl:call-template
      name="term-escape"><xsl:with-param name="val" select="@NM"/></xsl:call-template>
  </xsl:variable>
<div class="box related">
  <xsl:choose>
    <xsl:when test="@IR = 1">
      <ul id="{$name}" class="dn-attr">
        <li class="dn-attr-hdr"><span class="dn-attr-hdr-txt"><xsl:attribute
            name="title"><xsl:value-of select="@DN" disable-output-escaping="yes"/>
        </xsl:attribute><xsl:value-of select="@DN"/></span></li>
        <xsl:apply-templates select="PV">
          <xsl:with-param name="pmt_name" select="$pmt_name"/>
          <xsl:with-param name="dn_tokens" select="$dn_tokens"/>
          <xsl:with-param name="partial_count" select="$partial_count"/>
        </xsl:apply-templates>
      </ul>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="total" select="count(PV[@C != '0'])"/>
      <xsl:variable name="attr_class">
        <xsl:choose>
          <xsl:when test="$total &lt; $dyn_nav_max_rows + 1">
            <xsl:value-of select="'dn-attr'"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="'dn-attr dn-attr-more'"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="attr_id"><xsl:value-of select="concat('attr_', string(position()))"/></xsl:variable>
      <xsl:choose>
        <xsl:when test="$total &lt; $dyn_nav_max_rows + 1">
          <h3 class="dn-attr-hdr"><span class="dn-attr-hdr-txt"><xsl:attribute name="title"><xsl:value-of select="@DN" disable-output-escaping="yes"/>
          </xsl:attribute><xsl:value-of select="@DN"/></span></h3>
        </xsl:when>
        <xsl:otherwise>
          <h3 class="dn-attr-hdr"><div class="dn-zippy-hdr">
          <span class="dn-attr-hdr-txt"><xsl:attribute name="title"><xsl:value-of select="@DN" disable-output-escaping="yes"/>
          </xsl:attribute><xsl:value-of select="@DN"/></span></div></h3>
        </xsl:otherwise>
      </xsl:choose>
      <ul id="{$name}" class="{$attr_class}">
        <xsl:apply-templates select="PV[position() &lt; $dyn_nav_max_rows + 1]">
          <xsl:with-param name="pmt_name" select="$pmt_name"/>
          <xsl:with-param name="header" select="@DN"/>
          <xsl:with-param name="dn_tokens" select="$dn_tokens"/>
          <xsl:with-param name="partial_count" select="$partial_count"/>
        </xsl:apply-templates>

        <xsl:variable name="total_left" select="$total - $dyn_nav_max_rows"/>
        <xsl:if test="$total &gt; $dyn_nav_max_rows">
          <li id="{$name}_more_less">
            <a id="more_{$name}" class="dn-link" style="margin-right: 10px; outline-style: none;"
              onclick="dynNavMgr.displayMore('{$name}', true); return false;"
              href="javascript:;">
              <xsl:attribute name="ctype">
                  <xsl:text>dynnav.</xsl:text>
                  <xsl:value-of select="$name" disable-output-escaping="no"/>
                  <xsl:text>.more</xsl:text>
              </xsl:attribute>
              <span class="dn-more-img dn-mimg"></span>
              <span id="disp_{$name}"><xsl:value-of
              select="$total_left"/></span><span> More</span>
            </a>
            <a id="less_{$name}" class="dn-link dn-hidden" style="outline-style: none;"
              onclick="dynNavMgr.displayMore('{$name}', false, {$total_left}); return false;"
              href="javascript:;">
              <xsl:attribute name="ctype">
                <xsl:text>dynnav.</xsl:text>
                <xsl:value-of select="$name" disable-output-escaping="no"/>
                <xsl:text>.less</xsl:text>
              </xsl:attribute>
              <span class="dn-more-img dn-limg"></span>
              <span>Less</span>
            </a>
          </li>
          <label class="dn-hidden dn-name"><xsl:value-of select="$name"/></label>
          <label id="{$name}_escaped" class="dn-hidden"><xsl:value-of select="$pmt_name"/></label>
          <label id="{$name}_total" class="dn-hidden"><xsl:value-of select="$total"/></label>
          <label id="{$name}_total_left" class="dn-hidden"><xsl:value-of select="$total_left"/></label>
        </xsl:if>
      </ul>
    </xsl:otherwise>
  </xsl:choose>
	</div>
</xsl:template>

<xsl:template match="PV">
  <xsl:param name="pmt_name"/>
  <xsl:param name="header"/>
  <xsl:param name="dn_tokens"/>
  <xsl:param name="partial_count"/>

  <xsl:if test="@C != 0">
    <xsl:apply-templates select="." mode="construct">
      <xsl:with-param name="dn_tokens" select="$dn_tokens"/>
      <xsl:with-param name="header" select="$header"/>
      <xsl:with-param name="partial_count" select="$partial_count"/>
      <xsl:with-param name="current_token">
        <xsl:choose>
          <xsl:when test="../@IR = '1'"><xsl:variable
            name="stripped_l" select="normalize-space(@L)"/><xsl:variable
            name="stripped_h" select="normalize-space(@H)"/>inmeta:<xsl:value-of
            select="$pmt_name"/>:<xsl:choose><xsl:when test="../@T = 3"><xsl:if
            test="$stripped_l != ''">$<xsl:value-of select="$stripped_l"/></xsl:if>..<xsl:if
            test="$stripped_h != ''">$<xsl:value-of
            select="$stripped_h"/></xsl:if></xsl:when><xsl:otherwise><xsl:value-of
            select="$stripped_l"/>..<xsl:value-of select="$stripped_h"/></xsl:otherwise></xsl:choose>
          </xsl:when>
          <xsl:otherwise>inmeta:<xsl:value-of select="$pmt_name"/>%3D<xsl:call-template
              name="term-escape"><xsl:with-param name="val" select="@V"/></xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:with-param>
    </xsl:apply-templates>
  </xsl:if>
</xsl:template>

<xsl:template match="PV" mode="construct">
  <xsl:param name="dn_tokens"/>
  <xsl:param name="header"/>
  <xsl:param name="current_token"/>
  <xsl:param name="partial_count"/>

  <xsl:variable name="dispval">
    <xsl:apply-templates select="." mode="display_value"/>
  </xsl:variable>

  <xsl:variable name="dispcount">
    <xsl:text> (</xsl:text><xsl:if
       test="$partial_count=1"><xsl:text>&gt; </xsl:text></xsl:if>
      <xsl:value-of select="@C"/><xsl:text>)</xsl:text>
  </xsl:variable>

  <xsl:variable name="is_selected" select="index-of($dn_tokens, $current_token)"/>
  <li>
    <xsl:choose>
      <xsl:when test="exists($is_selected)">
        <xsl:variable name="other_tokens">
          <xsl:value-of select="string-join(remove($dn_tokens, $is_selected[position()=1]), '+')"/>
        </xsl:variable>

        <xsl:variable name="cancel_url">
          <xsl:value-of select="$no_q_dnavs_params"/>&amp;q=<xsl:value-of
            select="$original_q"/><xsl:if test="$other_tokens != ''">+<xsl:value-of
            select="$other_tokens"/>&amp;dnavs=<xsl:value-of select="$other_tokens"/></xsl:if>
        </xsl:variable>

        <a class="dn-img dn-r-img" href="/search?{$cancel_url}"
            title="Clear">
          <xsl:attribute name="ctype">
            <xsl:text>dynnav.clear.</xsl:text>
            <xsl:value-of select="$header" disable-output-escaping="no"/>
          </xsl:attribute>
        </a>
        <span class="dn-overflow dn-inline-block" style="width:86%;">
          <xsl:if test="../@IR != 1">
            <xsl:attribute name="title"><xsl:value-of select="$dispval"
                disable-output-escaping="yes"/></xsl:attribute>
          </xsl:if>
          <xsl:value-of select="concat($dispval, $dispcount)"
              disable-output-escaping="yes"/>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="pmts_var">dnavs=<xsl:if test="/GSP/PARAM[@name='dnavs']"><xsl:value-of
            select="/GSP/PARAM[@name='dnavs']/@original_value"/>+</xsl:if><xsl:value-of
            select="$current_token"/>
        </xsl:variable>
        <xsl:variable name="qurl"><xsl:value-of select="$no_q_dnavs_params"/>&amp;q=<xsl:value-of
            select="/GSP/PARAM[@name='q']/@original_value"/>+<xsl:value-of
            select="$current_token"/>&amp;<xsl:value-of select="$pmts_var"/>
        </xsl:variable>
        <a class="dn-attr-v" href="/search?{$qurl}">
          <xsl:attribute name="ctype">
            <xsl:text>dynnav.</xsl:text>
            <xsl:value-of select="$header" disable-output-escaping="no"/>
            <xsl:text>.</xsl:text>
            <xsl:value-of select="$dispval" disable-output-escaping="no"/>
          </xsl:attribute>
          <xsl:if test="../@IR != 1">
            <xsl:attribute name="title"><xsl:value-of select="$dispval"
                disable-output-escaping="no"/></xsl:attribute>
          </xsl:if>
          <xsl:value-of select="$dispval" disable-output-escaping="yes"/>
          <span class="dn-attr-c"><xsl:value-of select="$dispcount"
              disable-output-escaping="yes"/></span>
        </a>
      </xsl:otherwise>
    </xsl:choose>
  </li>
</xsl:template>

<xsl:template match="PV" mode="display_value">
  <xsl:choose>
    <xsl:when test="../@IR = 1">
      <xsl:variable name="disp_l">
        <xsl:call-template name="pmt_range_display_val">
          <xsl:with-param name="val" select="@L"/>
          <xsl:with-param name="type" select="../@T"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="disp_h">
        <xsl:call-template name="pmt_range_display_val">
          <xsl:with-param name="val" select="@H"/>
          <xsl:with-param name="type" select="../@T"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$disp_l = ''">
          <xsl:value-of select="$disp_h"/><xsl:text> </xsl:text>
          <xsl:choose>
            <xsl:when test="../@T = 4">or earlier</xsl:when>
            <xsl:otherwise>or less</xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$disp_h = ''">
          <xsl:value-of select="$disp_l"/><xsl:text> </xsl:text>
          <xsl:choose>
            <xsl:when test="../@T = 4">or later</xsl:when>
            <xsl:otherwise>or more</xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise><xsl:value-of
          select="$disp_l"/><xsl:text> </xsl:text><xsl:call-template
          name="endash"/><xsl:text> </xsl:text><xsl:value-of select="$disp_h"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="@V"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:variable name="hex">0123456789ABCDEF</xsl:variable>
<xsl:template name="term-escape">
  <xsl:param name="val"/>
  <xsl:variable name="first-char" select="substring($val, 1, 1)"/>
  <xsl:variable name="code"
    select="string-to-codepoints($first-char)[position()=1]"/>
  <xsl:choose>
    <xsl:when test="not(($code >= 48 and $code &lt;= 57) or
      ($code >= 65 and $code &lt;= 90) or ($code = 95) or
      ($code >= 97 and $code &lt;= 122))">
      <xsl:choose>
        <xsl:when test="$code > 128">
          <xsl:value-of select="encode-for-uri($first-char)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="hex-digit1"
            select="substring($hex, floor($code div 16) + 1, 1)"/>
          <xsl:variable name="hex-digit2"
            select="substring($hex, $code mod 16 + 1, 1)"/>
          <xsl:value-of select="concat('%25', $hex-digit1 ,$hex-digit2)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$first-char"/>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:if test="string-length($val) > 1">
    <xsl:call-template name="term-escape">
      <xsl:with-param name="val" select="substring($val, 2)"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xsl:template name="pmt_range_display_val">
  <xsl:param name="val"/>
  <xsl:param name="type"/>
  <xsl:choose>
    <xsl:when test="$val != '' and ($type = 2 or $type = 3)">
      <xsl:value-of select="format-number($val, '#.##')"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$val"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template name="main_results">
	<xsl:param name="query"/>
	<xsl:param name="dn_tokens"/>
	<xsl:choose>
		<xsl:when test="$show_sidebar = '1'">
			<div id="left-side-container">
				<xsl:call-template name="render_main_results">
					<xsl:with-param name="query" select="$query"/>
				</xsl:call-template>
			</div>
			<div id="sidebar-container" class="sb-r" valign="top">
				<div id="col3" class="hidden">
					<xsl:if test="$show_people_search = '1'">
						<div id="ps-results-container">
							<div id="loading-ps-results" class="sb-r-ld-msg-c" style="display:none;">
								<span class="sb-r-lbl">Loading People search results...</span>
							</div>
							<div id="ps-results-msg" class="sb-r-lbl" style="display:none;" >People</div>
							<div id="ps-results-section" class="sb-r-res" style="display:none;">
							</div>
						</div>
					</xsl:if>
					<xsl:if test="$show_apps_segmented_ui = '1'">
						<div id="apps-results-container">
							<div id="loading-app-results" class="sb-r-ld-msg-c" style="display:none;">
								<span class="sb-r-lbl">Loading Google Apps results...</span>
							</div>
							<div style="display: none;" id="apps-results-msg" class="sb-r-lbl"></div>
							<div id="apps-results-section" class="sb-r-res" style="display:none;">
							</div>
							<iframe scrolling="no" id="apps-results-iframe" frameborder="0" style="display:none;">
							</iframe>
						</div>
					</xsl:if>
					<xsl:if test="$show_gss_results = '1'">
						<div id="gss-results-container">
							<div id="loading-gss-results" class="sb-r-ld-msg-c" style="display:none;">
								<span class="sb-r-lbl">Loading Google Site Search results...</span>
							</div>
							<div id="gss-results-msg" class="sb-r-lbl" style="display:none;" >Google Site Search</div>
							<div id="gss-results-section" class="sb-r-res" style="display:none">
							</div>
							<input style="display:none" id="gss-hidden-input" />
						</div>
					</xsl:if>
					<xsl:if test="$show_twitter_results = '1'">
						<div id="twitter-results-container">
							<div id="loading-twitter-results" class="sb-r-ld-msg-c" style="display:none;">
								<span class="sb-r-lbl">Loading Twitter results...</span>
							</div>
							<div id="twitter-results-msg" class="sb-r-lbl" style="display:none;" >Twitter</div>
							<div id="twitter-results-section" class="sb-r-res" style="display:none">
							</div>
						</div>
					</xsl:if>
				</div>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="render_main_results">
				<xsl:with-param name="query" select="$query"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
	<div id="bottom-navigation">
		<xsl:call-template name="gen_bottom_navigation" />
	</div>
	<xsl:if test="$show_twitter_results = '1'">
		<script src="twitter.js" type="text/javascript"></script>
	</xsl:if>
	<!-- *** Load resources for showing document previews, if enabled *** -->
  <xsl:if test="$show_document_previews = '1'">
    <xsl:call-template name="populate_previewer_i18n_array"/>
    <script src="{$gsa_resource_root_path_prefix}/dpsjsclient/dps.min.js"
        type="text/javascript"></script>
    <script src="{$gsa_resource_root_path_prefix}/json2.js"
        type="text/javascript"></script>
    <script src="{$gsa_resource_root_path_prefix}/previewer.js"
        type="text/javascript"></script>
    <xsl:if test="/GSP/PREVIEWS">
      <script type="text/javascript">
      <xsl:comment>
        <xsl:value-of select="/GSP/PREVIEWS"/>
      //</xsl:comment>
      </script>
    </xsl:if>
    <link rel="stylesheet"
      href="{$gsa_resource_root_path_prefix}/dpsjsclient/dps-floating-viewer.css"
      type="text/css">
    </link>
    <xsl:if test="$is_embedded_mode = '1'">
      <script type="text/javascript">
        if (window['DPS']) {
          DPS.forwardingProxy =
              '<xsl:value-of select="$embedded_mode_resource_root_path_prefix" />';
          <xsl:if test="$embedded_mode_dps_viewer_host != ''">
          <xsl:variable name="embedded_mode_dps_viewer_host_to_use"
            select="if (starts-with($embedded_mode_dps_viewer_host, 'http://'))
                    then
                       $embedded_mode_dps_viewer_host
                    else
                       concat('http://', $embedded_mode_dps_viewer_host)" />
          // Disable the full preview mode in SharePoint embedded mode.
          DPS.onPageClick = function() { return false; };
          </xsl:if>
        }
      </script>
      <style type="text/css">
        div.floating-viewer-header .controls {
          background-image: url("<xsl:value-of select="$embedded_mode_resource_root_path_prefix"/>/dpsjsclient/buttons.png");
        }
        div.result-item-hover span.toggle-preview {
          background-image: url("<xsl:value-of select="$embedded_mode_resource_root_path_prefix"/>/preview_on.png") !important;
        }
        body.previews-enabled span.toggle-preview {
          background-image: url("<xsl:value-of select="$embedded_mode_resource_root_path_prefix"/>/preview_off.png");
        }
      </style>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="render_main_results">
	<xsl:param name="query"/>
	<div id="col2">
		<div class="content">
			<!-- <xsl:if test="$show_spelling != '0'">
				<xsl:call-template name="spelling"/>
			</xsl:if> -->
			<xsl:if test="$show_synonyms != '0'">
				<xsl:call-template name="synonyms"/>
			</xsl:if>
			<xsl:if test="(RES/FI) and (not(RES/NB/NU))">
				<div id="omitted">In order to show you the most relevant results, we have omitted some entries very similar to the <xsl:value-of select="RES/@EN"/> already displayed. If you like, you can <a href="{$filter_url}0">repeat the search with the omitted results included</a>.</div>
			</xsl:if>
			<xsl:if test="$show_keymatch != '0'">
				<xsl:apply-templates select="/GSP/GM"/>
			</xsl:if>
			<xsl:apply-templates select="RES/R">
				<xsl:with-param name="query" select="$query"/>
			</xsl:apply-templates>
		</div>
	</div>
</xsl:template>


<!-- **********************************************************************
 Stopwords suggestions in result page (do not customize)
     ********************************************************************** -->
<xsl:template name="stopwords">
  <xsl:variable name="stopwords_suggestions1">
    <xsl:call-template name="replace_string">
      <xsl:with-param name="find" select="'/help/basics.html#stopwords'"/>
      <xsl:with-param name="replace" select="'user_help.html#stop'"/>
      <xsl:with-param name="string" select="/GSP/CT"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="stopwords_suggestions">
    <xsl:call-template name="replace_string">
      <xsl:with-param name="find" select="'/help/basics.html'"/>
      <xsl:with-param name="replace" select="'user_help.html'"/>
      <xsl:with-param name="string" select="$stopwords_suggestions1"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:if test="/GSP/CT">
      <xsl:value-of disable-output-escaping="yes"
        select="$stopwords_suggestions"/>
  </xsl:if>
</xsl:template>

<!-- **********************************************************************
 Spelling suggestions in result page (do not customize)
     ********************************************************************** -->
<xsl:template name="spelling">
	<xsl:if test="/GSP/Spelling/Suggestion">
		<h3 id="search_stats">
			<span style="color:#DD4B39;">Did you mean:
				<xsl:call-template name="nbsp"/>
			</span>
			<xsl:variable name="apps_param">
				<xsl:choose>
					<xsl:when test="/GSP/PARAM[@name='exclude_apps']">
						<xsl:text disable-output-escaping='yes'>&amp;exclude_apps=</xsl:text>
						<xsl:value-of select="/GSP/PARAM[@name='exclude_apps']/@original_value" />
					</xsl:when>
					<xsl:when test="/GSP/PARAM[@name='only_apps']">
						<xsl:text disable-output-escaping='yes'>&amp;only_apps=</xsl:text>
						<xsl:value-of select="/GSP/PARAM[@name='only_apps']/@original_value" />
					</xsl:when>
				</xsl:choose>
			</xsl:variable>
			<a ctype="spell" href="search?q={/GSP/Spelling/Suggestion[1]/@qe}&amp;spell=1&amp;{$synonym_url}{$apps_param}">
				<xsl:value-of disable-output-escaping="yes" select="/GSP/Spelling/Suggestion[1]"/>
			</a>
		</h3>
	</xsl:if>
</xsl:template>

<xsl:template name="synonyms">
	<xsl:if test="/GSP/Synonyms/OneSynonym">
		<h3 class="suggestion">You could also try:
			<xsl:call-template name="nbsp"/>
			<xsl:for-each select="/GSP/Synonyms/OneSynonym">
				<a ctype="synonym" href="search?q={@q}&amp;{$synonym_url}">
					<xsl:value-of disable-output-escaping="yes" select="."/>
				</a><xsl:text> </xsl:text>
			</xsl:for-each>
		</h3>
	</xsl:if>
</xsl:template>

<xsl:template name="truncate_url">
	<xsl:param name="t_url"/>
	<xsl:choose>
		<xsl:when test="string-length($t_url) &lt; $truncate_result_url_length">
			<xsl:value-of select="$t_url"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:variable name="first" select="substring-before($t_url, '/')"/>
			<xsl:variable name="last">
				<xsl:call-template name="truncate_find_last_token">
					<xsl:with-param name="t_url" select="$t_url"/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="path_limit" select="$truncate_result_url_length - (string-length($first) + string-length($last) + 1)"/>
			<xsl:choose>
				<xsl:when test="$path_limit &lt;= 0">
					<xsl:value-of select="concat(substring($t_url, 1, $truncate_result_url_length), '...')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="chopped_path">
						<xsl:call-template name="truncate_chop_path">
							<xsl:with-param name="path" select="substring($t_url, string-length($first) + 2, string-length($t_url) - (string-length($first) + string-length($last) + 1))"/>
							<xsl:with-param name="path_limit" select="$path_limit"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:value-of select="concat($first, '/.../', $chopped_path, $last)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="truncate_find_last_token">
	<xsl:param name="t_url"/>
	<xsl:choose>
		<xsl:when test="contains($t_url, '/')">
			<xsl:call-template name="truncate_find_last_token">
				<xsl:with-param name="t_url" select="substring-after($t_url, '/')"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$t_url"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="truncate_chop_path">
	<xsl:param name="path"/>
	<xsl:param name="path_limit"/>
	<xsl:choose>
		<xsl:when test="string-length($path) &lt;= $path_limit">
			<xsl:value-of select="$path"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="truncate_chop_path">
				<xsl:with-param name="path" select="substring-after($path, '/')"/>
				<xsl:with-param name="path_limit" select="$path_limit"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:variable name="sites_icon" select="'https://www.google.com/sites/images/sites_favicon.ico'"/>
<xsl:variable name="docs_icon" select="'https://docs.google.com/images/doclist/icon_doc.gif'"/>
<xsl:variable name="spreadsheets_icon" select="'https://docs.google.com/images/doclist/icon_spread.gif'"/>
<xsl:variable name="presentations_icon" select="'https://docs.google.com/images/doclist/icon_pres.gif'"/>
<xsl:variable name="pdf_icon" select="'https://docs.google.com/images/doclist/icon_6_pdf.gif'"/>
<xsl:variable name="drawing_icon" select="'https://docs.google.com/images/doclist/icon_6_drawing.png'"/>
<xsl:variable name="email_icon" select="'https://mail.google.com/mail/images/favicon.ico'"/>

<xsl:template match="R">
	<xsl:param name="query"/>
	<xsl:variable name="protocol"     select="substring-before(U, '://')"/>
	<xsl:variable name="temp_url"     select="substring-after(U, '://')"/>
	<xsl:variable name="display_url1" select="substring-after(UD, '://')"/>
	<xsl:variable name="escaped_url"  select="substring-after(UE, '://')"/>
	<xsl:variable name="display_url2">
		<xsl:choose>
			<xsl:when test="$display_url1">
				<xsl:value-of select="$display_url1"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$temp_url"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="display_url">
		<xsl:choose>
			<xsl:when test="$protocol='unc'">
				<xsl:call-template name="convert_unc">
					<xsl:with-param name="string" select="$display_url2"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$display_url2"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="stripped_url">
		<xsl:choose>
			<xsl:when test="$truncate_result_urls != '0'">
				<xsl:call-template name="truncate_url">
					<xsl:with-param name="t_url" select="$display_url"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$display_url"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="crowded_url" select="HN/@U"/>
	<xsl:variable name="crowded_display_url1" select="HN"/>
	<xsl:variable name="crowded_display_url">
		<xsl:choose>
			<xsl:when test="$protocol='unc'">
				<xsl:call-template name="convert_unc">
					<xsl:with-param name="string" select="substring-after($crowded_display_url1,'://')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$crowded_display_url1"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
	<xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
	<xsl:variable name="url_indexed" select="not(starts-with($temp_url, 'noindex!/'))"/>
	<xsl:if test="@L='2'">
		<xsl:text disable-output-escaping="yes">
			&lt;div class=&quot;indent&quot;&gt;
		</xsl:text>
	</xsl:if>
	<p class="g">
	<xsl:variable name="apps_domain">
		<xsl:if test="starts-with($stripped_url, 'sites.google.com/a/') or
				starts-with($stripped_url, 'docs.google.com/a/') or
				starts-with($stripped_url, 'spreadsheets.google.com/a/')">
			<xsl:value-of select="substring-before(substring-after($stripped_url, '/a/'), '/')"/>
		</xsl:if>
	</xsl:variable>
	<xsl:if test="starts-with($stripped_url, 'sites.google.com/')">
		<img src="{$sites_icon}" alt="" height="16" width="16"/><xsl:call-template name="nbsp"/>
	</xsl:if>
	<xsl:if test="starts-with($stripped_url, concat('docs.google.com/a/', $apps_domain, '/View?')) or RF[@NAME='type']/@VALUE='document'">
		<img src="{$docs_icon}" alt="" height="16" width="16"/><xsl:call-template name="nbsp"/>
	</xsl:if>
	<xsl:if test="starts-with($stripped_url, 'spreadsheets.google.com/') or RF[@NAME='type']/@VALUE='spreadsheet'">
		<img src="{$spreadsheets_icon}" alt="" height="16" width="16"/><xsl:call-template name="nbsp"/>
	</xsl:if>
	<xsl:if test="starts-with($stripped_url,
			concat('docs.google.com/a/', $apps_domain, '/SimplePresentationView?')) or
			starts-with($stripped_url,
			concat('docs.google.com/a/', $apps_domain, '/PresentationView?')) or
			RF[@NAME='type']/@VALUE='presentation'">
		<img src="{$presentations_icon}" alt="" height="16" width="16"/><xsl:call-template name="nbsp"/>
	</xsl:if>
	<xsl:if test="RF[@NAME='type']/@VALUE='pdf'">
		<img src="{$pdf_icon}" alt="" height="16" width="16"/><xsl:call-template name="nbsp"/>
	</xsl:if>
	<xsl:if test="RF[@NAME='type']/@VALUE='drawing'">
		<img src="{$drawing_icon}" alt="" height="16" width="16"/><xsl:call-template name="nbsp"/>
	</xsl:if>
	<xsl:if test="starts-with($stripped_url, 'mail.google.com') or RF[@NAME='type']/@VALUE='mail'">
		<img src="{$email_icon}" alt="" height="16" width="16"/>&#xA0;
	</xsl:if>
	<xsl:if test="$show_res_title != '0'">
		<font size="-1"><b>
    <xsl:choose>
      <xsl:when test="@MIME='text/html' or @MIME='' or not(@MIME)"></xsl:when>
      <xsl:when test="@MIME='text/plain'">[TEXT]</xsl:when>
      <xsl:when test="@MIME='application/rtf'">[RTF]</xsl:when>
      <xsl:when test="@MIME='application/pdf'">[PDF]</xsl:when>
      <xsl:when test="@MIME='application/postscript'">[PS]</xsl:when>
      <xsl:when test="@MIME='application/vnd.ms-powerpoint'">[MS POWERPOINT]</xsl:when>
      <xsl:when test="@MIME='application/vnd.ms-excel'">[MS EXCEL]</xsl:when>
      <xsl:when test="@MIME='application/msword'">[MS WORD]</xsl:when>
      <xsl:otherwise>
        <xsl:variable name="extension">
          <xsl:call-template name="last_substring_after">
            <xsl:with-param name="string" select="substring-after(
                                                  $temp_url,
                                                  '/')"/>
            <xsl:with-param name="separator" select="'.'"/>
            <xsl:with-param name="fallback" select="'UNKNOWN'"/>
          </xsl:call-template>
        </xsl:variable>
        [<xsl:value-of select="translate($extension,$lower,$upper)"/>]
      </xsl:otherwise>
    </xsl:choose>
    </b></font>
		<!-- <xsl:if test="@MIME='text/plain'
					or @MIME='application/rtf'
					or @MIME='application/pdf'
					or @MIME='application/vnd.ms-powerpoint'
					or @MIME='application/vnd.ms-excel'
					or @MIME='application/msword'
					or @MIME='application/zip'">
			<span class="resDocType">
				<xsl:choose>
					<xsl:when test="@MIME='text/plain'">
						<img title="Text File" alt="Text File" class="coricon">
							<xsl:attribute name="src">
								<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/images/icon-rtf.png</xsl:text>
							</xsl:attribute></img>
					</xsl:when>
					<xsl:when test="@MIME='application/rtf'">
						<img title="Text File" alt="Text File" class="coricon">
							<xsl:attribute name="src">
								<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/images/icon-rtf.png</xsl:text>
							</xsl:attribute></img>
					</xsl:when>
					<xsl:when test="@MIME='application/pdf'">
						<img title="Adobe Acrobat PDF Document" alt="Adobe Acrobat PDF Document" class="coricon">
							<xsl:attribute name="src">
								<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/images/icon-pdf.png</xsl:text>
							</xsl:attribute></img>
					</xsl:when>
					<xsl:when test="@MIME='application/vnd.ms-powerpoint'">
						<img title="Microsoft Powerpoint" alt="Microsoft Word Powerpoint" class="coricon">
							<xsl:attribute name="src">
								<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/images/icon-ppt.png</xsl:text>
							</xsl:attribute></img>
					</xsl:when>
					<xsl:when test="@MIME='application/vnd.ms-excel'">
						<img title="Microsoft Excel" alt="Microsoft Excel" class="coricon">
							<xsl:attribute name="src">
								<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/images/icon-xls.png</xsl:text>
							</xsl:attribute></img>
					</xsl:when>
					<xsl:when test="@MIME='application/msword'">
						<img title="Microsoft Word Document" alt="Microsoft Word Document" class="coricon">
							<xsl:attribute name="src">
								<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/images/icon-doc.png</xsl:text>
							</xsl:attribute></img>
					</xsl:when>
					<xsl:when test="@MIME='application/zip'">
						<img title="Zip Archive" alt="Zip Archive" class="coricon">
							<xsl:attribute name="src">
								<xsl:text>http://</xsl:text><xsl:value-of select="$cor_env"/><xsl:text>/content/static/images/icon-zip.png</xsl:text>
							</xsl:attribute></img>
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="extension">
							<xsl:call-template name="last_substring_after">
								<xsl:with-param name="string" select="substring-after($temp_url,'/')"/>
								<xsl:with-param name="separator" select="'.'"/>
								<xsl:with-param name="fallback" select="'UNKNOWN'"/>
							</xsl:call-template>
						</xsl:variable>
						[<xsl:value-of select="translate($extension,$lower,$upper)"/>]
					</xsl:otherwise>
				</xsl:choose>
			</span>
		</xsl:if> -->
		<xsl:text>
</xsl:text>
		<xsl:variable name="link" select="$url_indexed and not(starts-with(U, $googleconnector_protocol))"/>
		<xsl:if test="$link">
			<xsl:text disable-output-escaping='yes'>&lt;a ctype="c" </xsl:text>rank=&quot;<xsl:value-of
			select="position()"/>&quot;<xsl:text disable-output-escaping='yes'> href="</xsl:text>
			<xsl:choose>
				<xsl:when test="starts-with(U, $dbconnector_protocol)">
					<xsl:variable name="cache_encoding">
						<xsl:choose>
							<xsl:when test="'' != HAS/C/@ENC">
								<xsl:value-of select="HAS/C/@ENC"/>
							</xsl:when>
							<xsl:otherwise>UTF-8</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>search?q=cache:<xsl:value-of select="HAS/C/@CID"/>:<xsl:value-of
					select="$stripped_url"/>+<xsl:value-of select="$stripped_search_query"/>&amp;<xsl:value-of
					select="$base_url"/>&amp;oe=<xsl:value-of select="$cache_encoding"/>
				</xsl:when>
				<xsl:when test="starts-with(U, $db_url_protocol)">
					<xsl:value-of disable-output-escaping='yes' select="concat('db/', $temp_url)"/>
				</xsl:when>
				<xsl:when test="$protocol='nfs' or $protocol='smb'">
					<xsl:value-of disable-output-escaping='yes' select="concat($protocol,'/',$temp_url)"/>
				</xsl:when>
				<xsl:when test="$protocol='unc'">
					<xsl:value-of disable-output-escaping='yes' select="concat('file://', $display_url2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of disable-output-escaping='yes' select="U"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text disable-output-escaping='yes'>"&gt;</xsl:text>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="T">
				<xsl:call-template name="reformat_keyword">
					<xsl:with-param name="orig_string" select="replace(T, ' \| raleighnc.gov', '')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$stripped_url"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="$link">
			<xsl:text disable-output-escaping='yes'>&lt;/a&gt;</xsl:text>
		</xsl:if>
	</xsl:if>
	<div class="s">
		<xsl:if test="$only_apps != '1' or ($only_apps = '1' and $show_apps_segmented_ui != '1')">
			<xsl:choose>
				<xsl:when test="not($url_indexed)">
					<xsl:if test="($show_res_size!='0') or ($show_res_date!='0') or ($show_res_cache!='0')">
						<xsl:text>Not Indexed:</xsl:text>
						<xsl:value-of select="$stripped_url"/>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="$show_res_url != '0'">
						<span class="url"><xsl:value-of select="$stripped_url"/></span>
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="$url_indexed">
			<xsl:apply-templates select="HAS/C">
				<xsl:with-param name="stripped_url" select="$stripped_url"/>
				<xsl:with-param name="escaped_url" select="$escaped_url"/>
				<xsl:with-param name="query" select="$query"/>
				<xsl:with-param name="mime" select="@MIME"/>
				<xsl:with-param name="date" select="FS[@NAME='date']/@VALUE"/>
			</xsl:apply-templates>
		</xsl:if>
		<br/>
		<xsl:if test="$show_res_snippet != '0' and string-length(S) and $only_apps != '1'">
			<xsl:call-template name="reformat_keyword">
				<xsl:with-param name="orig_string" select="replace(S, '&lt;br&gt;', '')"/>
			</xsl:call-template>
		</xsl:if>
		<!-- *** Meta tags *** -->
		<xsl:if test="$show_meta_tags != '0' and $only_apps != '1'">
			<xsl:apply-templates select="MT"/>
		</xsl:if>
		<xsl:if test="HN">
			<div class="more_results">
			[<a href="search?as_sitesearch={$crowded_url}&amp;{$search_url}" ctype="sitesearch" class="f">More results from <xsl:value-of select="$crowded_display_url"/></a>]
			<xsl:if test="starts-with($crowded_url, $db_url_protocol)">
				[<a href="dbaggr?sitesearch={$crowded_url}&amp;{$search_url}&amp;filter=0" ctype="db" class="f">View all data</a>]
			</xsl:if>
			</div>
		</xsl:if>
	</div>
	</p>
	<xsl:if test="@L='2'">
		<xsl:text disable-output-escaping="yes">
			&lt;/div&gt;
		</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="MT">
	<br/>
	<span class="f"><xsl:value-of select="@N"/>: </span><xsl:value-of select="@V"/>
</xsl:template>

<xsl:template match="GM">
	<div id="keymatch">
		<h3><a href="{GL}" ctype="keymatch"><xsl:value-of select="GD"/></a></h3>
		<span class="url"><xsl:value-of select="GL"/></span>
	</div>
</xsl:template>

<xsl:variable name="keyword_orig_start" select="'&lt;b&gt;'"/>
<xsl:variable name="keyword_orig_end" select="'&lt;/b&gt;'"/>
<xsl:variable name="keyword_reformat_start">
	<xsl:if test="$res_keyword_format">
		<xsl:text>&lt;</xsl:text>
		<xsl:value-of select="$res_keyword_format"/>
		<xsl:text>&gt;</xsl:text>
	</xsl:if>
	<xsl:if test="($res_keyword_size) or ($res_keyword_color)">
		<xsl:text>&lt;span style="</xsl:text>
		<xsl:if test="$res_keyword_size">
			<xsl:text>font-size:</xsl:text><xsl:value-of select="$res_keyword_size"/><xsl:text>;</xsl:text>
		</xsl:if>
		<xsl:if test="$res_keyword_color">
			<xsl:text>color:</xsl:text><xsl:value-of select="$res_keyword_color"/><xsl:text>;</xsl:text>
		</xsl:if>
		<xsl:text>&gt;</xsl:text>
	</xsl:if>
</xsl:variable>
<xsl:variable name="keyword_reformat_end">
	<xsl:if test="($res_keyword_size) or ($res_keyword_color)">
		<xsl:text>&lt;/span&gt;</xsl:text>
	</xsl:if>
	<xsl:if test="$res_keyword_format">
		<xsl:text>&lt;/</xsl:text>
		<xsl:value-of select="$res_keyword_format"/>
		<xsl:text>&gt;</xsl:text>
	</xsl:if>
</xsl:variable>

<xsl:template name="reformat_keyword">
	<xsl:param name="orig_string"/>
	<xsl:variable name="reformatted_1">
		<xsl:call-template name="replace_string">
			<xsl:with-param name="find" select="$keyword_orig_start"/>
			<xsl:with-param name="replace" select="$keyword_reformat_start"/>
			<xsl:with-param name="string" select="$orig_string"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="reformatted_2">
		<xsl:call-template name="replace_string">
			<xsl:with-param name="find" select="$keyword_orig_end"/>
			<xsl:with-param name="replace" select="$keyword_reformat_end"/>
			<xsl:with-param name="string" select="$reformatted_1"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:value-of disable-output-escaping='yes' select="$reformatted_2"/>
</xsl:template>

<xsl:template match="C">
	<xsl:param name="stripped_url"/>
	<xsl:param name="escaped_url"/>
	<xsl:param name="query"/>
	<xsl:param name="mime"/>
	<xsl:param name="date"/>
	<xsl:variable name="docid"><xsl:value-of select="@CID"/></xsl:variable>
	<xsl:if test="$show_res_size != '0'">
		<xsl:if test="not(@SZ='')">
			<xsl:text> - </xsl:text>
			<xsl:value-of select="@SZ"/>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$show_res_date != '0'">
		<xsl:if test="($date != '')">
			<xsl:text> - </xsl:text>
			<xsl:value-of select="$date"/>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$show_res_cache != '0'">
		<xsl:text> - </xsl:text>
		<xsl:variable name="cache_encoding">
			<xsl:choose>
				<xsl:when test="'' != @ENC"><xsl:value-of select="@ENC"/></xsl:when>
				<xsl:otherwise>UTF-8</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<a ctype="cache" class="f" href="search?q=cache:{$docid}:{$escaped_url}+{$stripped_search_query}&amp;{$base_url}&amp;oe={$cache_encoding}">
			<xsl:choose>
				<xsl:when test="not($mime)">Cached</xsl:when>
				<xsl:when test="$mime='text/html'">Cached</xsl:when>
				<xsl:when test="$mime='text/plain'">Cached</xsl:when>
				<xsl:otherwise>Text Version</xsl:otherwise>
			</xsl:choose>
		</a>
	</xsl:if>
</xsl:template>

<xsl:template name="google_navigation">
	<xsl:param name="prev"/>
	<xsl:param name="next"/>
	<xsl:param name="view_begin"/>
	<xsl:param name="view_end"/>
	<xsl:param name="guess"/>
	<xsl:param name="navigation_style"/>
	<xsl:param name="dynamic_nav_bar"/>
	<xsl:variable name="navigation_style_to_use">
		<xsl:choose>
			<xsl:when test="$navigation_style = 'google' and $guess = ''">simple</xsl:when>
			<xsl:otherwise><xsl:value-of select="$navigation_style"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="fontclass">
		<xsl:choose>
			<xsl:when test="$navigation_style_to_use = 'top' and $dynamic_nav_bar = '1'">dn-bar-nav</xsl:when>
			<xsl:when test="$navigation_style_to_use = 'top'">s</xsl:when>
			<xsl:otherwise>b</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:if test="($prev) or ($next)">
		<table cellpadding="0" cellspacing="0">
			<tr valign="top">
				<xsl:choose>
					<xsl:when test="$prev">
						<td nowrap="1">
							<span class="{$fontclass}">
								<a ctype="nav.prev" href="search?{$search_url}&amp;start={$view_begin - $num_results - 1}">
									<span class="navstart"></span>
									<xsl:if test="$navigation_style_to_use = 'top'">
										<xsl:text>&lt;</xsl:text><xsl:call-template name="nbsp"/>
									</xsl:if>
									<xsl:text>Prev</xsl:text>
								</a>
							</span>
						</td>
					</xsl:when>
					<xsl:otherwise>
						<td nowrap="1">
							<span class="navstart"></span>
						</td>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="($navigation_style_to_use = 'google') or ($navigation_style_to_use = 'link')">
					<xsl:variable name="mod_end">
						<xsl:choose>
							<xsl:when test="$next"><xsl:value-of select="$guess"/></xsl:when>
							<xsl:otherwise><xsl:value-of select="$view_end"/></xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:call-template name="result_nav">
						<xsl:with-param name="start" select="0"/>
						<xsl:with-param name="end" select="$mod_end"/>
						<xsl:with-param name="current_view" select="($view_begin)-1"/>
						<xsl:with-param name="navigation_style" select="$navigation_style_to_use"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="$next">
						<td nowrap="1">
							<span class="{$fontclass}">
								<a ctype="nav.next" href="search?{$search_url}&amp;start={$view_begin + $num_results - 1}">
									<span class="navend"></span>
									<xsl:text>Next</xsl:text>
									<xsl:if test="$navigation_style_to_use = 'top'">
										<xsl:call-template name="nbsp"/><xsl:text>&gt;</xsl:text>
									</xsl:if>
								</a>
							</span>
						</td>
					</xsl:when>
					<xsl:otherwise>
						<td nowrap="1">
							<span class="navend"></span>
						</td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</table>
	</xsl:if>
</xsl:template>

<xsl:template name="result_nav">
	<xsl:param name="start" select="'0'"/>
	<xsl:param name="end"/>
	<xsl:param name="current_view"/>
	<xsl:param name="navigation_style"/>
	<xsl:choose>
		<xsl:when test="($start)&lt;(($current_view)-(10*($num_results)))">
		</xsl:when>
		<xsl:when test="(($current_view)&gt;=($start)) and (($current_view)&lt;(($start)+($num_results)))">
			<td>
				<xsl:if test="$navigation_style = 'google'">
					<span class="navcurrent"></span>
				</xsl:if>
				<xsl:if test="$navigation_style = 'link'">
					<xsl:call-template name="nbsp"/>
				</xsl:if>
				<span class="i"><xsl:value-of select="(($start)div($num_results))+1"/></span>
				<xsl:if test="$navigation_style = 'link'">
					<xsl:call-template name="nbsp"/>
				</xsl:if>
			</td>
		</xsl:when>
		<xsl:otherwise>
			<td>
				<xsl:if test="$navigation_style = 'link'">
					<xsl:call-template name="nbsp"/>
				</xsl:if>
				<a ctype="nav.page" href="search?{$search_url}&amp;start={$start}">
					<xsl:if test="$navigation_style = 'google'">
						<span class="navpage"></span>
					</xsl:if>
					<xsl:value-of select="(($start)div($num_results))+1"/>
				</a>
				<xsl:if test="$navigation_style = 'link'">
					<xsl:call-template name="nbsp"/>
				</xsl:if>
			</td>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:if test="((($start)+($num_results))&lt;($end)) and
				((($start)+($num_results))&lt;(($current_view)+
				(10*($num_results))))">
		<xsl:call-template name="result_nav">
			<xsl:with-param name="start" select="$start+$num_results"/>
			<xsl:with-param name="end" select="$end"/>
			<xsl:with-param name="current_view" select="$current_view"/>
			<xsl:with-param name="navigation_style" select="$navigation_style"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>

<xsl:template name="top_sep_bar">
	<xsl:param name="show_info"/>
	<xsl:param name="time"/>
	<xsl:if test="$show_info != 0 and count(/GSP/RES/R)>0">
		<div id="search_stats">
			<a id="SearchTools" class="right">Search Tools</a>
			<xsl:if test="count(/GSP/RES/R)>0 ">
				About <strong><xsl:value-of select="RES/M"/></strong> results
			</xsl:if>
			<span id="search_time"> (<xsl:value-of select="round($time * 100.0) div 100.0"/> seconds)</span><br />
		</div>
	</xsl:if>
</xsl:template>


<!--*********************************************************************
    Search box input form (Types: std_top, std_bottom, home, swr)
**********************************************************************-->
<xsl:template name="search_box">
	<xsl:param name="type"/>
	<xsl:text>
</xsl:text>
	<div id="SearchBox">
		<xsl:text disable-output-escaping="yes">&lt;form id="suggestion_form" name="gs" method="GET" action="search" onsubmit="return (this.q.value == '') ? false : true;"&gt;</xsl:text>
			<input type="text" name="q" value="{$space_normalized_query}" id="SearchInput" /><xsl:text>
			</xsl:text>
			<input type="submit" name="btnG" value="Search" class="action"/><xsl:text>
			</xsl:text>
			<xsl:call-template name="form_params"/>
		<xsl:text disable-output-escaping="yes">&lt;/form&gt;</xsl:text>
	</div>
</xsl:template>

<xsl:template name="analytics">
	<xsl:if test="string-length($analytics_account) != 0">
		<script type="text/javascript" src="{$analytics_script_url}"></script>
		<script type="text/javascript">var pageTracker = _gat._getTracker("<xsl:value-of select='$analytics_account'/>");pageTracker._trackPageview();</script>
	</xsl:if>
</xsl:template>

<xsl:template name="nbsp">
	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
</xsl:template>
<xsl:template name="nbsp3">
	<xsl:call-template name="nbsp"/>
	<xsl:call-template name="nbsp"/>
	<xsl:call-template name="nbsp"/>
</xsl:template>
<xsl:template name="nbsp4">
	<xsl:call-template name="nbsp3"/>
	<xsl:call-template name="nbsp"/>
</xsl:template>
<xsl:template name="quot">
	<xsl:text disable-output-escaping="yes">&amp;quot;</xsl:text>
</xsl:template>
<xsl:template name="rsaquo">
	<dfn> <xsl:text disable-output-escaping="yes">&amp;#8250;</xsl:text> </dfn>
</xsl:template>
<xsl:template name="endash">
	<xsl:text disable-output-escaping="yes">&amp;#8211;</xsl:text>
</xsl:template>
<xsl:template name="copy">
	<xsl:text disable-output-escaping="yes">&amp;copy;</xsl:text>
</xsl:template>

<!--***************************************
    Utility functions (do not customize)
****************************************-->
<xsl:template name="last_substring_after">
	<xsl:param name="string"/>
	<xsl:param name="separator"/>
	<xsl:param name="fallback"/>
	<xsl:variable name="newString" select="substring-after($string, $separator)"/>
	<xsl:choose>
		<xsl:when test="$newString!=''">
			<xsl:call-template name="last_substring_after">
				<xsl:with-param name="string" select="$newString"/>
				<xsl:with-param name="separator" select="$separator"/>
				<xsl:with-param name="fallback" select="$newString"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$fallback"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template name="replace_string">
	<xsl:param name="find"/>
	<xsl:param name="replace"/>
	<xsl:param name="string"/>
	<xsl:choose>
		<xsl:when test="contains($string, $find)">
			<xsl:value-of select="substring-before($string, $find)"/>
			<xsl:value-of select="$replace"/>
			<xsl:call-template name="replace_string">
				<xsl:with-param name="find" select="$find"/>
				<xsl:with-param name="replace" select="$replace"/>
				<xsl:with-param name="string" select="substring-after($string, $find)"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$string"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template name="decode_hex">
	<xsl:param name="encoded" />
	<xsl:variable name="hex" select="'0123456789ABCDEF'" />
	<xsl:variable name="ascii"> !"#$%&amp;'()*+,-./0123456789:;&lt;=&gt;?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~</xsl:variable>
	<xsl:choose>
		<xsl:when test="contains($encoded,'%')">
			<xsl:value-of select="substring-before($encoded,'%')" />
			<xsl:variable name="hexpair" select="translate(substring(substring-after($encoded,'%'),1,2),'abcdef','ABCDEF')" />
			<xsl:variable name="decimal" select="(string-length(substring-before($hex,substring($hexpair,1,1))))*16 + string-length(substring-before($hex,substring($hexpair,2,1)))" />
			<xsl:choose>
				<xsl:when test="$decimal &lt; 127 and $decimal &gt; 31">
					<xsl:value-of select="substring($ascii,$decimal - 31,1)" />
				</xsl:when>
				<xsl:when test="$decimal &gt; 159">
					<xsl:text disable-output-escaping="yes">%</xsl:text>
					<xsl:value-of select="$hexpair" />
				</xsl:when>
				<xsl:otherwise>?</xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="decode_hex">
				<xsl:with-param name="encoded" select="substring(substring-after($encoded,'%'),3)" />
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$encoded" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template name="convert_unc">
	<xsl:param name="string"/>
	<xsl:variable name="slash">/</xsl:variable>
	<xsl:variable name="backslash">\</xsl:variable>
	<xsl:variable name="escaped_ampersand">&amp;amp;</xsl:variable>
	<xsl:variable name="unescaped_ampersand">&amp;</xsl:variable>
	<xsl:variable name="converted_1">
		<xsl:call-template name="replace_string">
			<xsl:with-param name="find"    select="$slash"/>
			<xsl:with-param name="replace" select="$backslash"/>
			<xsl:with-param name="string"  select="$string"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="converted_2">
		<xsl:call-template name="decode_hex">
			<xsl:with-param name="encoded" select="$converted_1"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="converted_3">
		<xsl:call-template name="replace_string">
			<xsl:with-param name="find"    select="$escaped_ampersand"/>
			<xsl:with-param name="replace" select="$unescaped_ampersand"/>
			<xsl:with-param name="string"  select="$converted_2"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:value-of disable-output-escaping='yes' select="concat($backslash,$backslash,$converted_3)"/>
</xsl:template>
<!-- *** End of Utility Functions *** -->


<xsl:template name="error_page">
	<xsl:param name="errorMessage"/>
	<xsl:param name="errorDescription"/>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title><xsl:value-of select="$error_page_title"/></title>
	<meta name="robots" content="NOINDEX,NOFOLLOW"/>
	<link rel="shortcut icon" href="http://www.raleighnc.gov/cor-layout/content/static/styles/images/favicon.ico"/>
	<xsl:call-template name="style"/>
	<xsl:call-template name="analytics"/>
</head>
<body dir="ltr">
	<xsl:call-template name="personalization"/>
	<xsl:call-template name="my_page_header"/>
	<xsl:call-template name="top_sep_bar">
		<xsl:with-param name="show_info" select="0"/>
		<xsl:with-param name="time" select="0"/>
	</xsl:call-template>
	<p>Message: <xsl:value-of select="$errorMessage"/></p>
	<p>Description: <xsl:value-of select="$errorDescription"/></p>
	<p>Details: <xsl:copy-of select="/"/></p>
	<hr/>
	<xsl:call-template name="my_page_footer"/>
</body>
</html>
</xsl:template>

<xsl:template name="onebox">
	<xsl:for-each select="/GSP/ENTOBRESULTS">
		<xsl:apply-templates/>
	</xsl:for-each>
</xsl:template>

<xsl:template match="@*|node()"/>
</xsl:stylesheet>
<!-- *** END OF STYLESHEET *** -->
