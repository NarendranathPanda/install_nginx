# Update the centos
echo "###### Welcome to Install NGINX on CentOS ######"
echo "Step 1.To add the CentOS 7 EPEL repository, open terminal and use the following command."
sudo yum update -y;
sudo yum install -y epel-release;
echo "- CentOS has been updated.";

echo "Step 2.Install httpd-tools package , To store the password "
sudo yum install -y httpd-tools

echo "Step 3. Configure user and password."
sudo mkdir -p /etc/nginx_pass
sudo htpasswd -b -c /etc/nginx_pass/.htpasswd admin admin
echo "-Configured the password for admin"

echo "Step 4. Now that the Nginx repository is installed on your server, install Nginx using the following yum command"
sudo yum install nginx
sudo cp artifacts/nginx.conf /etc/nginx/
sudo systemctl reload nginx
sudo systemctl daemon-reload
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx

echo "Finished"
