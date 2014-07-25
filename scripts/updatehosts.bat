
set gitcmd="c:\Program Files (x86)\Git\bin\git.exe"
set git_user_name=%1
set git_password=%2
if "%3" == "" (
	set git_repository=hostnamelist
) else (
	set git_repository=%3
)
set git_url=https://%git_user_name%:%git_password%@github.com/%git_user_name%/%git_repository%.git

if not exist %git_repository% (
%gitcmd% clone %git_url%
) else (
cd %git_repository%
%gitcmd% pull
cd ..
)

cd %git_repository%
copy hosts C:\Windows\system32\drivers\etc

