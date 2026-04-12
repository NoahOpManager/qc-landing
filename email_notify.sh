#!/bin/bash
# Email notification script - checks for new unseen emails and notifies via Telegram

EMAIL="Noah.op.manager@gmail.com"
APP_PASSWORD="sitx qhyp uzfm vckv"
TOKEN="8765056869:AAG7EKBmTFTC9NVowEwXYzDBPJeP8haZpVA"
CHAT_ID="7847446140"

# Fetch unseen emails summary using Python
SUMMARY=$(python3 - <<'PY'
import imaplib, email, os
email_addr = os.getenv('EMAIL')
app_password = os.getenv('APP_PASSWORD').replace(' ', '')
mail = imaplib.IMAP4_SSL('imap.gmail.com')
mail.login(email_addr, app_password)
mail.select('INBOX')
status, data = mail.search(None, '(UNSEEN)')
ids = data[0].split()
if not ids:
    print('No new emails.')
else:
    lines = []
    for eid in ids[:5]:
        typ, msg_data = mail.fetch(eid, '(RFC822)')
        raw = msg_data[0][1]
        msg = email.message_from_bytes(raw)
        subject = msg.get('Subject','')
        from_ = msg.get('From','')
        lines.append(f"From: {from_}\nSubject: {subject}\n")
    print('\n'.join(lines))
mail.logout()
PY
)