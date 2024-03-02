FROM nginx as base
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 as build

# set docker working directory to src folder
WORKDIR /src

COPY *.csproj ./
RUN dotnet restore

# copy ALL project files to /src folder
COPY . .
RUN dotnet publish WebClient.csproj -c Release -o /app 

# second stage: runtime 
FROM base as final
WORKDIR /usr/share/nginx/html
COPY --from=build /app/wwwroot .
COPY nginx.conf /etc/nginx/nginx.conf