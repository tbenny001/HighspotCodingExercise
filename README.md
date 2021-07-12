# Highspot Coding Exercise

## Dependencies:
- rbenv version 1.1.2
- bundler version 1.17.3
- ruby 2.6.3

## Installation
Once you've installed the above dependencies, you can begin installing the app. To install, clone this repository and run the following commands to install gems and start the server:
```sh
bundle install
brails db:migrate
brails s
```

## Testing
If for any reason a clean database state is needed, run the following command. It will dump your sql tables and give you a fresh db:
```sh
brails db:reset
```

You can test the different endpoints in this project by using the following curl commands and tailoring them to your needs:

Folder Creation Endpoint Example:
```sh
curl -X POST -d "name=home" http://localhost:3000/folders/create
```

Folder List All Endpoint Example:
```sh
curl -X GET http://localhost:3000/folders/index
```

Tag Creation Endpoint Example:
```sh
curl -X POST -d "name=small" http://localhost:3000/tags/create
```

Tag List All Endpoint Example:
```sh
curl -X GET http://localhost:3000/tags/index
```

Url Item Creation Endpoint Example:
```sh
curl -X POST -d "url=http://test.com&name=test&folder_id=1&tags=short"  http://localhost:3000/url_items/create
```

Url Item Search Endpoint Example(using name):
```sh
curl -X POST -d "name=test"  http://localhost:3000/url_items/search
```

Url Item Search Endpoint Example(using name and folder_id):
```sh
curl -X POST -d "name=test&folder_id=1"  http://localhost:3000/url_items/search
```

Url Item Search Endpoint Example(using name, folder_id, and tag):
```sh
curl -X POST -d "name=test&folder_id=1&tags=short"  http://localhost:3000/url_items/search
```
