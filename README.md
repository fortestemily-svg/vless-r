# VLESS TCP on Railway

این پروژه یک Xray ساده با VLESS + TCP برای Deploy روی Railway است.

## چیزی که باید در Railway تنظیم کنی

در Service > Variables این متغیر را بساز:

VLESS_UUID=یک-UUID-جدید

UUID را در GitHub قرار نده.

## Deploy

1. این repository را در GitHub قرار بده.
2. در Railway یک Project جدید بساز.
3. Deploy from GitHub Repo را انتخاب کن.
4. همین repository را انتخاب کن.
5. در Variables مقدار VLESS_UUID را وارد کن.
6. Deploy کن.
7. بعد از Deploy، به Settings > Networking > TCP Proxy برو.
8. برای Internal Port همان پورتی را انتخاب کن که Railway در متغیر PORT به سرویس داده است. اگر Railway هنگام ایجاد TCP Proxy پورت داخلی را می‌خواهد، معمولاً مقدار PORT سرویس را وارد کن.
9. Railway یک hostname و یک external port به شکل زیر می‌دهد:
   HOST:PORT
10. لینک VLESS را با UUID خودت و HOST/PORT ایجاد کن.

## ساخت UUID

روی کامپیوتر می‌توانی این دستور را اجرا کنی:

Linux/macOS:
uuidgen

Python:
python -c "import uuid; print(uuid.uuid4())"

Windows PowerShell:
[guid]::NewGuid()

## نکته مهم

Railway یک VPS اختصاصی سنتی نیست. TCP Proxy ترافیک ورودی را به پورت داخلی سرویس می‌رساند. دامنه و پورت عمومی TCP را Railway ایجاد می‌کند.

این پروژه از Xray-core رسمی استفاده می‌کند.
