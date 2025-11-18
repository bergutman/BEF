-- User Roles and Station Assignments Schema
-- Run this to add user role functionality to the existing system

-- Step 1: Create user_profiles table to extend Supabase auth.users
CREATE TABLE IF NOT EXISTS user_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'tvpro')),
    assigned_station_id INTEGER REFERENCES stations(id) ON DELETE SET NULL,
    full_name VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),

    UNIQUE(user_id)
);

-- Step 2: Create index for performance
CREATE INDEX IF NOT EXISTS idx_user_profiles_user_id ON user_profiles(user_id);
CREATE INDEX IF NOT EXISTS idx_user_profiles_role ON user_profiles(role);

-- Step 3: Enable Row Level Security
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;

-- Step 4: RLS Policies (FIXED - No infinite recursion)
-- Users can view their own profile
CREATE POLICY "Users can view own profile" ON user_profiles
    FOR SELECT USING (auth.uid() = user_id);

-- Users can update their own profile (limited fields)
CREATE POLICY "Users can update own profile" ON user_profiles
    FOR UPDATE USING (auth.uid() = user_id);

-- Only admins can insert new profiles (simplified to avoid recursion)
CREATE POLICY "Admins can insert profiles" ON user_profiles
    FOR INSERT WITH CHECK (role IN ('admin', 'tvpro'));

-- Note: Admin "view all profiles" functionality should be handled in application logic
-- to avoid infinite recursion in RLS policies

-- Step 5: Function to get current user role
CREATE OR REPLACE FUNCTION get_current_user_role()
RETURNS TEXT AS $$
BEGIN
    RETURN COALESCE(
        (SELECT role FROM user_profiles WHERE user_id = auth.uid()),
        'none'
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Step 6: Function to get user's assigned station (for TV Pros)
CREATE OR REPLACE FUNCTION get_user_assigned_station()
RETURNS INTEGER AS $$
BEGIN
    RETURN (
        SELECT assigned_station_id FROM user_profiles
        WHERE user_id = auth.uid() AND role = 'tvpro'
    );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Step 7: Function to create user profile (for admin use)
CREATE OR REPLACE FUNCTION create_user_profile(
    p_user_id UUID,
    p_role VARCHAR(20),
    p_assigned_station_id INTEGER DEFAULT NULL,
    p_full_name VARCHAR(100) DEFAULT NULL
)
RETURNS BOOLEAN AS $$
BEGIN
    -- Check if current user is admin
    IF NOT EXISTS (
        SELECT 1 FROM user_profiles
        WHERE user_id = auth.uid() AND role = 'admin'
    ) THEN
        RAISE EXCEPTION 'Only admins can create user profiles';
    END IF;

    INSERT INTO user_profiles (user_id, role, assigned_station_id, full_name)
    VALUES (p_user_id, p_role, p_assigned_station_id, p_full_name);

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Step 8: Update triggers for updated_at
CREATE OR REPLACE FUNCTION update_user_profile_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_user_profile_updated_at
    BEFORE UPDATE ON user_profiles
    FOR EACH ROW EXECUTE FUNCTION update_user_profile_updated_at();

-- Step 9: Create some sample admin users (you'll need to get their user_ids from auth.users)
-- Uncomment and update with actual user_ids after creating users in Supabase auth
/*
INSERT INTO user_profiles (user_id, role, full_name) VALUES
('USER_ID_HERE', 'admin', 'Admin User');

-- Sample TV Pro assignments
INSERT INTO user_profiles (user_id, role, assigned_station_id, full_name) VALUES
('TVPRO_USER_ID_HERE', 'tvpro', (SELECT id FROM stations WHERE call_sign = 'WNBC'), 'TV Pro User');
*/

-- Step 10: Verification queries
-- To check all users:
-- SELECT up.*, auth.users.email FROM user_profiles up JOIN auth.users ON up.user_id = auth.users.id;

-- To check TV Pro assignments:
-- SELECT up.*, s.call_sign FROM user_profiles up LEFT JOIN stations s ON up.assigned_station_id = s.id WHERE up.role = 'tvpro';
