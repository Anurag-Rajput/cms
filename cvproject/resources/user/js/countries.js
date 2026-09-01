
var Organization_arr = new Array("NATIONAL COOP. DAIRY FEDERATION OF INDIA", "DEPTT. OF ANIMAL HUSBANDRY AND", "COCONUT DEVELOPMENT BOARD", "NATIONAL DAIRY DEVELOPMENT BOARD", "NATIONAL SEEDS CORPORATION LTD.", "URANIUM CORPN. OF INDIA LTD", "INSTT. OF MATHEMATICAL SCIENCES (IMS)", "INSTITUTE OF PHYSICS", "HARISH CHANDRA RESEARCH INSTITUTE", "NATIONAL BOARD FOR HIGHER MATHEMATICS", "INDUSTRIAL INVESTMENT BANK OF INDIA LTD.", "STATE BANK OF INDORE", "STATE BANK OF MYSORE", "STATE BANK OF BIKANER & JAIPUR", "STATE BANK OF HYDERABAD", "RAIL TEL CORPORATION OF INDIA LIMITED", "IRCON INTERNATIONAL LTD.", "INDIAN RAILWAY FINANCE CORPN. LTD.", "RAIL INDIA TECHNICAL & ECONOMIC SERVICES", "MINISTRY OF RAILWAY", "KOLKATA PORT TRUST", "KANDLA PORT TRUST", "CHENNAI PORT TRUST", "NEW MANGALORE PORT TRUST.", "SHIPPING CORPORATION OF INDIA LTD.");

// Section
var s_a = new Array();
s_a[0]="";
s_a[1]="vigilance-7";
s_a[2]="vigilance-7";
s_a[3]="vigilance-7";
s_a[4]="vigilance-7";
s_a[5]="vigilance-7";
s_a[6]="vigilance-6";
s_a[7]="vigilance-6";
s_a[8]="vigilance-6";
s_a[9]="vigilance-6";
s_a[11]="vigilance-6";
s_a[12]="vigilance-3";
s_a[13]="vigilance-3";
s_a[14]="vigilance-3";
s_a[15]="vigilance-3";
s_a[16]="vigilance-3";
s_a[17]="vigilance-1";
s_a[18]="vigilance-1";
s_a[19]="vigilance-1";
s_a[20]="vigilance-1";
s_a[21]="vigilance-1";
s_a[22]="vigilance-2";
s_a[23]="vigilance-2";
s_a[24]="vigilance-2";
s_a[25]="vigilance-2";
s_a[26]="vigilance-2";



function populateSection( OrganizationElementId, SectionElementId ){
	
	var selectedOrganizationIndex = document.getElementById( OrganizationElementId ).selectedIndex;

	var SectionElement = document.getElementById( SectionElementId );
	
	SectionElement.length=0;	// Fixed by Julian Woods
	SectionElement.options[0] = new Option('','');
	SectionElement.selectedIndex = 0;
	
	var Section_arr = s_a[selectedOrganizationIndex].split("|");
	
	for (var i=0; i<Section_arr.length; i++) {
		SectionElement.options[SectionElement.length] = new Option(Section_arr[i],Section_arr[i]);
	}
}

function populateCountries(OrganizationElementId, SectionElementId){
	// given the id of the <select> tag as function argument, it inserts <option> tags
	var OrganizationElement = document.getElementById(OrganizationElementId);
	OrganizationElement.length=0;
	OrganizationElement.options[0] = new Option('Select Organization','-1');
	OrganizationElement.selectedIndex = 0;
	for (var i=0; i<Organization_arr.length; i++) {
		OrganizationElement.options[OrganizationElement.length] = new Option(Organization_arr[i],Organization_arr[i]);
	}

	// Assigned all countries. Now assign event listener for the states.

	if( SectionElementId ){
		OrganizationElement.onchange = function(){
			populateSection( OrganizationElementId, SectionElementId );
		};
	}
}