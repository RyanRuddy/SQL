CREATE DATABASE country_data;

CREATE TABLE IF NOT EXISTS country_ref_tbl(
    id SERIAL PRIMARY KEY,
    Country_Name VARCHAR(50) NOT NULL,
    Country_Code VARCHAR(5) NOT NULL 
);

CREATE TABLE IF NOT EXISTS army (
    id SERIAL PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    active_duty INTEGER NOT NULL,
    paramilitary INTEGER NOT NULL,
    reserves INTEGER,
    total INTEGER,
    pop2022 FLOAT,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS atomic_weapons (
    id SERIAL PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    military_stockpile INTEGER,
    retired_weapons INTEGER,
    total_inventory INTEGER,
    total_nuclear_tests INTEGER,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS billionaires (
    id SERIAL PRIMARY KEY,
    rank INTEGER NOT NULL,
    name VARCHAR(50),
    net_worth FLOAT,
    age INTEGER,
    country VARCHAR(50) NOT NULL,
    source VARCHAR(50) NOT NULL,
    industry VARCHAR(50) NOT NULL,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS broadband_penetration (
    id SERIAL PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    year INTEGER,
    broadband_subscriptions_per_100 FLOAT,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS c02_emissions (
    id SERIAL PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    c02_emissions INTEGER NOT NULL,
    pop2022 INTEGER,
    area INTEGER,
    world_proportion FLOAT,
    density VARCHAR(25),
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS cancer_deaths (
    id SERIAL PRIMARY KEY,
    Country VARCHAR(50) NOT NULL,
    Year INTEGER,
    Total_Liver_Cancer_Deaths INTEGER,
    Total_Kidney_Cancer_Deaths INTEGER,
    Total_Oral_Cancer_Deaths INTEGER,
    Total_Trachial_Bronchus_Lung_Cancer_Deaths INTEGER,
    Total_Larynx_Cancer_Deaths INTEGER,
    Total_GallBladder_Cancer_Deaths INTEGER,
    Total_Melanoma_Deaths INTEGER,
    Total_Leukemia_Deaths INTEGER,
    Total_Hodgkins_Lymphoma_Deaths INTEGER,
    Total_Myeloma_Deaths INTEGER,
    Total_Neoplasm_Other_Deaths INTEGER,
    Total_Breast_Cancer_Deaths INTEGER,
    Total_Prostate_Cancer_Deaths INTEGER,
    Total_Thyroid_Cancer_Deaths INTEGER,
    Total_Stomach_Cancer_Deaths INTEGER,
    Total_Bladder_Cancer_Deaths INTEGER,
    Total_Urine_Cancer_Deaths INTEGER,
    Total_Ovarian_Cancer_Deaths INTEGER,
    Total_Cervical_Cancer_Deaths INTEGER,
    Total_Brain_Nervous_System_Cancer_Deaths INTEGER,
    Total_NonHodgkins_Lymphoma_Deaths INTEGER,
    Total_Pancreatic_Cancer_Deaths INTEGER,
    Total_Esophogeal_Cancer_Deaths INTEGER,
    Total_Testicular_Cancer_Deaths INTEGER,
    Total_Nasopharynx_Cancer_Deaths INTEGER,
    Total_Colon_Cancer_Deaths INTEGER,
    Total_Non_Melanoma_Skin_Cancer_Deaths INTEGER,
    Total_Mesotheleoma_Cancer_Deaths INTEGER,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS country_data (
    id SERIAL PRIMARY KEY,
    Country VARCHAR(50) NOT NULL,
    Density INTEGER,
    Agricultural_Land FLOAT,
    Land_Area INTEGER,
    Armed_Forces_Size INTEGER,
    Birth_rate FLOAT,
    CPI FLOAT,
    CPI_Change FLOAT,
    Fertility_Rate FLOAT,
    Forested_Area FLOAT,
    Gasoline_Price FLOAT,
    GDP FLOAT,
    Gross_Primary_Education_Enrollment FLOAT,
    Gross_tertiary_education_enrollment FLOAT,
    Infant_mortality FLOAT,
    Life_expectancy FLOAT,
    Maternal_mortality_ratio INTEGER,
    Minimum_wage FLOAT,
    Out_of_pocket_health_enpenditure FLOAT,
    Physicians_per_thousand FLOAT,
    Population INTEGER,
    Population_Labor_force_participation FLOAT,
    Tax_revenue FLOAT,
    Total_tax_rate FLOAT,
    Unemployment_rate FLOAT,
    Urban_population FLOAT,
    Latitude FLOAT,
    Longitude FLOAT,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS crime_index (
    id SERIAL PRIMARY KEY,
    rank INTEGER NOT NULL,
    city VARCHAR(35) NOT NULL,
    location VARCHAR(25) NOT NULL,
    crime_index FLOAT NOT NULL,
    safety_index FLOAT NOT NULL,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS edu_exp (
    id SERIAL PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    government_expenditure_on_education FLOAT NOT NULL,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS internet_usage (
    id SERIAL PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    number_of_internet_users INTEGER NOT NULL,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS life_expectancy (
    id SERIAL PRIMARY KEY,
    Country VARCHAR(50) NOT NULL,
    Year INTEGER NOT NULL,
    Status VARCHAR(50) NOT NULL,
    Population INTEGER,
    Hepatitis_B INTEGER,
    Measles INTEGER,
    polio INTEGER,
    Diptheria INTEGER,
    HIV_AIDS FLOAT,
    Infant_deaths INTEGER,
    under_five_deaths INTEGER,
    Total_expenditure FLOAT,
    GDP FLOAT,
    BMI FLOAT,
    thinness_1_19_years FLOAT,
    Alcohol FLOAT,
    Schooling FLOAT,
    Life_expectancy FLOAT,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS military_paramilitary_membership (
    id SERIAL PRIMARY KEY,
    Country VARCHAR(50) NOT NULL,
    active_military INTEGER,
    reserve_military INTEGER,
    paramilitary INTEGER,
    total INTEGER,
    per_capita_total FLOAT,
    per_capita_active FLOAT,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS mobile (
    id SERIAL PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    year INTEGER,
    mobile_cellular_subscriptions_per_100 FLOAT,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);

CREATE TABLE netflix (
    id SERIAL PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    total_library_size INTEGER,
    no_of_tv_shows INTEGER,
    no_of_movies INTEGER,
    cost_per_month_basic FLOAT,
    cost_per_month_standard FLOAT,
    cost_per_month_premium FLOAT,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS proportion_individual_internet_users_population (
    id SERIAL PRIMARY KEY,
    country VARCHAR(50),
    year INTEGER,
    individuals_using_the_internet FLOAT,
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS unicorns (
    id SERIAL PRIMARY KEY,
    Company_name VARCHAR(50) NOT NULL,
    Valuation_in_billions FLOAT,
    Date_Joined DATE,
    Country_of_origin VARCHAR(25) NOT NULL,
    City VARCHAR(20),
    Industry VARCHAR(40),
    Investors VARCHAR(100),
    country_id INTEGER NOT NULL REFERENCES country_ref_tbl(id) ON DELETE CASCADE
);
