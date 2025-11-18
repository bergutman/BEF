# TV Pro Wizard Form Structure

This document outlines the complete 3-step wizard structure for the TV Pro forecast form.

## Step 1: Day 1 (Day + Night) - Complete Forecast

### Day 1 Section:
- **High Temperature** input (`page1-high`)
- **Sky/Precip**: Radio buttons (Sunny P/C, M/C Cloudy, Rain, Snow, Ice, Mixed)
- **Additional**: Checkboxes (Severe T-Storm, Windy, Dense Fog)  
- **Snow**: Radio buttons (0.1"-1.0", 1.1"-3.0", 3.1"-6.0", 6.1"+, None)
- **Precip Time**: Checkboxes (7AM-Noon, Noon-6PM, 6PM-10PM)

### Day 1 Night Section:
- **Low Temperature** input (`page1-low`)
- **Sky/Precip**: Radio buttons (Clear P/C, M/C Cloudy, Rain, Snow, Ice, Mixed)
- **Additional**: Checkboxes (Severe T-Storm, Windy, Dense Fog)
- **Snow**: Radio buttons (same options as Day 1)

## Step 2: Days 2-4 - Complete Forecast

### Each Day (2, 3, 4) Section:
- **High & Low Temperature** inputs (`page2-0-high`, `page2-0-low`)
- **Sky/Precip**: Radio buttons (Sunny P/C, M/C Cloudy, Rain, Snow, Ice, Mixed)
- **Additional**: Checkboxes (Severe T-Storm, Windy, Dense Fog)
- **Snow**: Radio buttons (same as Day 1, defaulting to "None")
- **Precip Time**: Empty (not needed for days 2-4)

## Step 3: Summary/Verification

### Summary Table:
- **Forecast Period**: Date labels (Thu 11/13, Thu Night 11/13, Fri 11/14, etc.)
- **High/Low**: Temperature values
- **Sky/Precip**: User-friendly text (Sunny - P/C, Rain, etc.)
- **Additional**: User-friendly text (Severe T-Storm, Windy, etc. or "None")
- **Snow**: User-friendly text (0.1" - 1.0", None, etc.)
- **Timing**: User-friendly text (7AM-Noon, etc. or empty)

### Navigation:
- Back to Day 1 button
- Previous Step button  
- Submit button

## Form Field Naming Convention

### Step 1 Fields:
- `page1-high` (required)
- `page1-low` (required)
- `page1-sky_precip_high` (radio)
- `page1-additional_high` (checkboxes)
- `page1-snow_high` (radio)
- `page1-precip_time_high` (checkboxes)
- `page1-sky_precip_low` (radio)
- `page1-additional_low` (checkboxes)
- `page1-snow_low` (radio)

### Step 2 Fields:
- `page2-0-high`, `page2-0-low` (required)
- `page2-0-sky_precip` (radio)
- `page2-0-additional` (checkboxes)
- `page2-0-snow` (radio)
- `page2-1-high`, `page2-1-low` (required)
- `page2-1-sky_precip` (radio)
- `page2-1-additional` (checkboxes)
- `page2-1-snow` (radio)
- `page2-2-high`, `page2-2-low` (required)
- `page2-2-sky_precip` (radio)
- `page2-2-additional` (checkboxes)
- `page2-2-snow` (radio)

## Data Conversion to Database Format

### Sky/Precip Mapping:
- "Sunny - P/C" → "1"
- "M/C - Cloudy" → "2"
- "Rain" → "3"
- "Snow" → "4" 
- "Ice" → "5"
- "Mixed" → "6"

### Additional Mapping:
- "Severe T-Storm" → "1"
- "Windy" → "2"
- "Dense Fog" → "3"
- Multiple selections → comma-separated values (1,2,3)

### Snow Mapping:
- "0.1" - 1.0"" → "1"
- "1.1" - 3.0"" → "2"
- "3.1" - 6.0"" → "3"
- "6.1" +" → "4"
- "None" → "" (empty string)

### Precip Time Mapping:
- "7AM-Noon" → "1"
- "Noon-6PM" → "2"
- "6PM-10PM" → "3"
- Multiple selections → comma-separated values

## Implementation Notes

1. **Bootstrap Tables**: Use `table table-borderless table-hover` structure
2. **Radio Groups**: Each radio button should be in its own `<div><label>` structure
3. **Validation**: Step 1 requires both high and low temps. Step 2 requires all 6 temps.
4. **Navigation**: Use `onclick="goToStep2()"`, `onclick="goToStep3()"`, etc.
5. **Step Display**: Use `wizard-step` class with `display: none` for hidden steps
6. **Data Storage**: Store all values in `forecastData` object with field names as keys

The form should use the exact HTML structure from your provided design with Bootstrap tables and proper field naming.