class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

# Hassan is the man
# Andrew is the man

# https://api.instagram.com/v1/users/search?q=client_id=820ad4a08bad449981480a56d65384cc

https://api.instagram.com/v1/locations/search?lat=48.858844&lng=2.294351&client_id=820ad4a08bad449981480a56d65384cc

https://api.instagram.com/oauth/authorize/?client_id=820ad4a08bad449981480a56d65384cc&redirect_uri=http://www.highfive.com&response_type=code

curl -F 'client_id=820ad4a08bad449981480a56d65384cc' -F 'client_secret=1b9b535a7b294f88a00a4bcdf8991f61' -F 'grant_type=authorization_code' -F 'redirect_uri=http://www.highfive.com' -F 'code=542cdc8d11a34f969fb99306099f31a4' https://api.instagram.com/oauth/access_token


https://api.instagram.com/v1/locations/search?lat=40.697333&lng=-73.986052&access_token=328328693.820ad4a.e7188df1eb914a3d825d3055fee849bf

CLIENT ID	820ad4a08bad449981480a56d65384cc
CLIENT SECRET	1b9b535a7b294f88a00a4bcdf8991f61
WEBSITE URL	http://www.highfive.com
REDIRECT URI	http://www.highfive.com
SUPPORT EMAIL	akpersad@gmail.com
dsbvf = 542cdc8d11a34f969fb99306099f31a4


328328693.820ad4a.e7188df1eb914a3d825d3055fee849bf