# Database Setup Instructions

## Prerequisites
- MySQL 8.0+ installed and running
- Node.js 18+ installed

## Setup Steps

### 1. Create MySQL Database
```sql
-- Connect to MySQL as root user
mysql -u root -p

-- Create the database
CREATE DATABASE hr_workflow_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Create a dedicated user (optional but recommended)
CREATE USER 'hr_user'@'localhost' IDENTIFIED BY 'your_secure_password';
GRANT ALL PRIVILEGES ON hr_workflow_db.* TO 'hr_user'@'localhost';
FLUSH PRIVILEGES;
```

### 2. Configure Environment Variables
Create a `.env` file in the `backend` directory:

```env
# Server Configuration
PORT=3001
NODE_ENV=development

# Database Configuration
DB_HOST=localhost
DB_PORT=3306
DB_NAME=hr_workflow_db
DB_USER=root
DB_PASSWORD=your_mysql_password

# JWT Configuration
JWT_SECRET=your_super_secret_jwt_key_here_make_it_long_and_secure_at_least_32_characters
JWT_EXPIRES_IN=24h

# Email Configuration (Optional)
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASS=your_app_password

# File Upload Configuration
UPLOAD_PATH=./uploads
MAX_FILE_SIZE=10485760

# Rate Limiting
RATE_LIMIT_WINDOW_MS=900000
RATE_LIMIT_MAX_REQUESTS=100

# Security
BCRYPT_ROUNDS=12
SESSION_TIMEOUT=1800000
```

### 3. Install Backend Dependencies
```bash
cd backend
npm install
```

### 4. Run Database Migration
```bash
npm run migrate
```

### 5. Seed Database with Sample Data (Optional)
```bash
npm run seed
```

### 6. Start Backend Server
```bash
npm run dev
```

The backend should now be running on http://localhost:3001

## Default Login Credentials (after seeding)
- **Admin**: username: `admin`, password: `admin123`
- **HR Manager**: username: `sarah.johnson`, password: `sarah123`
- **Recruiter**: username: `mike.chen`, password: `mike123`
- **Team Lead**: username: `emma.wilson`, password: `emma123`
- **Interviewer**: username: `john.smith`, password: `john123`

## Health Check
Visit http://localhost:3001/health to verify the server is running correctly.

## API Documentation
Visit http://localhost:3001/api to see available endpoints.

