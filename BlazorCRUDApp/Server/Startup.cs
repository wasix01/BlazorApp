//using Blazor.Extensions.Logging;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.ResponseCompression;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
//using Microsoft.Extensions.Logging;
using System.Linq;

namespace BlazorCRUDApp.Server
{
    public class Startup
    {
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            //  services.AddLogging(builder => builder
            //       .AddBrowserConsole() // Register the logger with the ILoggerBuilder
            //       .SetMinimumLevel(LogLevel.Information) // Set the minimum log level to Information
            //  );
            //Using cshtml
            //    @using Microsoft.Extensions.Logging;
            //                @inject ILogger<Index> logger
            //                @page "/"

            //                < h1 > Test Logger </ h1 >

            //                   @functions {
            //        protected override async Task OnInitAsync()
            //            {
            //                logger.LogDebug("OnInitAsync");
            //            }
            //        }
            //Outside the cshtml
            //        [Inject]
            //    protected ILogger<MyTestClass> logger { get; set; }

            //        public void LogInfo(string message)
            //        {
            //            logger.LogDebug(message);
            //        }

            services.AddMvc();
            services.AddResponseCompression(opts =>
            {
                opts.MimeTypes = ResponseCompressionDefaults.MimeTypes.Concat(
                    new[] { "application/octet-stream" });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseResponseCompression();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseBlazorDebugging();
            }

            app.UseStaticFiles();
            app.UseClientSideBlazorFiles<Client.Startup>();

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapDefaultControllerRoute();
                endpoints.MapFallbackToClientSideBlazor<Client.Startup>("index.html");
            });
        }
    }
}
