mkdir -p ./manbuild/src/BlazorCRUDApp/Server
mkdir -p ./manbuild/src/BlazorCRUDApp/Client
mkdir -p ./manbuild/src/BlazorCRUDApp/Shared
mkdir -p ./manbuild/app/build
mkdir -p ./manbuild/app/publish
mkdir -p ./manbuild/html

cp BlazorCRUDApp.sln ./manbuild/src
cp BlazorCRUDApp/Server/BlazorCRUDApp.Server.csproj ./manbuild/src/BlazorCRUDApp/Server/
cp BlazorCRUDApp/Client/BlazorCRUDApp.Client.csproj ./manbuild/src/BlazorCRUDApp/Client/
cp BlazorCRUDApp/Shared/BlazorCRUDApp.Shared.csproj ./manbuild/src/BlazorCRUDApp/Shared/

dotnet restore "BlazorCRUDApp.sln"
dotnet build "BlazorCRUDApp.sln" -c Release -o ./manbuild/app/build
dotnet publish "BlazorCRUDApp/Server/BlazorCRUDApp.Server.csproj" -c Release -o ./manbuild/app/publish --verbosity n

echo done
#cp -a ./manbuild/app/publish/BlazorCRUDApp.Client/dist/ ./manbuild/html
cp -a ./manbuild/app/publish/  ./manbuild/html
#cp ./app/publish/* ./html

ls -l ./manbuild/html
