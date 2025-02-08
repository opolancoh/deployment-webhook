# Use the .NET 9 SDK image for building the application
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copy the project file and restore dependencies
COPY ["DeploymentWebhook/DeploymentWebhook.csproj", "DeploymentWebhook/"]
RUN dotnet restore "DeploymentWebhook//DeploymentWebhook.csproj"

# Copy the remaining source code and publish the app in Release configuration
COPY . .
RUN dotnet publish "DeploymentWebhook/DeploymentWebhook.csproj" -c Release -o /app/publish

# Use the ASP.NET Core runtime image for the final container
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

# Copy the published files from the build container
COPY --from=build /app/publish .

# Set the entry point to run the app
ENTRYPOINT ["dotnet", "DeploymentWebhook.dll"]
