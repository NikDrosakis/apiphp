# apiPHP
 classic php api with docker-compose as microservice

## TODO 
- GET criteria ORDERBY / WHERE / 
- token 
- REST authentication
- set POST
- set PATCH 
- set DELETE 

## database
Mariadb 

## API Endpoints

### INSTALLATION
git clone [https://github.com/NikDrosakis/apiPHP.git]

docker-compose run 

### GET (folder GET)
table.php GET the maria table
--for specific id
/api/index.php?uid=1&grp=7&method=user&id=1
--or all the contents table (without ID)
/api/index.php?uid=1&grp=7&method=user

### AWESOME REWRITEN AS

- for specific id
  /api/user/1?uid=1&grp=7
  /api/post/1?uid=1&grp=7
  /api/obj/1?uid=1&grp=7
- or all the contents table (without ID)
  /api/post?uid=1&grp=7
  /api/obj?uid=1&grp=7

## TODO:
- replace with api token
- get rest api protocol


### POST


### PATCH