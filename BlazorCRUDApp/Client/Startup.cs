using Microsoft.AspNetCore.Components.Builder;
using Microsoft.Extensions.DependencyInjection;
//using Microsoft.Extensions.Logging;
//using Blazor.Extensions.Logging;

namespace BlazorCRUDApp.Client
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            // Add Blazor.Extensions.Logging.BrowserConsoleLogger
            //services.AddLogging(builder => builder
            //    .AddBrowserConsole()
            //    .SetMinimumLevel(LogLevel.Trace)
            //);
        }

        public void Configure(IComponentsApplicationBuilder app)
        {
            app.AddComponent<App>("app");
        }
    }
}
