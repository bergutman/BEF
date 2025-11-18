-- Sample data to get started

-- Insert locations
INSERT INTO locations (name) VALUES
('New York City'),
('Los Angeles'),
('Chicago'),
('Philadelphia'),
('Dallas'),
('San Francisco'),
('Washington'),
('Houston'),
('Boston'),
('Atlanta'),
('Phoenix'),
('Tampa Bay'),
('Seattle'),
('Detroit'),
('Minneapolis'),
('Miami'),
('Denver'),
('Orlando'),
('Cleveland'),
('Sacramento'),
('Charlotte'),
('Portland'),
('St. Louis'),
('Pittsburgh'),
('Indianapolis'),
('Baltimore'),
('Raleigh'),
('Nashville'),
('San Diego'),
('Salt Lake City'),
('San Antonio'),
('Kansas City'),
('Hartford'),
('Columbus'),
('Milwaukee'),
('West Palm Beach'),
('Cincinnati'),
('Greenville'),
('Las Vegas'),
('Austin'),
('Jacksonville'),
('Norfolk'),
('Oklahoma City'),
('Birmingham'),
('Grand Rapids'),
('Albuquerque'),
('Harrisburg'),
('Louisville'),
('Greensboro'),
('New Orleans'),
('Memphis'),
('Buffalo'),
('Ft. Myers'),
('Richmond'),
('Fresno'),
('Providence'),
('Mobile'),
('Tulsa'),
('Albany'),
('Wilkes Barre - Scranton'),
('Knoxville'),
('Little Rock'),
('Dayton'),
('Lexington'),
('Tucson'),
('Honolulu'),
('Green Bay'),
('Des Moines'),
('Roanoke'),
('Spokane'),
('Omaha'),
('Wichita'),
('Springfield'),
('Charleston'),
('Columbia'),
('Rochester'),
('Flint'),
('Huntsville'),
('Portland'),
('Toledo'),
('Madison'),
('Waco'),
('Harlingen'),
('Paducah'),
('Colorado Springs'),
('Shreveport'),
('Syracuse'),
('Champaign'),
('Savannah'),
('Cedar Rapids'),
('Charleston'),
('Chattanooga'),
('El Paso'),
('Jackson'),
('Myrtle Beach'),
('Baton Rouge'),
('Ft. Smith'),
('Burlington'),
('South Bend'),
('Greenville - New Bern'),
('San Juan');

-- Insert stations using temporary variables approach
-- This avoids subquery issues by doing inserts in batches by location

DO $$
DECLARE
    ny_id INTEGER;
    la_id INTEGER;
    chicago_id INTEGER;
    philly_id INTEGER;
    dallas_id INTEGER;
    sf_id INTEGER;
    washington_id INTEGER;
    houston_id INTEGER;
    boston_id INTEGER;
    atlanta_id INTEGER;
    phoenix_id INTEGER;
    tampa_id INTEGER;
    seattle_id INTEGER;
    detroit_id INTEGER;
    minneapolis_id INTEGER;
    miami_id INTEGER;
    denver_id INTEGER;
    orlando_id INTEGER;
    cleveland_id INTEGER;
    sacramento_id INTEGER;
    charlotte_id INTEGER;
    portland_id INTEGER;
    stlouis_id INTEGER;
    pittsburgh_id INTEGER;
    indianapolis_id INTEGER;
    baltimore_id INTEGER;
    raleigh_id INTEGER;
    nashville_id INTEGER;
    sandiego_id INTEGER;
    saltlake_id INTEGER;
    sanantonio_id INTEGER;
    kansascity_id INTEGER;
    hartford_id INTEGER;
    columbus_id INTEGER;
    milwaukee_id INTEGER;
    westpalm_id INTEGER;
    cincinnati_id INTEGER;
    greenville_id INTEGER;
    vegas_id INTEGER;
    austin_id INTEGER;
    jacksonville_id INTEGER;
    norfolk_id INTEGER;
    okcity_id INTEGER;
    birmingham_id INTEGER;
    grandrapids_id INTEGER;
    albuquerque_id INTEGER;
    harrisburg_id INTEGER;
    louisville_id INTEGER;
    greensboro_id INTEGER;
    neworleans_id INTEGER;
    memphis_id INTEGER;
    buffalo_id INTEGER;
    ftmyers_id INTEGER;
    richmond_id INTEGER;
    fresno_id INTEGER;
    providence_id INTEGER;
    mobile_id INTEGER;
    tulsa_id INTEGER;
    albany_id INTEGER;
    wilkesbarre_id INTEGER;
    knoxville_id INTEGER;
    littlerock_id INTEGER;
    dayton_id INTEGER;
    lexington_id INTEGER;
    tucson_id INTEGER;
    honolulu_id INTEGER;
    greenbay_id INTEGER;
    desmoines_id INTEGER;
    roanoke_id INTEGER;
    spokane_id INTEGER;
    omaha_id INTEGER;
    wichita_id INTEGER;
    springfield_id INTEGER;
    charleston_sc_id INTEGER;
    columbia_sc_id INTEGER;
    rochester_id INTEGER;
    flint_id INTEGER;
    huntsville_id INTEGER;
    portland_me_id INTEGER;
    toledo_id INTEGER;
    madison_id INTEGER;
    waco_id INTEGER;
    harlingen_id INTEGER;
    paducah_id INTEGER;
    coloradosprings_id INTEGER;
    shreveport_id INTEGER;
    syracuse_id INTEGER;
    champaign_id INTEGER;
    savannah_id INTEGER;
    cedarrapids_id INTEGER;
    charleston_wv_id INTEGER;
    chattanooga_id INTEGER;
    elpaso_id INTEGER;
    jackson_id INTEGER;
    myrtlebeach_id INTEGER;
    batonrouge_id INTEGER;
    ftsmith_id INTEGER;
    burlington_id INTEGER;
    southbend_id INTEGER;
    greenvillenc_id INTEGER;
    sanjuan_id INTEGER;
