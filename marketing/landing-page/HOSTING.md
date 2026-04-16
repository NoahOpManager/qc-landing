# Landing Page Hosting Guide

## Option 1: Vercel (Recommended - Free)

### Step 1: Create Account
1. Go to [vercel.com](https://vercel.com)
2. Sign up with your GitHub account (easiest)

### Step 2: Deploy
**Method A: GitHub (Recommended for updates)**
1. Create a new GitHub repository
2. Upload the `landing-page` folder files
3. Connect repo to Vercel
4. Done — you'll get a URL like `your-project.vercel.app`

**Method B: Drag & Drop (No Git)**
1. Go to [vercel.com/drop](https://vercel.com/drop)
2. Drag the `landing-page` folder onto the page
3. Done — instant deploy

### Step 3: Custom Domain (Optional)
1. Buy a domain (Namecheap, GoDaddy ~$10/year)
2. Add domain in Vercel settings
3. Point DNS to Vercel

---

## Option 2: Netlify (Also Free)

### Step 1: Create Account
1. Go to [netlify.com](https://netlify.com)
2. Sign up with email or GitHub

### Step 2: Deploy
1. Go to [app.netlify.com/drop](https://app.netlify.com/drop)
2. Drag the `landing-page` folder
3. Done!

### Step 3: Custom Domain
1. Buy domain
2. Add in Netlify → Domain Management
3. Update DNS records

---

## Required Updates Before Launch

### 1. Update Shopify Link
In `index.html`, find line ~170:
```javascript
document.getElementById('shopify-link').href = 'YOUR_SHOPIFY_PRODUCT_URL_HERE';
```
Replace with your actual Shopify product URL.

### 2. Add Meta Pixel ID
In `index.html`, find line ~205:
```javascript
fbq('init', 'YOUR_PIXEL_ID_HERE');
```
Replace with your actual Meta Pixel ID from Facebook Events Manager.

### 3. Email Service Integration
In `index.html`, find the form submission script (line ~175). 
Replace the TODO with your email service:
- **Mailchimp:** Use their embedded form code
- **ConvertKit:** Use their form action URL
- **Google Sheets:** Use Google Apps Script

---

## Quick Deploy Checklist

- [ ] Create Vercel/Netlify account
- [ ] Upload landing page files
- [ ] Update Shopify product link
- [ ] Add Meta Pixel ID
- [ ] Set up email capture (Mailchimp/ConvertKit)
- [ ] Test the full flow
- [ ] Connect custom domain (optional)
- [ ] Test on mobile

---

## Cost Summary

| Item | Cost |
|------|------|
| Vercel | Free |
| Netlify | Free |
| Domain (optional) | ~$10/year |

Total: $0 to start