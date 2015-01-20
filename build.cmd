SET PATH=%PATH%;c:\go\bin;C:\Program Files (x86)\Git\bin;C:\Program Files\Mercurial;
SET GOPATH=%homedrive%%homepath%\.go
rmdir /s /q tmp
mkdir tmp
go run build/build.go > tmp/_config.yml
@REM grep -P "\tVersion" main.go | tr -d '\t'

@REM for GOOS in windows linux darwin; do
@REM 	EXT=""
@REM 	if [ $GOOS = "windows" ]; then
SET EXT=.exe
@REM 	fi
@REM 	for GOARCH in amd64 386; do
SET GOOS=windows
SET GOARCH=amd64
@echo %GOOS% %GOARCH% %EXT%
go get -d .
go build -gcflags "-N -l" -o tmp/scollector-%GOOS%-%GOARCH%%EXT%
@REM 	done
@REM done

@REM git checkout main.go
@REM git checkout gh-pages
@REM cp tmp/* .
@REM rm -rf tmp
@REM rm -rf Gemfile*
@REM rm -rf _site