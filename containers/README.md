# Linux Virtual Environment Notes

## VirtualBox

- Need to enable virtualization in BIOS (one symptom if you don't: unable to create 64-bit virtual machines). See https://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/

- If you are behind a proxy, you may need to run `VBoxManage modifyvm "VM name" --natdnshostresolver1 on` to get DNS working properly. See https://superuser.com/questions/641933/how-to-get-virtualbox-vms-to-use-hosts-dns

## Corporate Proxies (simplified)

https://github.com/tmatilai/vagrant-proxyconf contains useful information.

### bash, wget, curl, pip etc
Add this to your `.bashrc`:

```
export http_proxy=http://PROXY_ADDRESS:PROXY_PORT
export https_proxy=http://PROXY_ADDRESS:PROXY_PORT
```

### apt

Create /etc/apt/apt.conf.d/01proxy with the following contents:

```
Acquire::http::Proxy "http://PROXY_ADDRESS:PROXY_PORT";
Acquire::https::Proxy "http://PROXY_ADDRESS:PROXY_PORT";
```

### docker
