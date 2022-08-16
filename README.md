
# RECON SCRIPTS

Simple automation tool to enumeration (subdomains,archive urls,ips,asn,cidr)


## Installation

Install my-project with npm

```bash
  apt-get install https://github.com/faroukn/recon_scripts.git
  cd recon_scripts
```
    
## Usage

To deploy this project run

### Enumerate subdomains and live sites with IPs 
```bash
  ./recon_subenum.sh example.com
```
![Alt text](/screenshots/1.png?raw=true "Subenum")
### Enumerate archive urls and pass it to gf tool 
```bash
  ./recon_waybackV.sh example.com
```
![Alt text](/screenshots/2.png?raw=true "Wayback")
### Enumerate asn and cidr
```bash
  ./recon_asncidr.sh example.com
```







## Appendix

You Must Install

 - [assetfinder](https://github.com/tomnomnom/assetfinder)
 - [gf](https://github.com/tomnomnom/gf)
 - [waybackurls](https://github.com/tomnomnom/waybackurls)
 - [gau](https://github.com/lc/gau)
 - [amass](https://github.com/OWASP/Amass)

