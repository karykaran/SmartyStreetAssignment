@IsTest
public class SmartStreetWrapperTest {
	
	static testMethod void testParse() {
		String json = '['+
		'    {'+
		'        \"input_index\": 0,'+
		'        \"candidate_index\": 0,'+
		'        \"delivery_line_1\": \"3331 Erie Ave\",'+
		'        \"last_line\": \"Cincinnati OH 45208-1625\",'+
		'        \"delivery_point_barcode\": \"452081625313\",'+
		'        \"components\": {'+
		'            \"primary_number\": \"3331\",'+
		'            \"street_name\": \"Erie\",'+
		'            \"street_suffix\": \"Ave\",'+
		'            \"city_name\": \"Cincinnati\",'+
		'            \"default_city_name\": \"Cincinnati\",'+
		'            \"state_abbreviation\": \"OH\",'+
		'            \"zipcode\": \"45208\",'+
		'            \"plus4_code\": \"1625\",'+
		'            \"delivery_point\": \"31\",'+
		'            \"delivery_point_check_digit\": \"3\"'+
		'        },'+
		'        \"metadata\": {'+
		'            \"record_type\": \"S\",'+
		'            \"zip_type\": \"Standard\",'+
		'            \"county_fips\": \"39061\",'+
		'            \"county_name\": \"Hamilton\",'+
		'            \"carrier_route\": \"C025\",'+
		'            \"congressional_district\": \"02\",'+
		'            \"rdi\": \"Commercial\",'+
		'            \"elot_sequence\": \"0144\",'+
		'            \"elot_sort\": \"A\",'+
		'            \"latitude\": 39.141240,'+
		'            \"longitude\": -84.422690,'+
		'            \"precision\": \"Zip9\",'+
		'            \"time_zone\": \"Eastern\",'+
		'            \"utc_offset\": -5,'+
		'            \"dst\": true'+
		'        },'+
		'        \"analysis\": {'+
		'            \"dpv_match_code\": \"Y\",'+
		'            \"dpv_footnotes\": \"AABB\",'+
		'            \"dpv_cmra\": \"N\",'+
		'            \"dpv_vacant\": \"N\",'+
		'            \"dpv_no_stat\": \"N\",'+
		'            \"active\": \"Y\"'+
		'        }'+
		'    }'+
		']';
		List<SmartStreetWrapper> obj = SmartStreetWrapper.parse(json);
		System.assert(obj != null);
	}
}