BEGIN
    -- Get location IDs
    SELECT id INTO ny_id FROM locations WHERE name = 'New York City' LIMIT 1;
    SELECT id INTO la_id FROM locations WHERE name = 'Los Angeles' LIMIT 1;
    SELECT id INTO chicago_id FROM locations WHERE name = 'Chicago' LIMIT 1;
    SELECT id INTO philly_id FROM locations WHERE name = 'Philadelphia' LIMIT 1;
    SELECT id INTO dallas_id FROM locations WHERE name = 'Dallas' LIMIT 1;
    SELECT id INTO sf_id FROM locations WHERE name = 'San Francisco' LIMIT 1;
    SELECT id INTO washington_id FROM locations WHERE name = 'Washington' LIMIT 1;
    SELECT id INTO houston_id FROM locations WHERE name = 'Houston' LIMIT 1;
    SELECT id INTO boston_id FROM locations WHERE name = 'Boston' LIMIT 1;
    SELECT id INTO atlanta_id FROM locations WHERE name = 'Atlanta' LIMIT 1;
    SELECT id INTO phoenix_id FROM locations WHERE name = 'Phoenix' LIMIT 1;
    SELECT id INTO tampa_id FROM locations WHERE name = 'Tampa Bay' LIMIT 1;
    SELECT id INTO seattle_id FROM locations WHERE name = 'Seattle' LIMIT 1;
    SELECT id INTO detroit_id FROM locations WHERE name = 'Detroit' LIMIT 1;
    SELECT id INTO minneapolis_id FROM locations WHERE name = 'Minneapolis' LIMIT 1;
    SELECT id INTO miami_id FROM locations WHERE name = 'Miami' LIMIT 1;
    SELECT id INTO denver_id FROM locations WHERE name = 'Denver' LIMIT 1;
    SELECT id INTO orlando_id FROM locations WHERE name = 'Orlando' LIMIT 1;
    SELECT id INTO cleveland_id FROM locations WHERE name = 'Cleveland' LIMIT 1;
    SELECT id INTO sacramento_id FROM locations WHERE name = 'Sacramento' LIMIT 1;
    SELECT id INTO charlotte_id FROM locations WHERE name = 'Charlotte' LIMIT 1;
    SELECT id INTO portland_id FROM locations WHERE name = 'Portland' LIMIT 1;
    SELECT id INTO stlouis_id FROM locations WHERE name = 'St. Louis' LIMIT 1;
    SELECT id INTO pittsburgh_id FROM locations WHERE name = 'Pittsburgh' LIMIT 1;
    SELECT id INTO indianapolis_id FROM locations WHERE name = 'Indianapolis' LIMIT 1;
    SELECT id INTO baltimore_id FROM locations WHERE name = 'Baltimore' LIMIT 1;
    SELECT id INTO raleigh_id FROM locations WHERE name = 'Raleigh' LIMIT 1;
    SELECT id INTO nashville_id FROM locations WHERE name = 'Nashville' LIMIT 1;
    SELECT id INTO sandiego_id FROM locations WHERE name = 'San Diego' LIMIT 1;
    SELECT id INTO saltlake_id FROM locations WHERE name = 'Salt Lake City' LIMIT 1;
    SELECT id INTO sanantonio_id FROM locations WHERE name = 'San Antonio' LIMIT 1;
    SELECT id INTO kansascity_id FROM locations WHERE name = 'Kansas City' LIMIT 1;
    SELECT id INTO hartford_id FROM locations WHERE name = 'Hartford' LIMIT 1;
    SELECT id INTO columbus_id FROM locations WHERE name = 'Columbus' LIMIT 1;
    SELECT id INTO milwaukee_id FROM locations WHERE name = 'Milwaukee' LIMIT 1;
    SELECT id INTO westpalm_id FROM locations WHERE name = 'West Palm Beach' LIMIT 1;
    SELECT id INTO cincinnati_id FROM locations WHERE name = 'Cincinnati' LIMIT 1;
    SELECT id INTO greenville_id FROM locations WHERE name = 'Greenville' LIMIT 1;
    SELECT id INTO vegas_id FROM locations WHERE name = 'Las Vegas' LIMIT 1;
    SELECT id INTO austin_id FROM locations WHERE name = 'Austin' LIMIT 1;
    SELECT id INTO jacksonville_id FROM locations WHERE name = 'Jacksonville' LIMIT 1;
    SELECT id INTO norfolk_id FROM locations WHERE name = 'Norfolk' LIMIT 1;
    SELECT id INTO okcity_id FROM locations WHERE name = 'Oklahoma City' LIMIT 1;
    SELECT id INTO birmingham_id FROM locations WHERE name = 'Birmingham' LIMIT 1;
    SELECT id INTO grandrapids_id FROM locations WHERE name = 'Grand Rapids' LIMIT 1;
    SELECT id INTO albuquerque_id FROM locations WHERE name = 'Albuquerque' LIMIT 1;
    SELECT id INTO harrisburg_id FROM locations WHERE name = 'Harrisburg' LIMIT 1;
    SELECT id INTO louisville_id FROM locations WHERE name = 'Louisville' LIMIT 1;
    SELECT id INTO greensboro_id FROM locations WHERE name = 'Greensboro' LIMIT 1;
    SELECT id INTO neworleans_id FROM locations WHERE name = 'New Orleans' LIMIT 1;
    SELECT id INTO memphis_id FROM locations WHERE name = 'Memphis' LIMIT 1;
    SELECT id INTO buffalo_id FROM locations WHERE name = 'Buffalo' LIMIT 1;
    SELECT id INTO ftmyers_id FROM locations WHERE name = 'Ft. Myers' LIMIT 1;
    SELECT id INTO richmond_id FROM locations WHERE name = 'Richmond' LIMIT 1;
    SELECT id INTO fresno_id FROM locations WHERE name = 'Fresno' LIMIT 1;
    SELECT id INTO providence_id FROM locations WHERE name = 'Providence' LIMIT 1;
    SELECT id INTO mobile_id FROM locations WHERE name = 'Mobile' LIMIT 1;
    SELECT id INTO tulsa_id FROM locations WHERE name = 'Tulsa' LIMIT 1;
    SELECT id INTO albany_id FROM locations WHERE name = 'Albany' LIMIT 1;
    SELECT id INTO wilkesbarre_id FROM locations WHERE name = 'Wilkes Barre - Scranton' LIMIT 1;
    SELECT id INTO knoxville_id FROM locations WHERE name = 'Knoxville' LIMIT 1;
    SELECT id INTO littlerock_id FROM locations WHERE name = 'Little Rock' LIMIT 1;
    SELECT id INTO dayton_id FROM locations WHERE name = 'Dayton' LIMIT 1;
    SELECT id INTO lexington_id FROM locations WHERE name = 'Lexington' LIMIT 1;
    SELECT id INTO tucson_id FROM locations WHERE name = 'Tucson' LIMIT 1;
    SELECT id INTO honolulu_id FROM locations WHERE name = 'Honolulu' LIMIT 1;
    SELECT id INTO greenbay_id FROM locations WHERE name = 'Green Bay' LIMIT 1;
    SELECT id INTO desmoines_id FROM locations WHERE name = 'Des Moines' LIMIT 1;
    SELECT id INTO roanoke_id FROM locations WHERE name = 'Roanoke' LIMIT 1;
    SELECT id INTO spokane_id FROM locations WHERE name = 'Spokane' LIMIT 1;
    SELECT id INTO omaha_id FROM locations WHERE name = 'Omaha' LIMIT 1;
    SELECT id INTO wichita_id FROM locations WHERE name = 'Wichita' LIMIT 1;
    SELECT id INTO springfield_id FROM locations WHERE name = 'Springfield' LIMIT 1;
    SELECT id INTO charleston_sc_id FROM locations WHERE name = 'Charleston' LIMIT 1;
    SELECT id INTO columbia_sc_id FROM locations WHERE name = 'Columbia' LIMIT 1;
    SELECT id INTO rochester_id FROM locations WHERE name = 'Rochester' LIMIT 1;
    SELECT id INTO flint_id FROM locations WHERE name = 'Flint' LIMIT 1;
    SELECT id INTO huntsville_id FROM locations WHERE name = 'Huntsville' LIMIT 1;
    SELECT id INTO portland_me_id FROM locations WHERE name = 'Portland' LIMIT 1;
    SELECT id INTO toledo_id FROM locations WHERE name = 'Toledo' LIMIT 1;
    SELECT id INTO madison_id FROM locations WHERE name = 'Madison' LIMIT 1;
    SELECT id INTO waco_id FROM locations WHERE name = 'Waco' LIMIT 1;
    SELECT id INTO harlingen_id FROM locations WHERE name = 'Harlingen' LIMIT 1;
    SELECT id INTO paducah_id FROM locations WHERE name = 'Paducah' LIMIT 1;
    SELECT id INTO coloradosprings_id FROM locations WHERE name = 'Colorado Springs' LIMIT 1;
    SELECT id INTO shreveport_id FROM locations WHERE name = 'Shreveport' LIMIT 1;
    SELECT id INTO syracuse_id FROM locations WHERE name = 'Syracuse' LIMIT 1;
    SELECT id INTO champaign_id FROM locations WHERE name = 'Champaign' LIMIT 1;
    SELECT id INTO savannah_id FROM locations WHERE name = 'Savannah' LIMIT 1;
    SELECT id INTO cedarrapids_id FROM locations WHERE name = 'Cedar Rapids' LIMIT 1;
    SELECT id INTO charleston_wv_id FROM locations WHERE name = 'Charleston' LIMIT 1;
    SELECT id INTO chattanooga_id FROM locations WHERE name = 'Chattanooga' LIMIT 1;
    SELECT id INTO elpaso_id FROM locations WHERE name = 'El Paso' LIMIT 1;
    SELECT id INTO jackson_id FROM locations WHERE name = 'Jackson' LIMIT 1;
    SELECT id INTO myrtlebeach_id FROM locations WHERE name = 'Myrtle Beach' LIMIT 1;
    SELECT id INTO batonrouge_id FROM locations WHERE name = 'Baton Rouge' LIMIT 1;
    SELECT id INTO ftsmith_id FROM locations WHERE name = 'Ft. Smith' LIMIT 1;
    SELECT id INTO burlington_id FROM locations WHERE name = 'Burlington' LIMIT 1;
    SELECT id INTO southbend_id FROM locations WHERE name = 'South Bend' LIMIT 1;
    SELECT id INTO greenvillenc_id FROM locations WHERE name = 'Greenville - New Bern' LIMIT 1;
    SELECT id INTO sanjuan_id FROM locations WHERE name = 'San Juan' LIMIT 1;

    -- Insert stations for New York City
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (ny_id, 'WNJU', 'WNJU', NULL, 'spanish'),
    (ny_id, 'WXTV', 'WXTV', NULL, 'spanish'),
    (ny_id, 'WNBC', 'WNBC', NULL, 'english'),
    (ny_id, 'WABC', 'WABC', NULL, 'english');

    -- Insert stations for Los Angeles
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (la_id, 'KMEX', 'KMEX', NULL, 'spanish'),
    (la_id, 'KVEA', 'KVEA', NULL, 'spanish'),
    (la_id, 'KCBS', 'KCBS', NULL, 'english'),
    (la_id, 'KNBC', 'KNBC', NULL, 'english');

    -- Insert stations for Chicago
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (chicago_id, 'WGBO', 'WGBO', NULL, 'spanish'),
    (chicago_id, 'WSNS', 'WSNS', NULL, 'spanish'),
    (chicago_id, 'WMAQ', 'WMAQ', NULL, 'english'),
    (chicago_id, 'WLS', 'WLS', NULL, 'english');

    -- Insert stations for Philadelphia
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (philly_id, 'WUVP', 'WUVP', NULL, 'spanish'),
    (philly_id, 'WWSI', 'WWSI', NULL, 'spanish'),
    (philly_id, 'KYW', 'KYW', NULL, 'english'),
    (philly_id, 'WPVI', 'WPVI', NULL, 'english');

    -- Insert stations for Dallas
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (dallas_id, 'KUVN', 'KUVN', NULL, 'spanish'),
    (dallas_id, 'KXTX', 'KXTX', NULL, 'spanish'),
    (dallas_id, 'WFAA', 'WFAA', NULL, 'english'),
    (dallas_id, 'KXAS', 'KXAS', NULL, 'english');

    -- Insert stations for San Francisco (multiple regions)
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (sf_id, 'KDTV', 'KDTV', 'bay', 'spanish'),
    (sf_id, 'KDTV', 'KDTV', 'peninsula', 'spanish'),
    (sf_id, 'KDTV', 'KDTV', 'inland', 'spanish'),
    (sf_id, 'KSTS', 'KSTS', 'bay', 'spanish'),
    (sf_id, 'KSTS', 'KSTS', 'peninsula', 'spanish'),
    (sf_id, 'KSTS', 'KSTS', 'inland', 'spanish'),
    (sf_id, 'KPIX', 'KPIX', 'bay', 'english'),
    (sf_id, 'KRON', 'KRON', 'bay', 'english');

    -- Insert stations for Washington
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (washington_id, 'WFDC', 'WFDC', NULL, 'spanish'),
    (washington_id, 'WZDC', 'WZDC', NULL, 'spanish'),
    (washington_id, 'WUSA', 'WUSA', NULL, 'english'),
    (washington_id, 'WRC', 'WRC', NULL, 'english');

    -- Insert stations for Houston
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (houston_id, 'KTMD', 'KTMD', NULL, 'spanish'),
    (houston_id, 'KXLN', 'KXLN', NULL, 'spanish'),
    (houston_id, 'KPRC', 'KPRC', NULL, 'english'),
    (houston_id, 'KHOU', 'KHOU', NULL, 'english');

    -- Insert stations for Boston
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (boston_id, 'WNEU', 'WNEU', NULL, 'spanish'),
    (boston_id, 'WUNI', 'WUNI', NULL, 'spanish'),
    (boston_id, 'WBZ', 'WBZ', NULL, 'english'),
    (boston_id, 'WCVB', 'WCVB', NULL, 'english');

    -- Insert stations for Atlanta
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (atlanta_id, 'WKTB', 'WKTB', NULL, 'spanish'),
    (atlanta_id, 'WUVG', 'WUVG', NULL, 'spanish'),
    (atlanta_id, 'WSB', 'WSB', NULL, 'english'),
    (atlanta_id, 'WXIA', 'WXIA', NULL, 'english');

    -- Insert stations for Phoenix
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (phoenix_id, 'KTAZ', 'KTAZ', NULL, 'spanish'),
    (phoenix_id, 'KTVW', 'KTVW', NULL, 'spanish'),
    (phoenix_id, 'KPHO', 'KPHO', NULL, 'english'),
    (phoenix_id, 'KSAZ', 'KSAZ', NULL, 'english');

    -- Insert stations for Tampa Bay
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (tampa_id, 'WRMD', 'WRMD', NULL, 'spanish'),
    (tampa_id, 'WVEA', 'WVEA', NULL, 'spanish'),
    (tampa_id, 'WTSP', 'WTSP', NULL, 'english'),
    (tampa_id, 'WFLA', 'WFLA', NULL, 'english');

    -- Insert stations for Seattle
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (seattle_id, 'KUNS', 'KUNS', NULL, 'spanish'),
    (seattle_id, 'KOMO', 'KOMO', NULL, 'english'),
    (seattle_id, 'KING', 'KING', NULL, 'english');

    -- Insert stations for Detroit
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (detroit_id, 'WADL', 'WADL', NULL, 'spanish'),
    (detroit_id, 'WDIV', 'WDIV', NULL, 'english'),
    (detroit_id, 'WXYZ', 'WXYZ', NULL, 'english');

    -- Insert stations for Minneapolis
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (minneapolis_id, 'WFTC', 'WFTC', NULL, 'spanish'),
    (minneapolis_id, 'KSTP', 'KSTP', NULL, 'english'),
    (minneapolis_id, 'WCCO', 'WCCO', NULL, 'english');

    -- Insert stations for Miami
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (miami_id, 'WLTV', 'WLTV', NULL, 'spanish'),
    (miami_id, 'WSCV', 'WSCV', NULL, 'spanish'),
    (miami_id, 'WTVJ', 'WTVJ', NULL, 'english'),
    (miami_id, 'WPLG', 'WPLG', NULL, 'english');

    -- Insert stations for Denver
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (denver_id, 'KCEC', 'KCEC', NULL, 'spanish'),
    (denver_id, 'KDEN', 'KDEN', NULL, 'spanish'),
    (denver_id, 'KUSA', 'KUSA', NULL, 'english'),
    (denver_id, 'KCNC', 'KCNC', NULL, 'english');

    -- Insert stations for Orlando
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (orlando_id, 'WTMO', 'WTMO', NULL, 'spanish'),
    (orlando_id, 'WVEN', 'WVEN', NULL, 'spanish'),
    (orlando_id, 'WKMG', 'WKMG', NULL, 'english'),
    (orlando_id, 'WESH', 'WESH', NULL, 'english');

    -- Insert stations for Cleveland
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (cleveland_id, 'WQHS', 'WQHS', NULL, 'spanish'),
    (cleveland_id, 'WEWS', 'WEWS', NULL, 'english'),
    (cleveland_id, 'WKYC', 'WKYC', NULL, 'english');

    -- Insert stations for Sacramento
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (sacramento_id, 'KCSO', 'KCSO', NULL, 'spanish'),
    (sacramento_id, 'KUVS', 'KUVS', NULL, 'spanish'),
    (sacramento_id, 'KCRA', 'KCRA', NULL, 'english'),
    (sacramento_id, 'KOVR', 'KOVR', NULL, 'english');

    -- Insert stations for Charlotte
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (charlotte_id, 'WUVC-DT3', 'WUVC-DT3', NULL, 'spanish'),
    (charlotte_id, 'WSOC', 'WSOC', NULL, 'english'),
    (charlotte_id, 'WBTV', 'WBTV', NULL, 'english');

    -- Insert stations for Portland
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (portland_id, 'KUNP', 'KUNP', NULL, 'spanish'),
    (portland_id, 'KGW', 'KGW', NULL, 'english'),
    (portland_id, 'KATU', 'KATU', NULL, 'english');

    -- Insert stations for St. Louis
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (stlouis_id, 'WQAD', 'WQAD', NULL, 'spanish'),
    (stlouis_id, 'KSDK', 'KSDK', NULL, 'english'),
    (stlouis_id, 'KMOV', 'KMOV', NULL, 'english');

    -- Insert stations for Pittsburgh
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (pittsburgh_id, 'WPMY', 'WPMY', NULL, 'spanish'),
    (pittsburgh_id, 'KDKA', 'KDKA', NULL, 'english'),
    (pittsburgh_id, 'WTAE', 'WTAE', NULL, 'english');

    -- Insert stations for Indianapolis
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (indianapolis_id, 'WDTI', 'WDTI', NULL, 'spanish'),
    (indianapolis_id, 'WRTV', 'WRTV', NULL, 'english'),
    (indianapolis_id, 'WTHR', 'WTHR', NULL, 'english');

    -- Insert stations for Baltimore
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (baltimore_id, 'WMAR', 'WMAR', NULL, 'spanish'),
    (baltimore_id, 'WJZ', 'WJZ', NULL, 'english'),
    (baltimore_id, 'WBAL', 'WBAL', NULL, 'english');

    -- Insert stations for Raleigh
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (raleigh_id, 'WUVC', 'WUVC', NULL, 'spanish'),
    (raleigh_id, 'WRAL', 'WRAL', NULL, 'english'),
    (raleigh_id, 'WTVD', 'WTVD', NULL, 'english');

    -- Insert stations for Nashville
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (nashville_id, 'WTVF', 'WTVF', NULL, 'spanish'),
    (nashville_id, 'WSMV', 'WSMV', NULL, 'english'),
    (nashville_id, 'WZTV', 'WZTV', NULL, 'english');

    -- Insert stations for San Diego (multiple regions)
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (sandiego_id, 'KBNT', 'KBNT', 'coast', 'spanish'),
    (sandiego_id, 'KBNT', 'KBNT', 'valleys', 'spanish'),
    (sandiego_id, 'KUAN', 'KUAN', 'coast', 'spanish'),
    (sandiego_id, 'KUAN', 'KUAN', 'valleys', 'spanish'),
    (sandiego_id, 'KGTV', 'KGTV', 'coast', 'english'),
    (sandiego_id, 'KNSD', 'KNSD', 'coast', 'english');

    -- Insert stations for Salt Lake City
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (saltlake_id, 'KULX', 'KULX', NULL, 'spanish'),
    (saltlake_id, 'KUTH', 'KUTH', NULL, 'spanish'),
    (saltlake_id, 'KSL', 'KSL', NULL, 'english'),
    (saltlake_id, 'KUTV', 'KUTV', NULL, 'english');

    -- Insert stations for San Antonio
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (sanantonio_id, 'KVDA', 'KVDA', NULL, 'spanish'),
    (sanantonio_id, 'KWEX', 'KWEX', NULL, 'spanish'),
    (sanantonio_id, 'KSAT', 'KSAT', NULL, 'english'),
    (sanantonio_id, 'WOAI', 'WOAI', NULL, 'english');

    -- Insert stations for Kansas City
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (kansascity_id, 'KUKC', 'KUKC', NULL, 'spanish'),
    (kansascity_id, 'KCTV', 'KCTV', NULL, 'english'),
    (kansascity_id, 'KMBC', 'KMBC', NULL, 'english');

    -- Insert stations for Hartford
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (hartford_id, 'WRDM', 'WRDM', NULL, 'spanish'),
    (hartford_id, 'WUVN', 'WUVN', NULL, 'spanish'),
    (hartford_id, 'WFSB', 'WFSB', NULL, 'english'),
    (hartford_id, 'WVIT', 'WVIT', NULL, 'english');

    -- Insert stations for Columbus
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (columbus_id, 'WSF-LD', 'WSF-LD', NULL, 'spanish'),
    (columbus_id, 'WSYX', 'WSYX', NULL, 'english'),
    (columbus_id, 'WBNS', 'WBNS', NULL, 'english');

    -- Insert stations for Milwaukee
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (milwaukee_id, 'WYTU-LD', 'WYTU-LD', NULL, 'spanish'),
    (milwaukee_id, 'WISN', 'WISN', NULL, 'english'),
    (milwaukee_id, 'WTMJ', 'WTMJ', NULL, 'english');

    -- Insert stations for West Palm Beach
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (westpalm_id, 'WTVX', 'WTVX', NULL, 'spanish'),
    (westpalm_id, 'WPEC', 'WPEC', NULL, 'english'),
    (westpalm_id, 'WPBF', 'WPBF', NULL, 'english');

    -- Insert stations for Cincinnati
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (cincinnati_id, 'WSTR', 'WSTR', NULL, 'spanish'),
    (cincinnati_id, 'WLWT', 'WLWT', NULL, 'english'),
    (cincinnati_id, 'WCPO', 'WCPO', NULL, 'english');

    -- Insert stations for Greenville
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (greenville_id, 'WYCW', 'WYCW', NULL, 'spanish'),
    (greenville_id, 'WSPA', 'WSPA', NULL, 'english'),
    (greenville_id, 'WYFF', 'WYFF', NULL, 'english');

    -- Insert stations for Las Vegas
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (vegas_id, 'KBLR', 'KBLR', NULL, 'spanish'),
    (vegas_id, 'KINC', 'KINC', NULL, 'spanish'),
    (vegas_id, 'KLAS', 'KLAS', NULL, 'english'),
    (vegas_id, 'KTNV', 'KTNV', NULL, 'english');

    -- Insert stations for Austin
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (austin_id, 'KAKW', 'KAKW', NULL, 'spanish'),
    (austin_id, 'KEYE', 'KEYE', NULL, 'spanish'),
    (austin_id, 'KVUE', 'KVUE', NULL, 'english'),
    (austin_id, 'KXAN', 'KXAN', NULL, 'english');

    -- Insert stations for Jacksonville
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (jacksonville_id, 'WJEB', 'WJEB', NULL, 'spanish'),
    (jacksonville_id, 'WJXT', 'WJXT', NULL, 'english'),
    (jacksonville_id, 'WTLV', 'WTLV', NULL, 'english');

    -- Insert stations for Norfolk
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (norfolk_id, 'WVBT', 'WVBT', NULL, 'spanish'),
    (norfolk_id, 'WVEC', 'WVEC', NULL, 'english'),
    (norfolk_id, 'WTKR', 'WTKR', NULL, 'english');

    -- Insert stations for Oklahoma City
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (okcity_id, 'KUOK', 'KUOK', NULL, 'spanish'),
    (okcity_id, 'KFOR', 'KFOR', NULL, 'english'),
    (okcity_id, 'KWTV', 'KWTV', NULL, 'english');

    -- Insert stations for Birmingham
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (birmingham_id, 'WTTO', 'WTTO', NULL, 'spanish'),
    (birmingham_id, 'WBRC', 'WBRC', NULL, 'english'),
    (birmingham_id, 'WVTM', 'WVTM', NULL, 'english');

    -- Insert stations for Grand Rapids
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (grandrapids_id, 'WTLJ', 'WTLJ', NULL, 'spanish'),
    (grandrapids_id, 'WOOD', 'WOOD', NULL, 'english'),
    (grandrapids_id, 'WXMI', 'WXMI', NULL, 'english');

    -- Insert stations for Albuquerque
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (albuquerque_id, 'KASA', 'KASA', NULL, 'spanish'),
    (albuquerque_id, 'KLUZ', 'KLUZ', NULL, 'spanish'),
    (albuquerque_id, 'KOAT', 'KOAT', NULL, 'english'),
    (albuquerque_id, 'KRQE', 'KRQE', NULL, 'english');

    -- Insert stations for Fresno
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (fresno_id, 'KFTV', 'KFTV', NULL, 'spanish'),
    (fresno_id, 'KNSO', 'KNSO', NULL, 'spanish'),
    (fresno_id, 'KGPE', 'KGPE', NULL, 'english'),
    (fresno_id, 'KFSN', 'KFSN', NULL, 'english');

    -- Insert stations for Tucson
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (tucson_id, 'KHRR', 'KHRR', NULL, 'spanish'),
    (tucson_id, 'KUVE', 'KUVE', NULL, 'spanish'),
    (tucson_id, 'KVOA', 'KVOA', NULL, 'english'),
    (tucson_id, 'KGUN', 'KGUN', NULL, 'english');

    -- Insert stations for Harlingen
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (harlingen_id, 'KNVO', 'KNVO', NULL, 'spanish'),
    (harlingen_id, 'KTLM', 'KTLM', NULL, 'spanish'),
    (harlingen_id, 'KRGV', 'KRGV', NULL, 'english'),
    (harlingen_id, 'KVEO', 'KVEO', NULL, 'english');

    -- Insert stations for El Paso
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (elpaso_id, 'KINT', 'KINT', NULL, 'spanish'),
    (elpaso_id, 'KTDO', 'KTDO', NULL, 'spanish'),
    (elpaso_id, 'KVIA', 'KVIA', NULL, 'english'),
    (elpaso_id, 'KFOX', 'KFOX', NULL, 'english');

    -- Insert stations for San Juan
    INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language) VALUES
    (sanjuan_id, 'WAPA', 'WAPA', NULL, 'spanish'),
    (sanjuan_id, 'WKAQ', 'WKAQ', NULL, 'spanish'),
    (sanjuan_id, 'WLII', 'WLII', NULL, 'spanish'),
    (sanjuan_id, 'WOLE', 'WOLE', NULL, 'spanish');
END $$;
