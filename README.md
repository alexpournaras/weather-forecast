## Weather Forecast with Laravel 12 Nova

This is a weather forecast application in Laravel PHP that provides daily and hourly temperature and precipitation data for various locations. Data is sourced, but not limited, from external APIs such as Open-Meteo and WeatherAPI.

#### Technologies Used

Laravel 12, Laravel Nova 5, PHP 8.2, PostgreSQL, Docker

### Key Features

- Location Management:

    - Users can add, edit, and delete locations.

    - Each location has latitude, longitude, and an active status.

    - If a location is active, new weather data is fetched daily.

    - On creation or update, weather data is fetched automatically.

    - On deletion, all associated daily and hourly data is removed.

- Weather Data Overview:

    - In the location page, the app displays max and min temperatures and total precipitation per day, per API source.

    - Clicking on a specific day shows hourly temperature and precipitation data for that day, location, and API source.

### Expandability

The system is designed to be flexible, allowing easy addition of:

- New locations

- Additional weather forecast APIs

- More weather forecast data types

## Installation Guide

Follow these steps to install and run the application:

1. Install Laravel packages and dependencies

```bash
composer install
```

2. Start the PostgreSQL container from docker-compose.yml file

```bash
docker compose up -d
```

3. Copy the environment file

```bash
cp .env.example .env
```

4. Run database migrations and seed demo data

```bash
php artisan migrate:fresh --seed
```

5. Generate the Application Encryption Key

```bash
php artisan key:generate
```

6. Serve the application

```bash
php artisan serve
```

### Access the application

Open your browser and navigate to:

http://localhost:8000/

You should see the Laravel Nova login page.

#### Login Credentials

```
Email: admin@gmail.com
Password: asdasdasd
```