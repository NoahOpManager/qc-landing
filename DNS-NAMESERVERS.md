# DNS Nameservers for Netlify

To connect a custom domain to Netlify, use these nameservers:

```
dns1.p05.nsone.net
dns2.p05.nsone.net
dns3.p05.nsone.net
dns4.p05.nsone.net
```

## Setup Steps for Taylor

1. **Buy domain** (if needed) via any registrar
2. **In Netlify:**
   - Go to Site → Domain management → Add custom domain
   - Enter domain name
3. **At domain registrar:**
   - Change nameservers to the ones above
   - Or add CNAME/ALIAS records as Netlify instructs
4. **Wait for DNS propagation** (~5 min to 24 hours)

## Notes
- NSone nameservers detected
- Netlify will provide specific DNS records after adding domain
- SSL/HTTPS auto-provisions by Netlify