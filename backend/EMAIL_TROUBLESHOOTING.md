# Email Service Troubleshooting Guide

## Current Issue: Authentication Failed

**Error:** `535-5.7.8 Username and Password not accepted`

## Step-by-Step Solution

### 1. Verify Gmail Account Settings

**Go to:** https://myaccount.google.com/
- Sign in with: `rahulkirad.bylinelearning.com`
- Navigate to: **Security** → **2-Step Verification**

### 2. Enable 2-Factor Authentication (Required)

If 2FA is not enabled:
1. Click **Get Started**
2. Follow the setup process
3. Use your phone number for verification
4. Complete the setup

### 3. Generate App Password

1. Go to: **Security** → **App passwords**
2. If you don't see "App passwords":
   - Make sure 2FA is enabled first
   - Wait a few minutes after enabling 2FA
3. Click **Select app** → **Mail**
4. Click **Select device** → **Other (custom name)**
5. Enter: `HR Workflow System`
6. Click **Generate**
7. **Copy the 16-character password** (e.g., `abcd efgh ijkl mnop`)

### 4. Update Configuration

Replace the password in `email-config.js`:

```javascript
export const emailConfig = {
  EMAIL_USER: 'rahulkirad.bylinelearning.com',
  EMAIL_PASS: 'your-16-character-app-password-here' // Without spaces
};
```

### 5. Test the Configuration

Run the test script:
```bash
node test-email-simple.js
```

## Alternative Solutions

### Option 1: Use OAuth2 (More Secure)

If App Passwords don't work, we can implement OAuth2:

```javascript
// In emailService.js
const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    type: 'OAuth2',
    user: 'rahulkirad.bylinelearning.com',
    clientId: 'your-client-id',
    clientSecret: 'your-client-secret',
    refreshToken: 'your-refresh-token'
  }
});
```

### Option 2: Use Different Email Service

Consider using:
- **SendGrid** (Free tier: 100 emails/day)
- **Mailgun** (Free tier: 5,000 emails/month)
- **Amazon SES** (Pay per use)

### Option 3: Test with Personal Gmail

Try with a personal Gmail account first:
1. Use your personal Gmail
2. Enable 2FA
3. Generate App Password
4. Test the service

## Common Issues & Solutions

### Issue 1: "App passwords" option not visible
**Solution:** 
- Ensure 2FA is enabled
- Wait 5-10 minutes after enabling 2FA
- Try refreshing the page

### Issue 2: "Less secure app access" error
**Solution:**
- Don't use "Less secure app access"
- Always use App Passwords with 2FA

### Issue 3: Account security restrictions
**Solution:**
- Check if the account has any security alerts
- Verify the account is not suspended
- Try logging in normally to Gmail first

### Issue 4: Corporate/Organization account
**Solution:**
- Some organization accounts block App Passwords
- Contact your IT administrator
- Use OAuth2 instead

## Testing Steps

1. **Verify 2FA is enabled:**
   ```
   Go to: https://myaccount.google.com/security
   Check: "2-Step Verification" should show "On"
   ```

2. **Generate new App Password:**
   ```
   Go to: https://myaccount.google.com/apppasswords
   Create new password for "Mail"
   ```

3. **Test with simple credentials:**
   ```javascript
   // Test with minimal config
   const transporter = nodemailer.createTransport({
     service: 'gmail',
     auth: {
       user: 'rahulkirad.bylinelearning.com',
       pass: 'your-app-password'
     }
   });
   ```

## Next Steps

1. **Enable 2FA** on the Gmail account
2. **Generate App Password** for Mail service
3. **Update email-config.js** with the new password
4. **Test the service** again
5. **If still failing**, consider using OAuth2 or alternative email service

## Support

If the issue persists:
1. Check Gmail account security settings
2. Try with a different Gmail account
3. Consider using a dedicated email service
4. Contact the development team for OAuth2 implementation
