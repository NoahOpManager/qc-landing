#!/usr/bin/env bash
# Email notification script - checks for new unseen emails and notifies via Telegram

# Configuration
EMAIL="Noah.op.manager@gmail.com"
APP_PASSWORD="sitx qhyp uzfm vckv"
TOKEN="8765056869:AAG7EKBmTFTC9NVowEwXYzDBPJeP8haZpVA"
CHAT_ID="7847446140"

# Export variables for the Python subprocess
export EMAIL APP_PASSWORD TOKEN CHAT_ID

# Fetch unseen emails using Python, mark them as seen, and produce a summary
SUMMARY=$(python3 - <<'PY'
import imaplib, email, os, sys
email_addr = os.getenv('EMAIL')
app_password = os.getenv('APP_PASSWORD').replace(' ', '')
mail = imaplib.IMAP4_SSL('imap.gmail.com')
mail.login(email_addr, app_password)
mail.select('INBOX')
status, data = mail.search(None, '(UNSEEN)')
ids = data[0].split()
if not ids:
    print('No new emails.')
    sys.exit(0)
lines = []
for eid in ids[:5]:
    typ, msg_data = mail.fetch(eid, '(RFC822)')
    raw = msg_data[0][1]
    msg = email.message_from_bytes(raw)
    subject = msg.get('Subject', '')
    from_ = msg.get('From', '')
    lines.append(f"From: {from_}\nSubject: {subject}\n")
    # Mark as seen
    mail.store(eid, '+FLAGS', '\\Seen')
print('\n'.join(lines))
mail.logout()
PY
)

# If there are new emails, send summary via Telegram
if [[ "$SUMMARY" != "No new emails." ]]; then
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="New unseen emails:\n$SUMMARY"
fi
