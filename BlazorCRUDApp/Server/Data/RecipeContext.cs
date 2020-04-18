using BlazorCRUDApp.Shared.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorCRUDApp.Server.Data
{
    public class RecipeContext:DbContext
    {
        public virtual DbSet<Recipe> tblRecipe { get; set; }
        protected override void OnConfiguring (DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                //postgres
                //localhost
                //;Password=1qa2ws; CommandTimeout = 20
                optionsBuilder.UseNpgsql("Server=postgres;Port=5432;Database=blazor;User Id=postgres");
            }
        }
    }
}
