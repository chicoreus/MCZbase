<script language="javascript" type="text/javascript">
function closeThis(){
	document.location=location.href;
	var theDiv = document.getElementById('customDiv');
	document.body.removeChild(theDiv);
}
</script>
<cfoutput>
<cfquery name="OtherIdType" datasource="user_login" username="#session.dbuser#" password="#decrypt(session.epw,cookie.cfid)#" cachedwithin="#createtimespan(0,0,60,0)#">
	select distinct(other_id_type) FROM CTCOLL_OTHER_ID_TYPE ORDER BY other_Id_Type
</cfquery>
<cfquery name="collid" datasource="uam_god" cachedwithin="#createtimespan(0,0,60,0)#">
	select cf_collection_id,collection from cf_collection
	order by collection
</cfquery>
<table class="ssrch">
	<tr>
		<td colspan="2" class="secHead">
				<span class="secLabel">Customize Identifiers</span>
				<span class="secControl" id="c_collevent"
					onclick="closeThis();">Close</span>
		</td>
	</tr>
	<tr>
		<td class="lbl">
			My Other Identifier:
		</td>
		<td class="srch">
			<select name="customOtherIdentifier" id="customOtherIdentifier"
				size="1" onchange="this.className='red';changecustomOtherIdentifier(this.value);">
				<option value="">None</option>
				<cfloop query="OtherIdType">
					<option 
						<cfif session.CustomOtherIdentifier is other_id_type>selected="selected"</cfif>
						value="#other_id_type#">#other_id_type#</option>
				</cfloop> 
			</select>
		</td>
	</tr>
	<tr>
		<td class="lbl">
			Show 3-part ID Search:
		</td>
		<td class="srch">
			<select name="fancyCOID" id="fancyCOID"
				size="1" onchange="this.className='red';changefancyCOID(this.value);">
				<option <cfif #session.fancyCOID# is not 1>selected="selected"</cfif> value="">No</option>
				<option <cfif #session.fancyCOID# is 1>selected="selected"</cfif> value="1">Yes</option>
			</select>
		</td>
	</tr>
	</cfif>
</table>
</cfoutput>
