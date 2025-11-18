# Weather Forecast Entry System

A comprehensive Supabase-powered system for collecting weather forecasts from stations across the country with two-tier user access.

## Features

### **For Admin Users:**
- ✅ **Multi-Station Management**: View and edit forecasts for all stations
- ✅ **Market Language Filtering**: Filter stations by English/Spanish/All markets
- ✅ **Calendar Interface**: Easy date selection with navigation
- ✅ **Bulk Forecast Entry**: Submit forecasts for multiple stations simultaneously
- ✅ **Complete Forecast History**: Access all historical data
- ✅ **Auto-Save**: Data automatically saves as you type

### **For TV Pro Users:**
- ✅ **Single-Station Focus**: Dedicated interface for assigned station only
- ✅ **Step-by-Step Wizard**: Intuitive 6-step forecast entry process
- ✅ **Enhanced Form Controls**: Radio buttons, checkboxes, and validated inputs
- ✅ **Built-in Instructions**: Collapsible help sections for guidance
- ✅ **Mobile Responsive**: Optimized for tablets and phones
- ✅ **Auto-Save**: Work is automatically preserved
- ✅ **Real-time Validation**: Immediate feedback on required fields

### **System Features:**
- ✅ **Role-Based Authentication**: Automatic routing to appropriate interface
- ✅ **Database-Only User Management**: All user administration handled via Supabase Dashboard
- ✅ **Secure Access Control**: Row-Level Security prevents unauthorized access
- ✅ **Modern UI/UX**: Clean, professional design with consistent branding
- ✅ **Cross-Platform**: Works on desktop, tablet, and mobile devices

## Quick Setup

### 1. Create Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a new project
2. Wait for the project to be ready (2-3 minutes)

### 2. Set Up Database

#### Core Tables
1. In your Supabase project, go to **SQL Editor**
2. Copy and paste the contents of `schema.sql`
3. Click **Run** to create the core tables (locations, stations, forecasts)

#### User Roles System
4. Run the contents of `schema-user-roles.sql` to add user role functionality
5. This creates the `user_profiles` table and Row-Level Security policies

#### Station Data
6. Run the contents of `seed-data.sql` to populate with your stations
7. This includes both English and Spanish market stations with proper language assignments

> **Important**: Run the SQL files in this order: `schema.sql` → `schema-user-roles.sql` → `seed-data.sql`

### 3. Configure Authentication

1. In Supabase, go to **Authentication → Settings**
2. Enable **Email** authentication
3. Set your site URL and redirect URLs

### 4. Create Users

#### Method A: Create Admin User
1. Go to **Authentication → Users** in Supabase
2. Click **Add user** to create your admin account
3. Enter email and password
4. Run this SQL to create the admin profile:
   ```sql
   INSERT INTO user_profiles (user_id, role, full_name)
   VALUES (
     (SELECT id FROM auth.users WHERE email = 'your-admin-email@example.com'),
     'admin',
     'Admin User Name'
   );
   ```

#### Method B: Create TV Pro Users (via Supabase Dashboard)
1. Go to **Authentication → Users** in Supabase
2. Click **Add user** to create a TV Pro account
3. Enter email and password
4. Run this SQL to create the TV Pro profile and assign to a station:
   ```sql
   INSERT INTO user_profiles (user_id, role, assigned_station_id, full_name)
   VALUES (
     (SELECT id FROM auth.users WHERE email = 'tvpro@example.com'),
     'tvpro',
     (SELECT id FROM stations WHERE call_sign = 'STATION_CALL_SIGN'),
     'TV Pro User Name'
   );
   ```

> **Note**: TV Pro users must be assigned to a station (using `assigned_station_id`) to access the system. Admins can access all stations.

### 5. Update Configuration

1. Open both `index.html` and `tvpro.html`
2. Find this section near the top in both files:
   ```javascript
   const SUPABASE_URL = 'YOUR_SUPABASE_URL';
   const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
   ```
3. Replace the placeholder values in both files:
   - Get `SUPABASE_URL` from **Project Settings → API**
   - Get `SUPABASE_ANON_KEY` from the same section
4. Ensure both files use the same Supabase project credentials

### 6. Deploy

#### Files to Deploy:
- `index.html` - Admin interface
- `tvpro.html` - TV Pro interface
- `img/` directory - Logo and images
- All files should be in the same directory

