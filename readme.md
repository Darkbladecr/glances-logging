# Setup

This assumes that you already have [glances](https://github.com/nicolargo/glances) installed via:

```bash
curl -L https://bit.ly/glances | /bin/bash
```

After which you can adjust the glances.conf or glances.service files directly.

The `setup.sh` script will add these to a new `glances:glances` user and launch the systemctl. Please consider adjusting the base variables in the `setup.sh` file.

If you have a firewall like ufw, Open port 9090 to be able to access it from a remote device.

```bash
# ufw allow 9090
Rule added
Rule added (v6)
```

Afterwards you will need to update your Prometheus server configuration:

```yml
scrape_configs:
  - job_name: 'glances_exporter'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9091']
```
