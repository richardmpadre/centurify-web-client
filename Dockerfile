FROM nginx as base
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 as build

# set docker working directory to src folder
WORKDIR /src

# COPY *.csproj ./
COPY ./WebClient.csproj .
RUN dotnet restore WebClient.csproj

# copy ALL project files to /src folder
COPY . .
RUN dotnet build WebClient.csproj -c Release -o /app/build

FROM build as publish
RUN dotnet publish WebClient.csproj -c Release -o /app/publish  /p:UseAppHost=false

# second stage: runtime 
FROM base as final
WORKDIR /usr/share/nginx/html
COPY --from=publish /app/publish/wwwroot .
COPY nginx.conf /etc/nginx/nginx.conf