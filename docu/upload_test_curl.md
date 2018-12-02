
## How to test the file upload via CURL

### In IEX

- iex -S mix

- url = AwsClientUploaderEx.signed_upload_url("logo.jpg")

> That should give is the pre-signed url for a file named `logo.jpg` - see the example below

- curl -v --upload-file "/Users/steve/Downloads/logo.jpg" "https://s3-ap-southeast-2.amazonaws.com/no-apologies-development/uploads/logo.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJDQBWVCKNBCJ76IQ%2F20181202%2Fap-southeast-2%2Fs3%2Faws4_request&X-Amz-Date=20181202T015614Z&X-Amz-Expires=86400&X-Amz-Signature=81e77f5be317fdb8aa80e0a18d2e9fd095520bf3c8672cd90921bbfbb947189e&X-Amz-SignedHeaders=host"


## How to test the file download via CURL

### In IEX

- iex -S mix

- url = AwsClientUploaderEx.signed_download_url("logo.jpg")

- copy the url and paste it into a new browser tab - (ensure you haven't logged onto the AWS console) and IF the url is correctly signed then you have just pulled down the file with the correctly signed url


## How to configure the AWS S3 bucket for Cross Origin Resource sharing

>Here is a sample CORS configuration for a web app that uses this bucket and the URL configuration - used in DEV mode..

```XML
<?xml version="1.0" encoding="UTF-8"?>
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
<CORSRule>
    <AllowedOrigin>*</AllowedOrigin>
    <AllowedOrigin>foo.lvh.me:4000</AllowedOrigin>
    <AllowedMethod>POST</AllowedMethod>
    <AllowedMethod>PUT</AllowedMethod>
    <AllowedMethod>GET</AllowedMethod>
    <MaxAgeSeconds>3000</MaxAgeSeconds>
    <AllowedHeader>*</AllowedHeader>
</CORSRule>
</CORSConfiguration>
```
