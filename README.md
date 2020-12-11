# Linux-Battery-Notification

Will check battery level every 10 minutes and notify if below 31%

Configure cron job 
```bash
crontab -e
```
Paste
```bash
*/10 * * * * sudo -u viscar DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /home/viscar/.battery-notification/battery-notification.sh
```
