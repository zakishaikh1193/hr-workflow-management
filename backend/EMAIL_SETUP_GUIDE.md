# Email Service Setup Guide

## Overview
This guide will help you set up the Gmail SMTP email service for the HR Workflow Management system.

## Prerequisites
- Gmail account: `rahulkirad.bylinelearning.com`
- 2-Factor Authentication enabled on the Gmail account
- Node.js backend running

## Step 1: Create Gmail App Password

1. **Go to Google Account Settings**
   - Visit: https://myaccount.google.com/
   - Sign in with `rahulkirad.bylinelearning.com`

2. **Enable 2-Factor Authentication** (if not already enabled)
   - Go to Security → 2-Step Verification
   - Follow the setup process

3. **Generate App Password**
   - Go to Security → 2-Step Verification
   - Scroll down to "App passwords"
   - Select "Mail" and "Other (custom name)"
   - Enter "HR Workflow" as the name
   - Copy the generated 16-character password (e.g., `abcd efgh ijkl mnop`)

## Step 2: Configure Environment Variables

Create or update your `.env` file in the backend directory:

```env
# Email Configuration
EMAIL_USER=rahulkirad.bylinelearning.com
EMAIL_PASS=your-16-character-app-password-here

# Database Configuration (if not already present)
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your-database-password
DB_NAME=hr_workflow_db

# JWT Configuration (if not already present)
JWT_SECRET=your-jwt-secret-key
JWT_EXPIRES_IN=7d

# Server Configuration (if not already present)
PORT=3001
NODE_ENV=development
```

**Important:** Replace `your-16-character-app-password-here` with the actual app password from Step 1.

## Step 3: Test the Email Service

### Option 1: Test via API Endpoint
```bash
# Start the backend server
npm start

# Test using curl (replace with your email)
curl -X POST http://localhost:3001/api/send-email \
  -H "Content-Type: application/json" \
  -d '{
    "to": "your-email@example.com",
    "subject": "Test Email",
    "text": "This is a test email from HR Workflow",
    "html": "<h2>Test Email</h2><p>This is a test email from HR Workflow</p>"
  }'
```

### Option 2: Test using Node.js script
```bash
# Run the test script
node test-email.js
```

## Step 4: Verify Email Sending

1. **Check Console Logs**
   - Look for "Email service is ready to send messages"
   - Check for success/error messages

2. **Check Your Email**
   - Look for the test email in your inbox
   - Check spam folder if not found

## Step 5: Test Email Templates

1. **Start the Frontend**
   ```bash
   npm run dev
   ```

2. **Navigate to Settings → Email Templates**

3. **Create a Test Template**
   - Click "Add Template"
   - Use variables like `{{candidate_name}}`, `{{company_name}}`
   - Save the template

4. **Send Test Email**
   - Click "Send" on the template
   - Select candidates
   - Send the email

## Troubleshooting

### Common Issues

1. **"Email credentials not configured"**
   - Check your `.env` file exists
   - Verify `EMAIL_USER` and `EMAIL_PASS` are set
   - Restart the server after adding credentials

2. **"Authentication failed"**
   - Verify the app password is correct
   - Ensure 2FA is enabled on the Gmail account
   - Try generating a new app password

3. **"Connection timeout"**
   - Check your internet connection
   - Verify Gmail SMTP settings
   - Try again after a few minutes

4. **"Invalid login"**
   - Double-check the email address
   - Ensure you're using the app password, not the regular password
   - Verify the account has 2FA enabled

### Debug Steps

1. **Check Environment Variables**
   ```bash
   node -e "console.log(process.env.EMAIL_USER, process.env.EMAIL_PASS)"
   ```

2. **Test SMTP Connection**
   ```bash
   node test-email.js
   ```

3. **Check Server Logs**
   - Look for error messages in the console
   - Check for "Email service is ready" message

## Email Service Features

### Basic Email Sending
```javascript
const result = await emailService.sendEmail(
  'recipient@example.com',
  'Subject',
  'Plain text content',
  '<h1>HTML content</h1>'
);
```

### Template Email Sending
```javascript
const result = await emailService.sendTemplateEmail(
  'recipient@example.com',
  'Hello {{candidate_name}}',
  'Dear {{candidate_name}}, thank you for applying.',
  {
    candidate_name: 'John Doe',
    company_name: 'Your Company'
  }
);
```

### Bulk Email Sending
```javascript
const recipients = [
  { email: 'user1@example.com', variables: { candidate_name: 'User 1' } },
  { email: 'user2@example.com', variables: { candidate_name: 'User 2' } }
];

const result = await emailService.sendBulkEmails(
  recipients,
  'Subject',
  'Content with {{candidate_name}}'
);
```

## Security Notes

- Never commit the `.env` file to version control
- Use app passwords instead of regular passwords
- Rotate app passwords regularly
- Monitor email sending for unusual activity

## Support

If you encounter issues:
1. Check the console logs for error messages
2. Verify your Gmail account settings
3. Test with a simple email first
4. Contact the development team if problems persist