#### Option A: Static Hosting (Recommended)
- Upload to Netlify, Vercel, GitHub Pages, or any static host
- Both interfaces share the same Supabase backend
- Users are automatically routed to the correct interface based on their role

#### Option B: Self-Hosted
- Run a simple web server (nginx, Apache, etc.)
- Ensure both HTML files are accessible from the same domain
- Configure proper CORS headers if needed

#### Option C: Local Testing
- Open `index.html` directly in your browser for testing
- Note: Some features may not work locally due to CORS policies
- For full testing, use a local web server

## Database Structure

### Tables

1. **locations** - Cities/markets where stations are located
2. **stations** - Individual weather stations, can have multiple per city. Includes `market_language` field to distinguish English/Spanish markets.
3. **forecasts** - The actual forecast data for each station and date
4. **user_profiles** - Links Supabase auth users to roles and station assignments
   - `user_id` - Reference to auth.users
   - `role` - 'admin' or 'tvpro'
   - `assigned_station_id` - Station assignment for TV Pro users
   - `full_name` - User's display name

### Forecast Fields

Each forecast entry contains:
- `d1_high`, `d1n_low` - Day 1 high and night low temperatures
- `d2_high`, `d2_low` - Day 2 high and low temperatures  
- `d3_high`, `d3_low` - Day 3 high and low temperatures
- `d4_high`, `d4_low` - Day 4 high and low temperatures
- `d1_conditions`, `d1n_conditions` - Day 1 and night conditions
- `d2_conditions`, `d3_conditions`, `d4_conditions` - Day 2-4 conditions

## How It Works

### For Admin Users (index.html):
1. **Login**: Admin users authenticate with email/password
2. **Automatic Routing**: System detects admin role and loads multi-station interface
3. **Market Selection**: Choose between English/Spanish/All markets (defaults to English)
4. **Date Selection**: Choose a date using the calendar
5. **Bulk Data Entry**: Fill in forecast data for multiple stations simultaneously
6. **Database-Only Admin**: All user management handled via Supabase Dashboard
7. **Auto-Save**: Changes automatically save 2 seconds after typing
8. **Manual Save**: Option to save all data at once

### For TV Pro Users (tvpro.html):
1. **Login**: TV Pro users authenticate with email/password
2. **Automatic Routing**: System detects TV Pro role and redirects to single-station interface
3. **Station Display**: Shows assigned station information prominently
4. **Step-by-Step Entry**: Complete forecast in 6 guided steps:
   - Day 1 (high temp, sky/precip)
   - Day 1 Night
   - Day 2 
   - Day 2 Night
   - Day 3
   - Day 4
5. **Enhanced Controls**: Radio buttons, checkboxes, and validated inputs
6. **Built-in Help**: Collapsible instructions for each step
7. **Auto-Save**: Work is automatically preserved during data entry
8. **Submit**: Final submission when all steps are complete

### Security & Access Control

- **Role-Based Access**: Users can only access their designated interface
- **Station Restrictions**: TV Pro users can only view/edit their assigned station
- **Row-Level Security**: Database policies prevent unauthorized data access
- **Automatic Routing**: Login automatically redirects to appropriate interface

### Market Language Filtering (Admin Only)

- **English**: Shows only English-language stations (WNBC, WABC, KCBS, etc.)
- **Spanish**: Shows only Spanish-language stations (WNJU, KMEX, WGBO, etc.)
- **All Markets**: Shows all available stations

The filter persists when navigating between dates and is remembered throughout the session.

## User Management

All user management is handled directly through the Supabase Dashboard - there is no user management interface in the web application.

### Creating Admin Users
1. In Supabase, go to **Authentication → Users**
2. Click **Add user** to create the admin account
3. Enter email and password
4. Run this SQL to create the admin profile:
   ```sql
   INSERT INTO user_profiles (user_id, role, full_name)
   VALUES (
     (SELECT id FROM auth.users WHERE email = 'admin@example.com'),
     'admin',
     'Admin Name'
   );
   ```

### Creating TV Pro Users (via Supabase Dashboard)
1. In Supabase, go to **Authentication → Users**
2. Click **Add user** to create a TV Pro account
3. Enter email and password
4. Run this SQL to create the TV Pro profile and assign to a station:
   ```sql
   INSERT INTO user_profiles (user_id, role, assigned_station_id, full_name)
   VALUES (
     (SELECT id FROM auth.users WHERE email = 'tvpro@example.com'),
     'tvpro',
     (SELECT id FROM stations WHERE call_sign = 'STATION_CALL_SIGN'),
     'TV Pro User Name'
   );
   ```

