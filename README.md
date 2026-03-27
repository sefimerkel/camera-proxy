# camera-proxy
# IP Camera Proxy

A secure nginx reverse proxy configuration for accessing IP cameras via HTTPS with automatic redirection to the camera view interface.

## Overview

This configuration sets up an nginx server that:

- Serves your IP camera over HTTPS on port 8082
- Automatically redirects all requests to the camera's browser interface
- Exposes only the necessary endpoints
- Provides production-ready SSL/TLS configuration

## Prerequisites

- An IP camera accessible at http://192.168.1.199:8080 (adjust IP in config if needed)
- Nginx installed on the server
- Root or sudo access for nginx configuration and SSL certificates

## Installation

1. Copy the configuration file to nginx sites-available:
   sudo cp camera-proxy /etc/nginx/sites-available/

2. Create a symbolic link to enable the site:
   sudo ln -s /etc/nginx/sites-available/camera-proxy /etc/nginx/sites-enabled/

3. Test nginx configuration:
   sudo nginx -t

4. Restart nginx:
   sudo systemctl restart nginx

## Accessing the Camera

Once installed, access your camera via:
https://YOUR_SERVER_IP:8082/

The server will automatically redirect you to the camera interface.

## Security Considerations

The configuration uses a self-signed SSL certificate by default. For production use, replace with a proper certificate from Let's Encrypt or another CA. Optional basic authentication can be enabled in the config.

## Troubleshooting

Check nginx logs if issues occur:
sudo tail -f /var/log/nginx/camera-proxy.error.log
sudo tail -f /var/log/nginx/camera-proxy.access.log

## File Structure

/home/sefi/app/camera-proxy/
├── camera-proxy    # Main nginx configuration
├── README.md       # This file
└── setup.sh        # Installation helper script

## Uninstallation

1. Remove the symbolic link:
   sudo rm /etc/nginx/sites-enabled/camera-proxy

2. Optionally remove the config file:
   sudo rm /etc/nginx/sites-available/camera-proxy

3. Reload nginx:
   sudo systemctl reload nginx

