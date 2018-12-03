#!bin/sh
while read -p "Is this the manager board (y/n)?" answer
do
case "$answer" in
y|Y ) cd /etc/systemd/system
rm skymanager.service
touch skymanager.service
echo "[Unit]" >> /etc/systemd/system/skymanager.service
echo "Description=Skywire Manager" >> /etc/systemd/system/skymanager.service
echo "After=network.target" >> /etc/systemd/system/skymanager.service
echo "" >> /etc/systemd/system/skymanager.service
echo "[Service]" >> /etc/systemd/system/skymanager.service
echo "WorkingDirectory=/root/go/bin" >> /etc/systemd/system/skymanager.service
echo "Environment=\"GOPATH=/root/go\" \"GOBIN=\$GOPATH/bin\"" >> /etc/systemd/system/skymanager.service
echo "ExecStart=/root/go/bin/manager -web-dir /root/go/src/github.com/skycoin/skywire/static/skywire-manager" >> /etc/systemd/system/skymanager.service
echo "ExecStop=kill" >> /etc/systemd/system/skymanager.service
echo "Restart=on-failure" >> /etc/systemd/system/skymanager.service
echo "RestartSec=10" >> /etc/systemd/system/skymanager.service
echo "" >> /etc/systemd/system/skymanager.service
echo "[Install]" >> /etc/systemd/system/skymanager.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/skymanager.service
cd /root
systemctl daemon-reload
systemctl enable skymanager.service
systemctl start skymanager.service
read -p "What's your manager IP [type for example \"192.168.0.101\", no spaces]?" manIP
cd /etc/systemd/system
rm skynode.service
touch skynode.service
echo "[Unit]" >> /etc/systemd/system/skynode.service
echo "Description=Skywire Node" >> /etc/systemd/system/skynode.service
echo "After=network.target" >> /etc/systemd/system/skynode.service
echo "" >> /etc/systemd/system/skynode.service
echo "[Service]" >> /etc/systemd/system/skynode.service
echo "WorkingDirectory=/root/go/bin" >> /etc/systemd/system/skynode.service
echo "Environment=\"GOPATH=/root/go\" \"GOBIN=\$GOPATH/bin\"" >> /etc/systemd/system/skynode.service
echo "ExecStart=/root/go/bin/node -connect-manager -manager-address $manIP:5998 -manager-web $manIP:8000 -discovery-address discovery.skycoin.net:5999-034b1cd4ebad163e457fb805b3ba43779958bba49f2c5e1e8b062482904bacdb68 -address :5000 -web-port :6001" >> /etc/systemd/system/skynode.service
echo "ExecStop=kill" >> /etc/systemd/system/skynode.service
echo "Restart=on-failure" >> /etc/systemd/system/skynode.service
echo "RestartSec=10" >> /etc/systemd/system/skynode.service
echo "" >> /etc/systemd/system/skynode.service
echo "[Install]" >> /etc/systemd/system/skynode.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/skynode.service
cd /root
systemctl daemon-reload
systemctl enable skynode.service
systemctl start skynode.service
break;;
n|N ) read -p "What's your manager IP [type for example \"192.168.0.101\", no spaces]?" manIP
cd /etc/systemd/system
rm skynode.service
touch skynode.service
echo "[Unit]" >> /etc/systemd/system/skynode.service
echo "Description=Skywire Node" >> /etc/systemd/system/skynode.service
echo "After=network.target" >> /etc/systemd/system/skynode.service
echo "" >> /etc/systemd/system/skynode.service
echo "[Service]" >> /etc/systemd/system/skynode.service
echo "WorkingDirectory=/root/go/bin" >> /etc/systemd/system/skynode.service
echo "Environment=\"GOPATH=/root/go\" \"GOBIN=\$GOPATH/bin\"" >> /etc/systemd/system/skynode.service
echo "ExecStart=/root/go/bin/node -connect-manager -manager-address $manIP:5998 -manager-web $manIP:8000 -discovery-address discovery.skycoin.net:5999-034b1cd4ebad163e457fb805b3ba43779958bba49f2c5e1e8b062482904bacdb68 -address :5000 -web-port :6001" >> /etc/systemd/system/skynode.service
echo "ExecStop=kill" >> /etc/systemd/system/skynode.service
echo "Restart=on-failure" >> /etc/systemd/system/skynode.service
echo "RestartSec=10" >> /etc/systemd/system/skynode.service
echo "" >> /etc/systemd/system/skynode.service
echo "[Install]" >> /etc/systemd/system/skynode.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/skynode.service
cd /root
systemctl daemon-reload
systemctl enable skynode.service
systemctl start skynode.service
break;;
* ) echo "Invalid input"
;;
esac
done
