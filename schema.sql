-- Weather Forecast Collection System Schema

-- Locations table (cities/markets)
CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Stations table (specific weather stations)
CREATE TABLE stations (
    id SERIAL PRIMARY KEY,
    location_id INTEGER REFERENCES locations(id),
    call_sign VARCHAR(10) NOT NULL,
    display_name VARCHAR(50),
    location_shortname VARCHAR(20), -- bay, peninsula, inland, coast, valleys
    market_language VARCHAR(10) DEFAULT 'spanish', -- 'english', 'spanish', or 'all'
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Forecast entries table
CREATE TABLE forecasts (
    id SERIAL PRIMARY KEY,
    station_id INTEGER REFERENCES stations(id),
    forecast_date DATE NOT NULL,
    d1_high INTEGER,
    d1n_low INTEGER,
    d2_high INTEGER,
    d2_low INTEGER,
    d3_high INTEGER,
    d3_low INTEGER,
    d4_high INTEGER,
    d4_low INTEGER,
    d1_conditions VARCHAR(20), -- comma-separated condition codes
    d1n_conditions VARCHAR(20),
    d2_conditions VARCHAR(20),
    d3_conditions VARCHAR(20),
    d4_conditions VARCHAR(20),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

    UNIQUE(station_id, forecast_date)
);

-- Create indexes for better performance
CREATE INDEX idx_forecasts_date_station ON forecasts(forecast_date, station_id);
CREATE INDEX idx_stations_location ON stations(location_id);

-- Enable Row Level Security (RLS)
ALTER TABLE forecasts ENABLE ROW LEVEL SECURITY;
ALTER TABLE stations ENABLE ROW LEVEL SECURITY;
ALTER TABLE locations ENABLE ROW LEVEL SECURITY;

-- Policies: Allow authenticated users to read and write forecasts
CREATE POLICY "Authenticated users can view forecasts" ON forecasts
    FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can insert forecasts" ON forecasts
    FOR INSERT WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can update forecasts" ON forecasts
    FOR UPDATE USING (auth.role() = 'authenticated');

-- Policies: Allow everyone to read stations and locations
CREATE POLICY "Everyone can view stations" ON stations
    FOR SELECT USING (true);

CREATE POLICY "Everyone can view locations" ON locations
    FOR SELECT USING (true);

-- Function to automatically update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger to automatically update updated_at
CREATE TRIGGER update_forecasts_updated_at
    BEFORE UPDATE ON forecasts
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
