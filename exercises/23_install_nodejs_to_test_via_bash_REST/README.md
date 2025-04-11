## Doing REST api test via command line

See [notes on json-server](https://www.freecodecamp.org/news/json-server-for-frontend-development/)

### Prereq install nodejs

On ubuntu nodejs is often not the recent version.

However first try to just install nodejs as normal by doing this:
### install default nodejs version

```
sudo apt install nodejs
sudo apt install npm
```

### install nodejs version 20

All distros have ways to install references in the package manager to point to the latest
software to install.  We will config `apt` listings so we can get the latest binaries.
Then we install nodejs.

Get [latest official install notes](https://docs.nodesource.com/docs/nsolid/quickstart/local) but this
should work (copy from the notes on 4/1/2025):


```
$ curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

[sudo] password for bryce:
2024-05-28 17:29:11 - Installing pre-requisites
Get:1 https://deb.nodesource.com/node_20.x nodistro InRelease [12.1 kB]
...
Reading package lists... Done
2024-05-28 17:29:18 - Repository configured successfully. To install Node.js, run: apt-get install nodejs -y


$ sudo apt-get install nsolid -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages will be upgraded:
  nsolid
1 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
...
Unpacking nsolid (20.13.1-ns5.2.2) over (20.13.1-ns5.2.1) ...
Setting up nsolid (20.13.1-ns5.2.2) ...
...


```

## Run a web api server with nodejs

### Seed data

To seed, run this command

```
cat > ~/data.json <<'EOF'
{

  "notes": [
    {
     "id": 1, "title": "HelloWorld"
    }
  ]
}

EOF
```

## Use npm to install json-server for testing

```
npm install -g json-server
```

This will install the JSON server globally on your system. If you want to install it locally for just a particular project instead, use this command: `npm install json-server`

## Run the json-server

We setup data in `~/data.json` so we can run:

```
json-server --watch ~/data.json  &
```

This will start json-server and run it in background.


```
{{ Notes from the internet }}
This will run on "https://localhost:3000" by default. You can change the port it's running on by specifying a different port number when starting the server using the --port flag.

For example, if you want your server to run on port 8000 instead of the default (3000), use this command while starting the server: json-server --watch ~/data.json --port 8000. You can then view this in your browser on port 8000.
```

## Test the nodejs local server with a GET query

```
$ curl http://localhost:3000/notes

==> yields: ==>

[
  {
    "id": "1",
    "title": "HelloWorld"
  }
]
```

## Test the nodejs local server with a POST query

```
$ curl -X POST http://localhost:3000/notes \
> -H 'Content-type: application/json' \
> -d '{"title": "This another note added via curl"}'
```

Next fetch all records again:

```
$ curl http://localhost:3000/notes

==> yields: ==>

[
  {
    "id": "1",
    "title": "HelloWorld"
  },
  {
    "id": "6190",
    "title": "This another note added via curl"
  }
]
```

And so you can use curl from `bash` to do REST API calls.

