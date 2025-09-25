# HR Workflow Management System - Backend API

A comprehensive Node.js + Express.js + MySQL backend API for HR workflow management, featuring user authentication, job management, candidate tracking, interview scheduling, and analytics.

## Features

- **Authentication & Authorization**: JWT-based authentication with role-based permissions
- **User Management**: Complete user CRUD with different roles (Admin, HR Manager, Team Lead, Recruiter, Interviewer)
- **Job Management**: Create, update, and manage job postings across multiple portals
- **Candidate Management**: Track candidates through the hiring pipeline
- **Interview Management**: Schedule and manage interviews with feedback system
- **Task Management**: Assign and track recruitment tasks
- **Communication Tracking**: Log and track all candidate communications
- **Analytics & Reporting**: Comprehensive analytics and performance metrics
- **Settings & Configuration**: System settings, email templates, and role permissions

## Tech Stack

- **Runtime**: Node.js (ES Modules)
- **Framework**: Express.js
- **Database**: MySQL 8.0+
- **Authentication**: JWT (jsonwebtoken)
- **Password Hashing**: bcryptjs
- **Validation**: express-validator
- **Security**: helmet, cors, rate-limiting
- **Logging**: morgan

## Prerequisites

- Node.js 18+ 
- MySQL 8.0+
- npm or yarn

## Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd hr-workflow-management/backend
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   Create a `.env` file in the backend directory:
   ```env
   # Server Configuration
   PORT=3001
   NODE_ENV=development

   # Database Configuration
   DB_HOST=localhost
   DB_PORT=3306
   DB_NAME=hr_workflow_db
   DB_USER=root
   DB_PASSWORD=your_password

   # JWT Configuration
   JWT_SECRET=your_super_secret_jwt_key_here_make_it_long_and_secure
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

4. **Set up the database**
   ```bash
   # Create MySQL database
   mysql -u root -p -e "CREATE DATABASE hr_workflow_db;"
   
   # Run database migration
   npm run migrate
   
   # Seed with sample data (optional)
   npm run seed
   ```

5. **Start the server**
   ```bash
   # Development mode
   npm run dev
   
   # Production mode
   npm start
   ```

## API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration (Admin only)
- `POST /api/auth/logout` - User logout
- `GET /api/auth/profile` - Get current user profile
- `PUT /api/auth/profile` - Update user profile
- `POST /api/auth/change-password` - Change password

### Users
- `GET /api/users` - Get all users (paginated)
- `GET /api/users/:id` - Get user by ID
- `PUT /api/users/:id` - Update user
- `DELETE /api/users/:id` - Delete user (Admin only)
- `PUT /api/users/:id/permissions` - Update user permissions
- `GET /api/users/:id/dashboard` - Get user dashboard data

### Jobs
- `GET /api/jobs` - Get all job postings (paginated)
- `GET /api/jobs/:id` - Get job by ID
- `POST /api/jobs` - Create new job posting
- `PUT /api/jobs/:id` - Update job posting
- `DELETE /api/jobs/:id` - Delete job posting
- `GET /api/jobs/:id/candidates` - Get candidates for a job
- `GET /api/jobs/:id/stats` - Get job statistics

### Candidates
- `GET /api/candidates` - Get all candidates (paginated)
- `GET /api/candidates/:id` - Get candidate by ID
- `POST /api/candidates` - Create new candidate
- `PUT /api/candidates/:id` - Update candidate
- `DELETE /api/candidates/:id` - Delete candidate
- `PATCH /api/candidates/:id/stage` - Update candidate stage
- `GET /api/candidates/:id/analytics` - Get candidate analytics
- `POST /api/candidates/bulk-import` - Bulk import candidates

### Interviews
- `GET /api/interviews` - Get all interviews (paginated)
- `GET /api/interviews/:id` - Get interview by ID
- `POST /api/interviews` - Create new interview
- `PUT /api/interviews/:id` - Update interview
- `DELETE /api/interviews/:id` - Delete interview
- `POST /api/interviews/:id/feedback` - Submit interview feedback
- `PATCH /api/interviews/:id/status` - Update interview status
- `GET /api/interviews/upcoming/list` - Get upcoming interviews

### Tasks
- `GET /api/tasks` - Get all tasks (paginated)
- `GET /api/tasks/:id` - Get task by ID
- `POST /api/tasks` - Create new task
- `PUT /api/tasks/:id` - Update task
- `DELETE /api/tasks/:id` - Delete task
- `PATCH /api/tasks/:id/status` - Update task status
- `GET /api/tasks/user/:userId` - Get user's tasks
- `GET /api/tasks/overdue/list` - Get overdue tasks
- `GET /api/tasks/due-today/list` - Get tasks due today

### Communications
- `GET /api/communications` - Get all communications (paginated)
- `GET /api/communications/:id` - Get communication by ID
- `POST /api/communications` - Create new communication
- `PUT /api/communications/:id` - Update communication
- `DELETE /api/communications/:id` - Delete communication
- `GET /api/communications/candidate/:candidateId` - Get candidate communications
- `PATCH /api/communications/:id/status` - Update communication status

### Analytics
- `GET /api/analytics/dashboard` - Get dashboard analytics
- `GET /api/analytics/hiring-funnel` - Get hiring funnel analytics
- `GET /api/analytics/time-to-hire` - Get time-to-hire analytics
- `GET /api/analytics/interviewer-performance` - Get interviewer performance
- `GET /api/analytics/recruiter-performance` - Get recruiter performance
- `GET /api/analytics/job-performance` - Get job performance analytics
- `GET /api/analytics/monthly-trends` - Get monthly trends
- `GET /api/analytics/candidate-quality` - Get candidate quality analytics

### Settings
- `GET /api/settings/system` - Get system settings
- `PUT /api/settings/system` - Update system settings (Admin only)
- `GET /api/settings/email-templates` - Get email templates
- `POST /api/settings/email-templates` - Create email template
- `PUT /api/settings/email-templates/:id` - Update email template
- `DELETE /api/settings/email-templates/:id` - Delete email template
- `GET /api/settings/role-permissions` - Get role permissions
- `PUT /api/settings/role-permissions` - Update role permissions (Admin only)
- `GET /api/settings/health` - Get system health
- `POST /api/settings/export` - Export data (Admin only)

## Database Schema

The database includes the following main tables:
- `users` - User accounts and profiles
- `permissions` - User permissions
- `interviewer_profiles` - Interviewer-specific profiles
- `job_postings` - Job postings
- `job_portals` - Job portal information
- `job_assignments` - Job assignments to users
- `candidates` - Candidate information
- `communications` - Communication logs
- `interviews` - Interview scheduling
- `interview_feedback` - Interview feedback
- `pre_interview_feedback` - Pre-interview feedback
- `post_interview_feedback` - Post-interview feedback
- `tasks` - Task management
- `system_settings` - System configuration
- `email_templates` - Email templates
- `analytics_cache` - Analytics cache

## User Roles & Permissions

### Admin
- Full system access
- User management
- System settings
- Data export

### HR Manager
- Job and candidate management
- User permissions (limited)
- Analytics access

### Team Lead
- Job editing
- Candidate management
- Team coordination

### Recruiter
- Candidate management
- Communication tracking
- Task management

### Interviewer
- Interview management
- Feedback submission
- Candidate viewing

## Security Features

- JWT-based authentication
- Password hashing with bcrypt
- Rate limiting
- CORS protection
- Helmet security headers
- Input validation
- SQL injection protection
- Role-based access control

## Error Handling

- Comprehensive error handling middleware
- Custom error classes
- Validation error handling
- Database error handling
- Graceful error responses

## Scripts

- `npm start` - Start production server
- `npm run dev` - Start development server with nodemon
- `npm run migrate` - Run database migration
- `npm run seed` - Seed database with sample data
- `npm test` - Run tests

## Health Check

The API includes a health check endpoint at `/health` that returns:
- Server status
- Database connection status
- Environment information
- Timestamp

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License.