### Managing User Assignments
- **Admins**: Can access all stations via index.html
- **TV Pros**: Can only access their assigned station via tvpro.html
- **Station Changes**: Update `assigned_station_id` in user_profiles table
- **Role Changes**: Update `role` field in user_profiles table
- **Profile Management**: All changes made via Supabase Dashboard SQL Editor

### Finding Station IDs
To find the correct `station_id` for TV Pro assignments:
```sql
SELECT id, call_sign, display_name FROM stations ORDER BY call_sign;
```

## Security

- Row Level Security (RLS) enabled on all tables
- Role-based access control in database and frontend
- Only authenticated users can modify forecast data
- TV Pro users restricted to their assigned stations
- Station/location data is publicly readable
- All data is encrypted in transit and at rest
- Automatic role verification on every data access

## Backup & Recovery

- Supabase provides automatic daily backups
- All data is stored in a relational database
- Easy export to CSV if needed

## Adding/Removing Stations

To modify stations or locations:

1. In Supabase SQL Editor:
   ```sql
   -- Add a new location
   INSERT INTO locations (name) VALUES ('New City');

   -- Add a new station (specify market language)
   INSERT INTO stations (location_id, call_sign, display_name, location_shortname, market_language)
   VALUES (1, 'NEW', 'NEW', NULL, 'english');

   -- Remove a station (be careful with existing data)
   DELETE FROM stations WHERE call_sign = 'OLD';
   ```

2. Reload the page - changes appear immediately

### Managing Market Languages

All stations must have a `market_language` value:
- `'english'` for English-language stations
- `'spanish'` for Spanish-language stations  
- `'all'` (rare) for stations serving both markets

When adding new stations, always specify the appropriate market language.

## Customization

### Add New Fields

1. Modify the `forecasts` table schema
2. Update the form fields in the HTML
3. Adjust the JavaScript save functions

### Change Styling

All CSS is embedded in the HTML file. Modify the `<style>` section to:
- Change colors (blue/green themes)
- Adjust layout and spacing  
- Modify fonts and sizes

## Troubleshooting

### General Issues
- **"Login failed"**: Check Supabase URL and API keys in both HTML files
- **"Error loading data"**: Run all SQL scripts in correct order, check RLS policies
- **"Auto-save failed"**: Check network connection, verify Supabase connection

### User Role Issues
- **"Access denied"**: User may not have a profile in user_profiles table
- **"User profile not found"**: Create user profile with proper role assignment
- **"TV Pro can't access station"**: Verify assigned_station_id is correctly set
- **"Wrong interface loading"**: Check user role in user_profiles table

### Database Issues
- **"No user_profiles table"**: Run schema-user-roles.sql
- **"RLS policy violations"**: Check RLS policies in schema-user-roles.sql
- **"Station assignment not working"**: Verify user_profiles table structure

### Interface Issues
- **"TV Pro interface not working"**: Ensure tvpro.html has correct Supabase credentials
- **"Role-based routing not working"**: Verify user_profiles table exists and has correct data

### Migration Issues
- **"Existing users can't log in"**: Create user_profiles records for existing auth users
- **"TV Pro users see all stations"**: Check RLS policies and user role assignments

## Support

This is a simple, self-contained system. All source code is in the single HTML file for easy modification and deployment.

## Migration from Current System

### For New Installations

The system is designed to match your existing structure:

1. **Data Schema**: Matches your current form fields
2. **Station Layout**: Preserves your station grouping and naming
3. **User Experience**: Similar calendar and form layout
4. **Data Export**: Easy to migrate if needed

To migrate existing data, you can export from your current system and import into the Supabase `forecasts` table.

### Migration Files

- `schema.sql` - Core database tables (locations, stations, forecasts)
- `schema-user-roles.sql` - User roles and station assignments system
- `seed-data.sql` - Complete station data with market languages
- `migration-add-market-language.sql` - Add market language support to existing databases
- `sample-data.sql` - Minimal sample data for testing

### Migration Order for New Installations:
1. Run `schema.sql`
2. Run `schema-user-roles.sql` 
3. Run `seed-data.sql`

### Migration Order for Existing Installations:
1. Run `migration-add-market-language.sql` (if adding market language support)
2. Run `schema-user-roles.sql` (to add user roles)
3. Create user_profiles for existing auth users
