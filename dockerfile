FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src

#EXPOSE 5000

COPY BlazorCRUDApp.sln .
COPY BlazorCRUDApp/Server/BlazorCRUDApp.Server.csproj ./BlazorCRUDApp/Server/
COPY BlazorCRUDApp/Client/BlazorCRUDApp.Client.csproj ./BlazorCRUDApp/Client/
COPY BlazorCRUDApp/Shared/BlazorCRUDApp.Shared.csproj ./BlazorCRUDApp/Shared/

RUN dotnet restore "BlazorCRUDApp.sln"
COPY . .
RUN dotnet build "BlazorCRUDApp.sln" -c Debug -o /app/build



## q[uiet], m[inimal], n[ormal], d[etailed] und diag[nostic].
FROM build AS publish
RUN dotnet publish "BlazorCRUDApp/Server/BlazorCRUDApp.Server.csproj" -c Debug -o /app/publish


FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /usr/share/webassemblyindocker
COPY --from=publish /app/publish/ .
ENTRYPOINT ["dotnet", "BlazorCRUDApp.Server.dll"]




#FROM nginx:alpine AS final
#WORKDIR /usr/share/nginx/html
#COPY --from=publish /app/publish/BlazorCRUDApp.Client/dist/ .
#COPY --from=publish /app/publish/ .
#COPY nginx.conf /etc/nginx/nginx.conf
