USE [master]
GO
/****** Object:  Database [Supermercado]    Script Date: 11/21/2021 10:05:43 PM ******/
CREATE DATABASE [Supermercado]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Supermercado', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Supermercado.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Supermercado_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Supermercado_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Supermercado] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Supermercado].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Supermercado] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Supermercado] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Supermercado] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Supermercado] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Supermercado] SET ARITHABORT OFF 
GO
ALTER DATABASE [Supermercado] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Supermercado] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Supermercado] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Supermercado] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Supermercado] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Supermercado] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Supermercado] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Supermercado] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Supermercado] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Supermercado] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Supermercado] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Supermercado] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Supermercado] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Supermercado] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Supermercado] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Supermercado] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Supermercado] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Supermercado] SET RECOVERY FULL 
GO
ALTER DATABASE [Supermercado] SET  MULTI_USER 
GO
ALTER DATABASE [Supermercado] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Supermercado] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Supermercado] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Supermercado] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Supermercado] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Supermercado] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Supermercado', N'ON'
GO
ALTER DATABASE [Supermercado] SET QUERY_STORE = OFF
GO
USE [Supermercado]
GO
/****** Object:  Table [dbo].[Bono]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bono](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [money] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Id_Empleado] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Condicion] [int] NOT NULL,
 CONSTRAINT [PK__Bono__3214EC07F807C360] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[canton]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[canton](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoriaProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoriaProducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Impuesto] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__categori__3214EC077F66B2B4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Doc_Identificacion] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Pais] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Direccion] [int] NOT NULL,
 CONSTRAINT [PK__cliente__3214EC071C82180A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Monto] [money] NOT NULL,
	[Id_metodoPago] [int] NOT NULL,
	[Id_Cliente] [int] NOT NULL,
	[Id_Empleado] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Id_estadoCompra] [int] NOT NULL,
 CONSTRAINT [PK__compra__3214EC07164418CE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compraxProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compraxProducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Subtotal] [money] NOT NULL,
	[Id_compra] [int] NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__compraxP__3214EC07638A3162] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direccion]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_pais] [int] NOT NULL,
	[Id_provincia] [int] NOT NULL,
	[Id_canton] [int] NOT NULL,
	[DireccionExacta] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Doc_Identificacion] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[SalarioBase] [money] NOT NULL,
	[Id_Puesto] [int] NOT NULL,
	[Id_Sucursal] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Direccion] [int] NOT NULL,
 CONSTRAINT [PK__empleado__3214EC0765BE89B4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[envio]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[envio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Precio] [money] NOT NULL,
	[Id_Compra] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[error]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[error](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadoBono]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadoBono](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadoCompra]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadoCompra](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadoProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadoProducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripccion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventarioProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventarioProducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[CantMaxima] [int] NOT NULL,
	[CantMinima] [int] NOT NULL,
	[Id_Sucursal] [int] NOT NULL,
	[Id_Categoria] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Id_Proveedor] [int] NOT NULL,
	[PrecioCompra] [int] NOT NULL,
	[Porcentaje] [int] NOT NULL,
 CONSTRAINT [PK__inventar__3214EC07A6B56D4D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lote]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaExpiracion] [date] NOT NULL,
	[FechaProduccion] [date] NOT NULL,
	[Descripccion] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__lote__3214EC0742111C57] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[metodoPago]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[metodoPago](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__metodoPa__3214EC07EAED09D0] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pais]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__pais__3214EC07A323E14D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedidoProveedor]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedidoProveedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Precio] [money] NOT NULL,
	[Cant] [int] NOT NULL,
	[Porcentaje] [int] NOT NULL,
	[Id_Proveedor] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[CodigoInventario] [int] NOT NULL,
 CONSTRAINT [PK__pedidoPr__3214EC07A78E6FF1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[PrecioVenta] [money] NOT NULL,
	[Descuento] [int] NOT NULL,
	[Id_Inventario] [int] NOT NULL,
	[Id_Lote] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Id_Pedido] [int] NOT NULL,
	[Id_EstadoProducto] [int] NOT NULL,
 CONSTRAINT [PK__producto__3214EC07EBF40DD8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__proveedo__3214EC07A22719CF] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puesto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puesto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__puesto__3214EC07C2D691DF] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Direccion] [int] NOT NULL,
 CONSTRAINT [PK__sucursal__3214EC0780B4C54B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursalxProveedor]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursalxProveedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Sucursal] [int] NOT NULL,
	[Id_Proveedor] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK__sucursal__3214EC0736DA278E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bono] ADD  CONSTRAINT [DF__Bono__Estado__6C190EBB]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Bono] ADD  DEFAULT ((1)) FOR [Condicion]
GO
ALTER TABLE [dbo].[canton] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[categoriaProducto] ADD  CONSTRAINT [DF__categoria__Estad__6EF57B66]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[cliente] ADD  CONSTRAINT [DF__cliente__Estado__693CA210]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT ((1)) FOR [Direccion]
GO
ALTER TABLE [dbo].[compra] ADD  CONSTRAINT [DF__compra__Estado__74AE54BC]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[compra] ADD  DEFAULT ((1)) FOR [Id_estadoCompra]
GO
ALTER TABLE [dbo].[compraxProducto] ADD  CONSTRAINT [DF__compraxPr__Estad__75A278F5]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[direccion] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[empleado] ADD  CONSTRAINT [DF__empleado__Estado__6B24EA82]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[empleado] ADD  DEFAULT ((1)) FOR [Direccion]
GO
ALTER TABLE [dbo].[envio] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[inventarioProducto] ADD  CONSTRAINT [DF__inventari__Estad__70DDC3D8]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[inventarioProducto] ADD  DEFAULT ((1)) FOR [Id_Proveedor]
GO
ALTER TABLE [dbo].[inventarioProducto] ADD  DEFAULT ((0)) FOR [PrecioCompra]
GO
ALTER TABLE [dbo].[inventarioProducto] ADD  DEFAULT ((0)) FOR [Porcentaje]
GO
ALTER TABLE [dbo].[lote] ADD  CONSTRAINT [DF__lote__Estado__6FE99F9F]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[metodoPago] ADD  CONSTRAINT [DF__metodoPag__Estad__73BA3083]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[pais] ADD  CONSTRAINT [DF__pais__Estado__6754599E]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[pedidoProveedor] ADD  CONSTRAINT [DF__pedidoPro__Estad__72C60C4A]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[producto] ADD  CONSTRAINT [DF__producto__Estado__71D1E811]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT ((1)) FOR [Id_EstadoProducto]
GO
ALTER TABLE [dbo].[proveedor] ADD  CONSTRAINT [DF__proveedor__Estad__6D0D32F4]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[provincia] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[puesto] ADD  CONSTRAINT [DF__puesto__Estado__6A30C649]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[sucursal] ADD  CONSTRAINT [DF__sucursal__Estado__68487DD7]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[sucursal] ADD  DEFAULT ((1)) FOR [Direccion]
GO
ALTER TABLE [dbo].[sucursalxProveedor] ADD  CONSTRAINT [DF__sucursalx__Estad__6E01572D]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Bono]  WITH CHECK ADD FOREIGN KEY([Condicion])
REFERENCES [dbo].[estadoBono] ([Id])
GO
ALTER TABLE [dbo].[Bono]  WITH CHECK ADD  CONSTRAINT [FK__Bono__Id_Emplead__31EC6D26] FOREIGN KEY([Id_Empleado])
REFERENCES [dbo].[empleado] ([Id])
GO
ALTER TABLE [dbo].[Bono] CHECK CONSTRAINT [FK__Bono__Id_Emplead__31EC6D26]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD FOREIGN KEY([Direccion])
REFERENCES [dbo].[direccion] ([Id])
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK__cliente__Pais__29572725] FOREIGN KEY([Pais])
REFERENCES [dbo].[pais] ([Id])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK__cliente__Pais__29572725]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [FK__compra__Id_Clien__534D60F1] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[cliente] ([Id])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [FK__compra__Id_Clien__534D60F1]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [FK__compra__Id_Emple__6477ECF3] FOREIGN KEY([Id_Empleado])
REFERENCES [dbo].[empleado] ([Id])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [FK__compra__Id_Emple__6477ECF3]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD FOREIGN KEY([Id_estadoCompra])
REFERENCES [dbo].[estadoCompra] ([Id])
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [FK__compra__Id_metod__52593CB8] FOREIGN KEY([Id_metodoPago])
REFERENCES [dbo].[metodoPago] ([Id])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [FK__compra__Id_metod__52593CB8]
GO
ALTER TABLE [dbo].[compraxProducto]  WITH CHECK ADD  CONSTRAINT [FK__compraxPr__Id_co__5629CD9C] FOREIGN KEY([Id_compra])
REFERENCES [dbo].[compra] ([Id])
GO
ALTER TABLE [dbo].[compraxProducto] CHECK CONSTRAINT [FK__compraxPr__Id_co__5629CD9C]
GO
ALTER TABLE [dbo].[compraxProducto]  WITH CHECK ADD  CONSTRAINT [FK__compraxPr__Id_Pr__571DF1D5] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[producto] ([Id])
GO
ALTER TABLE [dbo].[compraxProducto] CHECK CONSTRAINT [FK__compraxPr__Id_Pr__571DF1D5]
GO
ALTER TABLE [dbo].[direccion]  WITH CHECK ADD FOREIGN KEY([Id_canton])
REFERENCES [dbo].[canton] ([Id])
GO
ALTER TABLE [dbo].[direccion]  WITH CHECK ADD FOREIGN KEY([Id_pais])
REFERENCES [dbo].[pais] ([Id])
GO
ALTER TABLE [dbo].[direccion]  WITH CHECK ADD FOREIGN KEY([Id_provincia])
REFERENCES [dbo].[provincia] ([Id])
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD FOREIGN KEY([Direccion])
REFERENCES [dbo].[direccion] ([Id])
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK__empleado__Id_Pue__2E1BDC42] FOREIGN KEY([Id_Puesto])
REFERENCES [dbo].[puesto] ([Id])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK__empleado__Id_Pue__2E1BDC42]
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD  CONSTRAINT [FK__empleado__Id_Suc__2F10007B] FOREIGN KEY([Id_Sucursal])
REFERENCES [dbo].[sucursal] ([Id])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [FK__empleado__Id_Suc__2F10007B]
GO
ALTER TABLE [dbo].[envio]  WITH CHECK ADD FOREIGN KEY([Id_Compra])
REFERENCES [dbo].[compra] ([Id])
GO
ALTER TABLE [dbo].[inventarioProducto]  WITH CHECK ADD  CONSTRAINT [FK__inventari__Id_Ca__4222D4EF] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[categoriaProducto] ([Id])
GO
ALTER TABLE [dbo].[inventarioProducto] CHECK CONSTRAINT [FK__inventari__Id_Ca__4222D4EF]
GO
ALTER TABLE [dbo].[inventarioProducto]  WITH CHECK ADD FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[proveedor] ([Id])
GO
ALTER TABLE [dbo].[inventarioProducto]  WITH CHECK ADD  CONSTRAINT [FK__inventari__Id_Su__412EB0B6] FOREIGN KEY([Id_Sucursal])
REFERENCES [dbo].[sucursal] ([Id])
GO
ALTER TABLE [dbo].[inventarioProducto] CHECK CONSTRAINT [FK__inventari__Id_Su__412EB0B6]
GO
ALTER TABLE [dbo].[pedidoProveedor]  WITH CHECK ADD FOREIGN KEY([CodigoInventario])
REFERENCES [dbo].[inventarioProducto] ([Id])
GO
ALTER TABLE [dbo].[pedidoProveedor]  WITH CHECK ADD  CONSTRAINT [FK__pedidoPro__Id_Pr__4CA06362] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[proveedor] ([Id])
GO
ALTER TABLE [dbo].[pedidoProveedor] CHECK CONSTRAINT [FK__pedidoPro__Id_Pr__4CA06362]
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD FOREIGN KEY([Id_EstadoProducto])
REFERENCES [dbo].[estadoProducto] ([Id])
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD FOREIGN KEY([Id_Inventario])
REFERENCES [dbo].[inventarioProducto] ([Id])
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD FOREIGN KEY([Id_Lote])
REFERENCES [dbo].[lote] ([Id])
GO
ALTER TABLE [dbo].[producto]  WITH CHECK ADD FOREIGN KEY([Id_Pedido])
REFERENCES [dbo].[pedidoProveedor] ([Id])
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD FOREIGN KEY([Direccion])
REFERENCES [dbo].[direccion] ([Id])
GO
ALTER TABLE [dbo].[sucursalxProveedor]  WITH CHECK ADD  CONSTRAINT [FK__sucursalx__Id_Pr__37A5467C] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[proveedor] ([Id])
GO
ALTER TABLE [dbo].[sucursalxProveedor] CHECK CONSTRAINT [FK__sucursalx__Id_Pr__37A5467C]
GO
ALTER TABLE [dbo].[sucursalxProveedor]  WITH CHECK ADD  CONSTRAINT [FK__sucursalx__Id_Su__36B12243] FOREIGN KEY([Id_Sucursal])
REFERENCES [dbo].[sucursal] ([Id])
GO
ALTER TABLE [dbo].[sucursalxProveedor] CHECK CONSTRAINT [FK__sucursalx__Id_Su__36B12243]
GO
/****** Object:  StoredProcedure [dbo].[actualizarBono]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizarBono]
@id INT,
@Monto MONEY,
@id_empleado INT,
@Fecha DATE
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@id IS NOT NULL AND @Monto IS NOT NULL AND @id_empleado IS NOT NULL AND @Fecha IS NOT NULL)	
		--existe el bono
		if  (SELECT COUNT(*) FROM [dbo].[Bono] where Id = @id AND Estado = 1) > 0 AND
			(SELECT COUNT(*) FROM [dbo].[empleado] where Id = @id_empleado AND Estado = 1) > 0
			UPDATE [dbo].[Bono] SET [Monto] = @Monto, [Fecha] = @Fecha, [Id_Empleado] = @id_empleado WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarCanton]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZAR Provincia
CREATE PROCEDURE [dbo].[actualizarCanton]
@nombre VARCHAR(50),
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL)	
		--existe el pais
		if  (SELECT COUNT(*) FROM [dbo].[canton] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[canton] SET [Nombre] = @nombre WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarCategoriaProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--ACTUALIZAR CATEGORIA
CREATE PROCEDURE [dbo].[actualizarCategoriaProducto]
@nombre VARCHAR(50),
@impuesto INT,
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL AND @impuesto IS NOT NULL)	
		--existe la categoria
		if  (SELECT COUNT(*) FROM [dbo].[categoriaProducto] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[categoriaProducto] SET [Nombre] = @nombre, [Impuesto] = @impuesto WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

EXEC actualizarPrecioProductos @in_categoria = @id
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarCliente]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZAR BONO
CREATE PROCEDURE [dbo].[actualizarCliente]
@id INT,
@identificacion INT,
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@Direccion INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@id IS NOT NULL AND @identificacion IS NOT NULL AND @nombre IS NOT NULL AND @apellido IS NOT NULL AND
		@Direccion IS NOT NULL)	
		--existen los registros implicados
		if  (SELECT COUNT(*) FROM [dbo].[cliente] where Id = @id AND Estado = 1) > 0 AND
			(SELECT COUNT(*) FROM [dbo].[direccion] where Id = @Direccion AND Estado = 1) > 0
			UPDATE [dbo].[cliente] SET [Doc_Identificacion] = @identificacion, 
									   [Nombre] = @nombre, 
									   [Apellido] = @apellido,
									   [Direccion] = @Direccion
									   WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarCompra]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizarCompra]
@id INT,
@fecha DATE,
@id_metodoPago INT,
@id_cliente INT,
@id_empleado INT,
@id_estado INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@id IS NOT NULL AND @fecha IS NOT NULL AND @id_metodoPago IS NOT NULL AND
		@id_cliente IS NOT NULL AND @id_empleado IS NOT NULL AND @id_estado IS NOT NULL)	
		--existen los registros implicados
		if  (SELECT COUNT(*) FROM [dbo].[compra] where Id = @id AND Estado = 1) > 0 AND
			(SELECT COUNT(*) FROM [dbo].[metodoPago] where Id = @id_metodoPago AND Estado = 1) > 0 AND
			(SELECT COUNT(*) FROM [dbo].[cliente] where Id = @id_cliente AND Estado = 1) > 0 AND
			(SELECT COUNT(*) FROM [dbo].[empleado] where Id = @id_empleado AND Estado = 1) > 0 
			UPDATE [dbo].[compra] SET [Fecha]= @fecha, 
									  [Id_metodoPago] = @id_metodoPago,
									  [Id_Cliente] = @id_cliente,
								      [Id_Empleado] = @id_empleado,
									  [Id_estadoCompra] = @id_estado
								      WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarCompraxProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--UPDATE compraxProducto
CREATE PROCEDURE [dbo].[actualizarCompraxProducto]
@compra INT,
@producto INT,
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@monto MONEY,
	@inventario INT,
	@productoViejo INT,
	@precioViejo INT

	SET @error = 2 --valores nulos
	if (@compra IS NULL AND @producto IS NULL)--valores no nulos
		RETURN @error

	SET @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[compra] where Id = @compra AND Estado = 1) = 0 OR --existe compra
		(SELECT COUNT(*) FROM [dbo].[producto] where Id = @producto AND Estado = 1 AND ([Id_EstadoProducto] = 1 OR [Id_EstadoProducto] = 4)) = 0 OR --existe producto OR
		(SELECT COUNT(*) FROM [dbo].[compraxProducto] where Id = @id AND Estado = 1) = 0
		RETURN @error

	SET @error = 0 --todo bien

	--obtner productoViejo
	SELECT @productoViejo = [Id_Producto] FROM [dbo].[compraxProducto]
							WHERE Id = @id AND Estado = 1
	--actualizar estado del producto
	UPDATE [dbo].[producto] SET [Id_EstadoProducto] = 1 WHERE [Id] = @productoViejo AND Estado = 1
	--obtener precio viejo
	SELECT @precioViejo = [PrecioVenta] FROM [dbo].[producto]
							WHERE Id = @productoViejo AND Estado = 1
	--obtener precioCompra
	SELECT @monto = [PrecioVenta] FROM [dbo].[producto]
						WHERE Id = @producto AND Estado = 1

	--actualizar montoCompra
	UPDATE [dbo].[compra] SET [Monto] = ([Monto]-@precioViejo) + @monto WHERE [Id] = @compra AND Estado = 1
	--actualizar estadoProducto
	UPDATE [dbo].[producto] SET [Id_EstadoProducto] = 5 WHERE [Id] = @producto AND Estado = 1
	--UPDATE 
	UPDATE [dbo].[compraxProducto] SET [Subtotal] = @monto, 
									   [Id_compra] = @compra, 
									   [Id_Producto] = @producto
									   WHERE [Id] = @id AND Estado = 1

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarDireccion]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizarDireccion]
@id INT,
@provincia INT,
@pais INT,
@canton INT,
@direccionExacta VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@id is not null and @provincia IS NOT NULL AND @pais IS NOT NULL AND @canton IS NOT NULL AND @direccionExacta IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[pais] where Id = @pais AND Estado = 1) > 0  AND	  --existe el pais 
		   (SELECT COUNT(*) FROM [dbo].[provincia] where Id = @provincia AND Estado = 1) > 0  AND	 --existe la provincia 
		   (SELECT COUNT(*) FROM [dbo].[canton] where Id = @canton AND Estado = 1) > 0	AND        --existe el canton
		   (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @id AND Estado = 1) > 0	        --existe la direccion

				UPDATE [dbo].[direccion] SET Id_pais = @pais,
											Id_provincia = @provincia, 
											Id_canton = @canton,
											DireccionExacta= @direccionExacta
											WHERE [Id] = @id AND Estado = 1
		else
			set @error = 3 --falta llave foranea
	else
		set @error = 1 --valor repetido


	if (@pais is null OR @provincia IS NULL OR @canton IS NULL or @direccionExacta is null)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarDireccionCompleta]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZAR DIRECCIONCOMPLETA
CREATE PROCEDURE [dbo].[actualizarDireccionCompleta]
@id INT,
@provincia VARCHAR(50),
@pais VARCHAR(50),
@canton VARCHAR(50),
@direccionExacta VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@id_pais INT,
	@id_provincia INT,
	@id_canton INT

	SET @error = 2
	if (@provincia IS NULL OR @pais IS NULL OR @canton IS NULL OR @direccionExacta IS NULL) --valores nulos
		RETURN @error

	SET @error = 3
	if (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @id AND Estado = 1) = 0 --no existe esa direccion
		RETURN @error

	--obtener id_pais
	EXEC insertarPais @nombre = @pais
	SELECT @id_pais = [Id] FROM [dbo].[pais]
						WHERE [Nombre] = @pais AND Estado = 1

	--obtener id_provincia
	EXEC insertarProvincia @nombre = @provincia
	SELECT @id_provincia = [Id] FROM [dbo].[provincia]
							WHERE [Nombre] = @provincia AND Estado = 1
	--obtener id_canton
	EXEC insertarCanton @nombre = @canton
	SELECT @id_canton = [Id] FROM [dbo].[canton]
							WHERE [Nombre] = @canton AND Estado = 1

	UPDATE [dbo].[direccion] SET Id_pais = @id_pais,
								Id_provincia = @id_provincia, 
								Id_canton = @id_canton,
								DireccionExacta= @direccionExacta
								WHERE [Id] = @id AND Estado = 1
SET @error = 0
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarEmpleado]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR EMPLEADO
CREATE PROCEDURE [dbo].[actualizarEmpleado]
@id INT,
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@identificacion INT,
@direccion INT,
@salarioBase MONEY,
@puesto INT,
@sucursal INT


AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0 --no hay error

	if (@nombre IS NOT NULL AND @apellido IS NOT NULL AND @id IS NOT NULL AND
		@direccion IS NOT NULL AND @salarioBase IS NOT NULL AND @puesto IS NOT NULL AND @sucursal IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[empleado] where Id = @id AND Estado = 1) > 0 --existe empleado
			if (SELECT COUNT(*) FROM [dbo].[puesto] where Id = @puesto AND Estado = 1)>0 
				AND (SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0  --existe sucursal y puesto como registro
				AND (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @direccion AND Estado = 1) > 0 --existe direccion
					UPDATE [dbo].[empleado] SET [Doc_Identificacion] = @identificacion,
												[Nombre] = @nombre, 
												[Apellido] = @apellido,
												[Direccion] = @direccion,
												[SalarioBase] = @salarioBase,
												[Id_Puesto] = @puesto,
												[Id_Sucursal] = @sucursal
												WHERE [Id] = @id AND Estado = 1

			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@id is null or @nombre is null OR @apellido IS NULL OR @identificacion IS NULL OR @direccion is null OR @salarioBase IS NULL OR @puesto IS NULL OR @sucursal IS NULL )
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarEnvio]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--UPDATE ENVIO
CREATE PROCEDURE [dbo].[actualizarEnvio]
@id INT,
@compra INT,
@direccion VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@precioCompra MONEY,
	@precioEnvio MONEY

	SET @error = 2 --valores nulos
	if (@compra IS NULL AND @direccion IS NULL)--valores no nulos
		RETURN @error

	SET @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[compra] where Id = @compra AND Estado = 1) = 0 --existe compra
		AND (SELECT COUNT(*) FROM [dbo].[envio] where Id = @id AND Estado = 1) = 0
		RETURN @error

	SET @error = 0 --todo bien

	--obtener precioCompra
	SELECT @precioCompra = [Monto] FROM [dbo].[compra]
						WHERE Id = @compra AND Estado = 1

	--set precio del envio
	SET @precioEnvio = (@precioCompra+0.0)*0.1

	UPDATE [dbo].[envio] SET [Direccion] = @direccion,
							 [Id_Compra] = @compra, 
						     [Precio] = @precioEnvio
							WHERE [Id] = @id AND Estado = 1
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarInventarioProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizarInventarioProducto]
@id INT,
@nombre VARCHAR(50),
@cantidad INT,
@maximo INT,
@minimo INT,
@sucursal INT,
@categoria INT,
@proveedor INT,
@precioCompra INT,
@porcentaje INT

AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0 --no hay error

	if (@id IS NOT NULL AND @nombre IS NOT NULL AND @proveedor IS NOT NULL AND @cantidad IS NOT NULL AND  @precioCompra IS NOT NULL
		AND @maximo IS NOT NULL AND @minimo IS NOT NULL AND @sucursal IS NOT NULL AND @categoria IS NOT NULL AND @porcentaje IS NULL ) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where Id = @id) > 0 --existe el inventario
			if (SELECT COUNT(*) FROM [dbo].[categoriaProducto] where Id = @categoria AND Estado = 1)>0  --existe categoria
				AND (SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0  --existe sucursal 
				
				UPDATE [dbo].[inventarioProducto] SET [Nombre] = @nombre,
												[Cantidad] = @cantidad, 
												[CantMaxima] = @maximo,
												[CantMinima] = @minimo,
												[Id_Sucursal] = @sucursal,
												[Id_Categoria] = @categoria,
												[Id_Proveedor] = @proveedor,
												[PrecioCompra] = @precioCompra,
												[Porcentaje] = @porcentaje
												WHERE [Id] = @id AND Estado = 1
					
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@id IS NULL OR @nombre is null OR @proveedor IS NULL OR @cantidad IS NULL OR @maximo is null OR 
		@minimo IS NULL OR @sucursal IS NULL OR @categoria IS NULL OR @porcentaje IS NULL OR @precioCompra IS NULL )
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarLote]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZAR LOTE
CREATE PROCEDURE [dbo].[actualizarLote]
@id INT,
@descripcion VARCHAR(50),
@expiracion DATE,
@produccion DATE,
@categoria INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@id IS NOT NULL AND @descripcion IS NOT NULL AND @expiracion IS NOT NULL AND @produccion IS NOT NULL AND @categoria IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[categoriaProducto] where Id = @categoria AND Estado = 1) > 0 --existe categoria como registro
		UPDATE [dbo].[lote] SET   [FechaExpiracion] = @expiracion,
												[FechaProduccion] = @produccion, 
												[Id_categoria] = @categoria,
												[Descripccion]= @descripcion
												WHERE [Id] = @id AND Estado = 1
		else
			set @error = 3 --falta llave foranea


	if (@id IS NULL OR @descripcion is null OR @expiracion IS NULL OR @produccion IS NULL OR @categoria IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarMetodoPago]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZAR METODO PAGO
CREATE PROCEDURE [dbo].[actualizarMetodoPago]
@nombre VARCHAR(50),
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL)	
		--existe el pais
		if  (SELECT COUNT(*) FROM [dbo].[metodoPago] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[metodoPago] SET [Nombre] = @nombre WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarPais]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--TABLAS CATALOGO
CREATE PROCEDURE [dbo].[actualizarPais] 
@nombre VARCHAR(50),
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL)	
		--existe el pais
		if  (SELECT COUNT(*) FROM [dbo].[pais] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[pais] SET [Nombre] = @nombre WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarPedido]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZAR PEDIDO PROVEEDOR
CREATE PROCEDURE [dbo].[actualizarPedido]
@idPedido INT,
@precio MONEY,
@cantidad INT,
@porcentaje INT,
@proveedor INT,
@codigoProductoInventario INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@idPedido IS NOT NULL AND @precio IS NOT NULL AND @cantidad IS NOT NULL AND @porcentaje IS NOT NULL AND 
		@proveedor IS NOT NULL AND @codigoProductoInventario IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0 --existe proveedor
			AND (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where Id = @codigoProductoInventario AND Estado = 1) > 0 --existe producto en inventario
			AND (SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where Id = @idPedido AND Estado = 1) > 0 --existe pedido
			
			UPDATE [dbo].[pedidoProveedor] SET  Precio = @precio,
												Porcentaje = @porcentaje, 
												Cant = @cantidad,
												CodigoInventario= @codigoProductoInventario,
												Id_Proveedor = @proveedor
												WHERE [Id] = @idPedido AND Estado = 1

		if (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0 --existe proveedor
			AND (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where Id = @codigoProductoInventario AND Estado = 1) > 0 --existe producto en inventario
			AND (SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where Id = @idPedido AND Estado = 1) > 0 --existe pedido

			EXEC actualizarProductosPedido @id = @idPedido

		else
			set @error = 3 --falta llave foranea

		
	if (@idPedido is null or @precio is null OR @cantidad IS NULL OR @porcentaje IS NULL OR @proveedor IS NULL OR @codigoProductoInventario IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarPrecioProductos]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizarPrecioProductos]
@in_categoria INT
AS
DECLARE 
	@productoCursor INT,
	@precioCompra MONEY,
	@porcentaje INT,
	@impuesto INT,
	@descuento INT,
	@precioNuevo MONEY
DECLARE productitos CURSOR FOR
	SELECT producto.Id, [inventarioProducto].PrecioCompra, 
			[inventarioProducto].Porcentaje, [categoriaProducto].Impuesto,
			producto.Descuento
	FROM [dbo].[producto]
	INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
	INNER JOIN [dbo].[categoriaProducto] ON [dbo].[inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
	WHERE [categoriaProducto].Id = [inventarioProducto].Id_Categoria AND (producto.Estado = 1 OR producto.Estado = 4)

	OPEN productitos --abre el cursor
	FETCH productitos into @productoCursor, @precioCompra, @porcentaje, @impuesto, @descuento
	WHILE @@FETCH_STATUS = 0 --mientras tenga datos el cursor va a agarrar uno por uno
	
	BEGIN 
			SET @precioNuevo = @precioCompra + (@precioCompra * ((@impuesto+0.0)/100.0))+(@precioCompra * ((@porcentaje+0.0)/100.0)) -(@precioCompra * ((@Descuento+0.0)/100.0)) 
			UPDATE [dbo].[producto] SET [PrecioVenta] = @precioNuevo

			FETCH productitos INTO @productoCursor, @precioCompra, @porcentaje, @impuesto, @descuento--trae el siguiente dato
	END

	CLOSE productitos --cerramos cursos
	DEALLOCATE productitos --limpiamos memoria
GO
/****** Object:  StoredProcedure [dbo].[actualizarProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZAR PRODUCTO
CREATE PROCEDURE [dbo].[actualizarProducto]
@Id INT,
@Descuento INT,
@lote INT,
@pedido INT

AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@precioCompra MONEY,
	@porcentaje INT,
	@impuesto INT,
	@inventarioProduc INT,
	@categoria INT,
	@proveedor INT,
	@precioVenta MONEY,
	@nombre VARCHAR (20)
	

	set @error = 2 --nulos
	if ( @Descuento IS NULL OR @id IS NULL OR
		@lote IS NULL OR @pedido IS NULL) --valores nulos
		RETURN @error
		
	set @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[lote] where Id = @lote AND Estado = 1) = 0						
		OR (SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where Id = @pedido AND Estado = 1) = 0	
		OR (SELECT COUNT(*) FROM [dbo].[producto] where Id = @pedido AND [Id_EstadoProducto] != 5  AND [Id_EstadoProducto] != 2  AND Estado = 1) = 0	
		RETURN @error

	SET @error = 0 --no hay error
	--obtener proveedor
	SELECT @proveedor = [Id_Proveedor] FROM [dbo].[pedidoProveedor]
						WHERE Id = @pedido AND Estado = 1
	--obtener precio compra
	SELECT @precioCompra = Precio FROM [dbo].[pedidoProveedor] 
						WHERE Id = @pedido AND Estado = 1
	--obtener porcentaje
	SELECT @porcentaje = Porcentaje FROM [dbo].[pedidoProveedor]
						WHERE Id = @pedido AND Estado = 1
	--obtener Id Inventario
	SELECT @inventarioProduc = CodigoInventario FROM [dbo].[pedidoProveedor]
						WHERE Id = @pedido AND Estado = 1
	--obtener Categoria
	SELECT @categoria = [Id_Categoria] FROM [dbo].[inventarioProducto]
						WHERE Id = @inventarioProduc AND Estado = 1
	--obtener Impuesto
	SELECT @impuesto = [Impuesto] FROM [dbo].[categoriaProducto]
						WHERE Id = @categoria AND Estado = 1
	--obtener nombre
	SELECT @nombre = [Nombre] FROM [dbo].[inventarioProducto]
						WHERE Id = @inventarioProduc AND Estado = 1

	--calcular precio Venta
	SET @precioVenta = @precioCompra + (@precioCompra * ((@impuesto+0.0)/100.0))+(@precioCompra * ((@porcentaje+0.0)/100.0)) -(@precioCompra * ((@Descuento+0.0)/100.0)) 

	UPDATE [dbo].[producto] SET Nombre = @nombre,
								PrecioVenta = @precioVenta, 
								Descuento = @Descuento,
								Id_Inventario= @inventarioProduc,
								Id_Lote = @lote,
								Id_Pedido = @pedido
								WHERE [Id] = @id AND Estado = 1

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarProductosPedido]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZAR TODOS LOS PRODUCTOS DE UN PEDIDO
CREATE PROCEDURE [dbo].[actualizarProductosPedido]
@id INT

AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@precioCompra MONEY,
	@porcentaje INT,
	@impuesto INT,
	@inventarioProduc INT,
	@categoria INT,
	@proveedor INT,
	@precioVenta MONEY,
	@nombre VARCHAR (20)
	

	set @error = 2 --nulos
	if (@id IS NULL) --valores nulos
		RETURN @error
		
	set @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where Id = @id AND Estado = 1) = 0	
		RETURN @error

	SET @error = 0 --no hay error
	--obtener proveedor
	SELECT @proveedor = [Id_Proveedor] FROM [dbo].[pedidoProveedor]
						WHERE Id = @id AND Estado = 1
	--obtener precio compra
	SELECT @precioCompra = Precio FROM [dbo].[pedidoProveedor] 
						WHERE Id = @id AND Estado = 1
	--obtener porcentaje
	SELECT @porcentaje = Porcentaje FROM [dbo].[pedidoProveedor]
						WHERE Id = @id AND Estado = 1
	--obtener Id Inventario
	SELECT @inventarioProduc = CodigoInventario FROM [dbo].[pedidoProveedor]
						WHERE Id = @id AND Estado = 1
	--obtener Categoria
	SELECT @categoria = [Id_Categoria] FROM [dbo].[inventarioProducto]
						WHERE Id = @inventarioProduc AND Estado = 1
	--obtener Impuesto
	SELECT @impuesto = [Impuesto] FROM [dbo].[categoriaProducto]
						WHERE Id = @categoria AND Estado = 1
	--obtener nombre
	SELECT @nombre = [Nombre] FROM [dbo].[inventarioProducto]
						WHERE Id = @inventarioProduc AND Estado = 1

	--calcular precio Venta
	SET @precioVenta = @precioCompra + (@precioCompra * ((@impuesto+0.0)/100.0))+(@precioCompra * ((@porcentaje+0.0)/100.0)) 

	UPDATE [dbo].[producto] SET Nombre = @nombre,
								PrecioVenta = @precioVenta - (@precioCompra * (([Descuento]+0.0)/100.0))
								WHERE [Id_Pedido] = @id AND Estado = 1 AND [Id_EstadoProducto] != 5 AND [Id_EstadoProducto] !=2

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarProveedor]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--ACTUALIZAR PROVEEDOR
CREATE PROCEDURE [dbo].[actualizarProveedor]
@nombre VARCHAR(50),
@id INT,
@telefono INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL AND @telefono IS NOT NULL)	
		--existe el pais
		if  (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[proveedor] SET [Nombre] = @nombre, [Telefono] = @telefono WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarProvincia]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZAR Provincia
CREATE PROCEDURE [dbo].[actualizarProvincia]
@nombre VARCHAR(50),
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL)	
		--existe el pais
		if  (SELECT COUNT(*) FROM [dbo].[provincia] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[provincia] SET [Nombre] = @nombre WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarPuesto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ACTUALIZAR PUESTO
CREATE PROCEDURE [dbo].[actualizarPuesto]
@nombre VARCHAR(50),
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL)	
		--existe el pais
		if  (SELECT COUNT(*) FROM [dbo].[puesto] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[puesto] SET [Nombre] = @nombre WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarSucursal]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--actualizarSucursal
CREATE PROCEDURE [dbo].[actualizarSucursal]
@id INT,
@nombre VARCHAR(50),
@direccion INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@id IS NOT NULL AND @nombre IS NOT NULL AND @direccion IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[sucursal] where ID = @id) > 0 --existe sucursal
			if (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @direccion AND Estado = 1) > 0		  --existe el pais como registro
				UPDATE [dbo].[sucursal] SET Nombre = @nombre,
								Direccion = @direccion
								WHERE [Id] = @id AND Estado = 1
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@id is null or @nombre is null OR @direccion IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarSucursalxProveedor]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizarSucursalxProveedor]
@id INT,
@sucursal INT,
@proveedor INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@id is not null and @sucursal IS NOT NULL AND @proveedor IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[sucursalxProveedor] where Id = @id AND Estado = 1) > 0 --existe
			if ((SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0 --existe la sucursal como registro
				AND (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0) --existe el proveedor
					UPDATE [dbo].[sucursalxProveedor] SET [Id_Sucursal] = @sucursal,
														[Id_Proveedor] = @proveedor
														WHERE [Id] = @id AND Estado = 1
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@id is null or @sucursal is null OR @proveedor IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[aplicarDescuento]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[aplicarDescuento] 
@descuento INT
AS
BEGIN
	SET NOCOUNT ON; 

	UPDATE [dbo].[producto] SET [Descuento] = @descuento, [PrecioVenta] = [PrecioVenta] - (PrecioVenta+0.0)*((@descuento+0.0)/100)
							FROM [dbo].[producto]
							INNER JOIN [dbo].[lote] ON producto.Id_Lote = lote.Id
							WHERE Id_EstadoProducto = 3
							
END
GO
/****** Object:  StoredProcedure [dbo].[compraXFecha]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[compraXFecha]
@fecha DATE 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			WHERE compra.Fecha = @fecha
		
END
GO
/****** Object:  StoredProcedure [dbo].[compraXPais]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[compraXPais]
@pais INt 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado, [dbo].[sucursal].Nombre AS Sucursal, 
			[dbo].[pais].Nombre AS Pais
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[direccion] ON empleado.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON [dbo].[direccion].Id_pais = [dbo].[pais].Id
			WHERE [dbo].[direccion].Id_pais = @pais
		
END
GO
/****** Object:  StoredProcedure [dbo].[compraXSucursal]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[compraXSucursal]
@sucursal INt 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado, [dbo].[sucursal].Nombre AS Sucursal
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			WHERE empleado.Id_Sucursal = @sucursal
		
END
GO
/****** Object:  StoredProcedure [dbo].[consultaProductosExpiran]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultaProductosExpiran] 
AS
BEGIN
	SET NOCOUNT ON; 

	UPDATE [dbo].[producto] SET [Id_EstadoProducto] = 3
							FROM [dbo].[producto]
							INNER JOIN [dbo].[lote] ON producto.Id_Lote = lote.Id
							WHERE DATEDIFF (DAY, GETDATE () , lote.FechaExpiracion  )  <= 8
							

	SELECT producto.Id,producto.[Nombre], proveedor.Nombre as Proveedor, sucursal.Nombre as Sucursal, 
			lote.FechaExpiracion,lote.FechaProduccion, lote.FechaProduccion,
			[dbo].[estadoProducto].Descripccion as Estado, [dbo].[categoriaProducto].Nombre as categoria
			FROM [dbo].[producto]
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = lote.Id
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[proveedor] ON [dbo].[inventarioProducto].[Id_Proveedor] = [dbo].[proveedor].Id
			INNER JOIN [dbo].[sucursal] ON [dbo].[inventarioProducto].[Id_Sucursal] = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoProducto] ON [dbo].[producto].Id_EstadoProducto = [dbo].[estadoProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON [dbo].[inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			WHERE DATEDIFF (DAY, GETDATE () , lote.FechaExpiracion  )  <= 8
END
GO
/****** Object:  StoredProcedure [dbo].[consultaProductosxProveedor]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAS DE PRODUCTOS Y PRECIO X PROVEEDOR
CREATE PROCEDURE [dbo].[consultaProductosxProveedor] 
@proveedorID INT 
AS
BEGIN
	SET NOCOUNT ON; 
							
	SELECT Proveedor.Nombre as Proveedor, sucursal.Nombre as Sucursal, 
			[dbo].[inventarioProducto].Nombre,[Cantidad],[CantMaxima], [CantMinima],
			[dbo].[inventarioProducto].[PrecioCompra],
			[dbo].[inventarioProducto].[PrecioCompra] + ([dbo].[inventarioProducto].[PrecioCompra]*[dbo].[inventarioProducto].[Porcentaje]) as PrecioVenta,
			[dbo].[categoriaProducto].Nombre as categoria FROM [dbo].[inventarioProducto]
			INNER JOIN [dbo].[proveedor] ON [dbo].[inventarioProducto].Id_Proveedor = [dbo].[proveedor].Id
			INNER JOIN [dbo].[sucursal] ON [dbo].[inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[categoriaProducto] ON [dbo].[inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			WHERE [inventarioProducto].[Id_Proveedor] = @proveedorID
END
GO
/****** Object:  StoredProcedure [dbo].[consultarBonosPagados]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--BONOS PAGADOS
CREATE PROCEDURE [dbo].[consultarBonosPagados]
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, 
			Empleado.Id as IdEmpleado, empleado.Nombre as empleado, Apellido, Doc_Identificacion, SalarioBase, 
			puesto.Nombre as puesto, sucursal.Nombre as sucursal, [dbo].[estadoBono].[Descripcion] as EstadoBono
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[empleado] ON Bono.Id_Empleado = empleado.Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			WHERE Bono.Condicion = 2
							
END
GO
/****** Object:  StoredProcedure [dbo].[consultarBonosPendientes]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultarBonosPendientes]
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, 
			Empleado.Id as IdEmpleado, empleado.Nombre as empleado, Apellido, Doc_Identificacion, SalarioBase, 
			puesto.Nombre as puesto, sucursal.Nombre as sucursal, [dbo].[estadoBono].[Descripcion] as EstadoBono
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[empleado] ON Bono.Id_Empleado = empleado.Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			WHERE Bono.Condicion = 1
							
END
GO
/****** Object:  StoredProcedure [dbo].[consultarBonosxEmpleado]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultarBonosxEmpleado]
@idEmpleado INT
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, [dbo].[estadoBono].[Descripcion] as EstadoBono
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			WHERE Bono.Id_Empleado = @idEmpleado			
END
GO
/****** Object:  StoredProcedure [dbo].[consultarBonosxFecha]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultarBonosxFecha]
@in_fecha DATE
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, [dbo].[estadoBono].[Descripcion] as EstadoBono,
			Empleado.Id as IdEmpleado, empleado.Nombre as empleado, Apellido, Doc_Identificacion, SalarioBase, 
			puesto.Nombre as puesto, sucursal.Nombre as sucursal
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			INNER JOIN [dbo].[empleado] ON Bono.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			WHERE Bono.Fecha = @in_fecha			
END
GO
/****** Object:  StoredProcedure [dbo].[consultarBonosxPais]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultarBonosxPais]
@in_pais INT
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, [dbo].[estadoBono].[Descripcion] as EstadoBono,
			Empleado.Id as IdEmpleado, empleado.Nombre as empleado, Apellido, Doc_Identificacion, SalarioBase, 
			puesto.Nombre as puesto, sucursal.Nombre as sucursal, pais.Nombre as Pais
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			INNER JOIN [dbo].[empleado] ON Bono.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[direccion] ON empleado.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON direccion.Id_pais = [dbo].[pais].Id
			WHERE direccion.Id_pais = @in_pais	
END
GO
/****** Object:  StoredProcedure [dbo].[consultarBonosxSucursal]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultarBonosxSucursal]
@in_sucursal INT
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, [dbo].[estadoBono].[Descripcion] as EstadoBono,
			Empleado.Id as IdEmpleado, empleado.Nombre as empleado, Apellido, Doc_Identificacion, SalarioBase, 
			puesto.Nombre as puesto, sucursal.Nombre as sucursal
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			INNER JOIN [dbo].[empleado] ON Bono.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			WHERE empleado.Id_Sucursal = @in_sucursal		
END
GO
/****** Object:  StoredProcedure [dbo].[consultarEmpleadosXbono]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR EMPLEADOS CON BONO PENDIENTE
CREATE PROCEDURE [dbo].[consultarEmpleadosXbono]
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT empleado.Id, sum(Bono.Monto) as total, MAX(empleado.Nombre) as Nombre, MAX(empleado.Apellido) as Apellido,
			MAX ( empleado.Doc_Identificacion) as Identificacion, MAX (puesto.Nombre) as Puesto,
			MAX(sucursal.Nombre) as Sucursal, MAX(empleado.SalarioBase) as SalarioBase,
			SUM(Bono.Monto) as SumaEnBonos, (MAX(empleado.SalarioBase) + SUM(Bono.Monto)) as SalarioTotal
	FROM [dbo].[empleado]
	INNER JOIN [dbo].[Bono] ON Bono.Id_Empleado = empleado.Id
	INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
	INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
	WHERE ((SELECT COUNT(*) FROM [dbo].[Bono] where Bono.Id_Empleado = empleado.Id AND Bono.Condicion = 1) > 0)
	GROUP BY empleado.Id
							
END
GO
/****** Object:  StoredProcedure [dbo].[consultarInventarioxCategoria]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultarInventarioxCategoria]
@in_categoria INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  [inventarioProducto].Id, [inventarioProducto].[Nombre], [inventarioProducto].Cantidad, [inventarioProducto].CantMaxima,
			[inventarioProducto].CantMinima, [categoriaProducto].Nombre as Categoria
			FROM [inventarioProducto] 
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			WHERE [inventarioProducto].Id_Categoria = @in_categoria		
END
GO
/****** Object:  StoredProcedure [dbo].[consultarInventarioxSucursal]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR INVENTARIO X SUCURSAL
CREATE PROCEDURE [dbo].[consultarInventarioxSucursal]
@in_sucursal INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  [inventarioProducto].Id, [inventarioProducto].[Nombre], [inventarioProducto].Cantidad, [inventarioProducto].CantMaxima,
			[inventarioProducto].CantMinima, [categoriaProducto].Nombre as Categoria
			FROM [inventarioProducto] 
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			WHERE [inventarioProducto].Id_Sucursal = @in_sucursal		
END
GO
/****** Object:  StoredProcedure [dbo].[consultarProductosxCategoria]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultarProductosxCategoria]
@in_categoria INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  producto.Id, producto.[Nombre], producto.PrecioVenta, producto.Descuento,  
			[dbo].[categoriaProducto].Nombre as Categoria, [dbo].[sucursal].Nombre AS sucursal, lote.FechaExpiracion, lote.FechaProduccion,
			[dbo].[estadoProducto].Descripccion as estado
			FROM [dbo].[producto]
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoProducto] ON  producto.Id_EstadoProducto = [dbo].[estadoProducto].Id
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = [dbo].[lote].Id
			WHERE [dbo].[inventarioProducto].Id_Categoria = @in_categoria		
END
GO
/****** Object:  StoredProcedure [dbo].[consultarProductosxInventario]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR PRODUCTOS X INVENTARIO
CREATE PROCEDURE [dbo].[consultarProductosxInventario]
@in_inv INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  producto.Id, producto.[Nombre], producto.PrecioVenta, producto.Descuento,  
			[dbo].[categoriaProducto].Nombre as Categoria, [dbo].[sucursal].Nombre AS sucursal, lote.FechaExpiracion, lote.FechaProduccion,
			[dbo].[estadoProducto].Descripccion as estado
			FROM [dbo].[producto]
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoProducto] ON  producto.Id_EstadoProducto = [dbo].[estadoProducto].Id
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = [dbo].[lote].Id
			WHERE producto.Id_Inventario = @in_inv		
END
GO
/****** Object:  StoredProcedure [dbo].[consultarProductosxSucursal]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consultarProductosxSucursal]
@in_sucursal INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  producto.Id, producto.[Nombre], producto.PrecioVenta, producto.Descuento,  
			[dbo].[categoriaProducto].Nombre as Categoria, [dbo].[sucursal].Nombre AS sucursal, lote.FechaExpiracion, lote.FechaProduccion
			FROM [dbo].[producto]
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = [dbo].[lote].Id
			WHERE [inventarioProducto].Id_Sucursal = @in_sucursal		
END
GO
/****** Object:  StoredProcedure [dbo].[detallesCompra]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[detallesCompra]
@idCompra INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado, [dbo].[envio].Precio AS PrecioEnvio,
			([dbo].[compra].Monto + [dbo].[envio].Precio) AS Total
			FROM [dbo].[envio]
			INNER JOIN [dbo].[compra] ON compra.Id = [dbo].[envio].Id_Compra
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			WHERE compra.Id = @idCompra
		
END
GO
/****** Object:  StoredProcedure [dbo].[detallesCompraSinENvio]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DETALLES DE COMPRA SIN ENVIO
CREATE PROCEDURE [dbo].[detallesCompraSinENvio]
@idCompra INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			WHERE compra.Id = @idCompra
		
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarCanton]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ELIMINAR Canton---------------------------
CREATE PROCEDURE [dbo].[eliminarCanton]
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[direccion] where [Id_canton]  = @id) = 0 --no esta en niguna direccion
			UPDATE [dbo].[canton] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarCategoriaProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ELIMINAR CATEGORIAPRODUCTO---------------------------
CREATE PROCEDURE [dbo].[eliminarCategoriaProducto]
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL 
		if (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where Id_Categoria = @id) = 0  
			UPDATE [dbo].[categoriaProducto] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarDireccion]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--ELIMINAR DIRECCION---------------------------
CREATE PROCEDURE [dbo].[eliminarDireccion]
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		--no esta en nigun registro
		if (SELECT COUNT(*) FROM [dbo].[cliente] where [Direccion] = @id) = 0 AND
			(SELECT COUNT(*) FROM [dbo].[empleado] where [Direccion] = @id) = 0 AND
			(SELECT COUNT(*) FROM [dbo].[sucursal] where [Direccion] = @id) = 0 
			UPDATE [dbo].[direccion] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarEmpleado]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ELIMINAR EMPLEADO---------------------------
CREATE PROCEDURE [dbo].[eliminarEmpleado]
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
	
			UPDATE [dbo].[empleado] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarPais]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--ELIMINAR PAIS---------------------------
CREATE PROCEDURE [dbo].[eliminarPais]
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[direccion] where [Id_pais] = @id) = 0 --no esta en niguna direccion
			UPDATE [dbo].[pais] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ELIMINAR PRODUCTO---------------------------
CREATE PROCEDURE [dbo].[eliminarProducto]
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL 
		if (SELECT COUNT(*) FROM [dbo].[compraxProducto] where Id_Producto = @id) = 0  
			UPDATE [dbo].[producto] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarProveedor]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ELIMINAR PROVEEDOR---------------------------
CREATE PROCEDURE [dbo].[eliminarProveedor]
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL 
		if (SELECT COUNT(*) FROM [dbo].[sucursalxProveedor] where [Id_Proveedor] = @id) = 0  AND
			(SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where [Id_Proveedor] = @id) = 0
			UPDATE [dbo].[proveedor] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarProvincia]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminarProvincia]
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[direccion] where [Id_provincia] = @id) = 0 --no esta en niguna direccion
			UPDATE [dbo].[provincia] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarPuesto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--ELIMINAR PUESTO---------------------------
CREATE PROCEDURE [dbo].[eliminarPuesto]
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[empleado] where [Id_Puesto] = @id) = 0  
			UPDATE [dbo].[puesto] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarSucursal]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminarSucursal]
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where [Id_Sucursal] = @id) = 0  AND --no esta en niguna direccion
			(SELECT COUNT(*) FROM [dbo].[empleado] where [Id_Sucursal]  = @id) = 0  AND 
			(SELECT COUNT(*) FROM [dbo].[sucursalxProveedor] where [Id_Sucursal]  = @id) = 0   
			UPDATE [dbo].[sucursal] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[facturacion]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Actualiza el estado de la compra y de los productos vendidos
CREATE PROCEDURE [dbo].[facturacion]
@idCompra INT
AS
BEGIN
	SET NOCOUNT ON; 

	UPDATE [dbo].[compra] SET [Id_estadoCompra] = 2
							WHERE [Id] = @idCompra
							

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			WHERE compra.Id = @idCompra
		

	--poner los productos vendidos
	EXEC venderProductos @id_compra = @idCompra
END
GO
/****** Object:  StoredProcedure [dbo].[gananciasXFecha]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[gananciasXFecha]
@fecha DATE 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT SUM([dbo].[compra].Monto) AS SUMA, (COUNT(*)) AS comprasCompletadas
			FROM [dbo].[compra]
			WHERE compra.Fecha = @fecha AND compra.[Id_estadoCompra] = 2
		
END
GO
/****** Object:  StoredProcedure [dbo].[gananciasXPais]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[gananciasXPais]
@pais INt 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT SUM([dbo].[compra].Monto) AS SUMA, (COUNT(*)) AS comprasCompletadas
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[direccion] ON empleado.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON [dbo].[direccion].Id_pais = [dbo].[pais].Id
			WHERE [dbo].[direccion].Id_pais = @pais AND compra.[Id_estadoCompra] = 2
		
END
GO
/****** Object:  StoredProcedure [dbo].[gananciasXSucursal]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[gananciasXSucursal]
@sucursal INt 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT SUM([dbo].[compra].Monto) AS SUMA, (COUNT(*)) AS comprasCompletadas
			FROM [dbo].[compra]
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			WHERE empleado.Id_Sucursal = @sucursal AND compra.[Id_estadoCompra] = 2
		
END
GO
/****** Object:  StoredProcedure [dbo].[insertarBono]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR BONO
CREATE PROCEDURE [dbo].[insertarBono]
@empleado iNT,
@fecha DATE,
@monto MONEY
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@empleado IS NOT NULL AND @fecha IS NOT NULL AND @monto IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[empleado] where Id = @empleado AND Estado = 1) > 0 --existe el empleado como registro
		INSERT INTO [dbo].[Bono] (Id_Empleado, Fecha, Monto)
			   VALUES (@empleado, @fecha, @monto)
		else
			set @error = 3 --falta llave foranea


	if (@empleado is null OR @fecha IS NULL OR @monto IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarCanton]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR PROVINCIA---------------------------
CREATE PROCEDURE [dbo].[insertarCanton]
@nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @nombre IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[canton] where Nombre = @nombre) = 0 --no se repite el canton
			INSERT INTO [dbo].[canton] (Nombre)
				   VALUES (@nombre)
		else
			set @error = 1

	if @nombre is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarCategoriaProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR PROVEEDOR
CREATE PROCEDURE [dbo].[insertarCategoriaProducto]
@nombre VARCHAR(50),
@impuesto INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	
	if (@nombre IS NOT NULL AND @impuesto IS NOT NULL) --datos no nulos
		if (SELECT COUNT(*) FROM categoriaProducto where Nombre = @nombre) = 0 --datos no repetidos
			INSERT INTO categoriaProducto(Nombre,Impuesto)
				   VALUES (@nombre, @impuesto)
		else
			set @error = 1

	if (@nombre is null OR @impuesto IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarCliente]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Insertar Cliente
CREATE PROCEDURE [dbo].[insertarCliente]
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@identificacion INT,
@direccion INT
AS

BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0 --no hay error

	if (@nombre IS NOT NULL AND @apellido IS NOT NULL AND 
		@direccion IS NOT NULL AND @identificacion IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[cliente] 
				where Doc_Identificacion = @identificacion AND Estado = 1) = 0 --valores no repetidos
			if (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @direccion AND Estado = 1)>0   --existe direccion
					INSERT INTO [dbo].[cliente] (Nombre, Apellido, Doc_Identificacion, Direccion)
						   VALUES (@nombre, @apellido, @identificacion, @direccion)
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@nombre is null OR @apellido IS NULL OR @identificacion IS NULL OR @direccion is null)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarCompra]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--INSERTAR COMPRA
CREATE PROCEDURE [dbo].[insertarCompra]
@fecha DATE,
@cliente INT,
@empleado INT,
@metodoPago INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@fecha IS NOT NULL AND @cliente IS NOT NULL AND @empleado IS NOT NULL AND @metodoPago IS NOT NULL)--valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[cliente] where Id = @cliente AND Estado = 1) > 0 --existe cliente
			AND (SELECT COUNT(*) FROM [dbo].[empleado] where Id = @empleado AND Estado = 1) > 0 --existe empleado
			AND (SELECT COUNT(*) FROM [dbo].[metodoPago] where Id = @metodoPago AND Estado = 1) > 0 --existe metodoPago

			INSERT INTO [dbo].[compra] (Fecha, Monto, Id_metodoPago, Id_Cliente, Id_Empleado)
				   VALUES (@fecha, 0, @metodoPago, @cliente, @empleado)
		else
			set @error = 3 --falta llave foranea


	if (@fecha is null OR @cliente IS NULL OR @empleado IS NULL OR @metodoPago IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarDireccion]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR DIRECCION
CREATE PROCEDURE [dbo].[insertarDireccion]
@provincia INT,
@pais INT,
@canton INT,
@direccionExacta VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@provincia IS NOT NULL AND @pais IS NOT NULL AND @canton IS NOT NULL AND @direccionExacta IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[pais] where Id = @pais AND Estado = 1) > 0  AND	  --existe el pais 
		   (SELECT COUNT(*) FROM [dbo].[provincia] where Id = @provincia AND Estado = 1) > 0  AND	 --existe la provincia 
		   (SELECT COUNT(*) FROM [dbo].[canton] where Id = @canton AND Estado = 1) > 0		 --existe el canton

			INSERT INTO [dbo].[direccion] (Id_pais, Id_provincia, Id_canton, DireccionExacta)
				   VALUES (@pais, @provincia,@canton, @direccionExacta)
		else
			set @error = 3 --falta llave foranea
	else
		set @error = 1 --valor repetido


	if (@pais is null OR @provincia IS NULL OR @canton IS NULL or @direccionExacta is null)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarDireccionCompleta]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR DIRECCION COMPLETA
CREATE PROCEDURE [dbo].[insertarDireccionCompleta]
@provincia VARCHAR(50),
@pais VARCHAR(50),
@canton VARCHAR(50),
@direccionExacta VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@id_pais INT,
	@id_provincia INT,
	@id_canton INT

	SET @error = 2
	if (@provincia IS NULL OR @pais IS NULL OR @canton IS NULL OR @direccionExacta IS NULL) --valores nulos
		RETURN @error

	--obtener id_pais
	EXEC insertarPais @nombre = @pais
	SELECT @id_pais = [Id] FROM [dbo].[pais]
						WHERE [Nombre] = @pais AND Estado = 1

	--obtener id_provincia
	EXEC insertarProvincia @nombre = @provincia
	SELECT @id_provincia = [Id] FROM [dbo].[provincia]
							WHERE [Nombre] = @provincia AND Estado = 1
	--obtener id_canton
	EXEC insertarCanton @nombre = @canton
	SELECT @id_canton = [Id] FROM [dbo].[canton]
							WHERE [Nombre] = @canton AND Estado = 1

	INSERT INTO [dbo].[direccion] (Id_pais, Id_provincia, Id_canton, DireccionExacta)
						   VALUES (@id_pais, @id_provincia, @id_canton, @direccionExacta)

SET @error = 0
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarEmpleado]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR EMPLEADO
CREATE PROCEDURE [dbo].[insertarEmpleado]
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@identificacion INT,
@direccion INT,
@salarioBase MONEY,
@puesto INT,
@sucursal INT


AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0 --no hay error

	if (@nombre IS NOT NULL AND @apellido IS NOT NULL AND 
		@direccion IS NOT NULL AND @salarioBase IS NOT NULL AND @puesto IS NOT NULL AND @sucursal IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[empleado] 
				where Nombre = @nombre AND Apellido = @apellido AND Doc_Identificacion = @identificacion AND Estado = 1) = 0 --valores no repetidos
			if (SELECT COUNT(*) FROM [dbo].[puesto] where Id = @puesto AND Estado = 1)>0 
				AND (SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0  --existe sucursal y puesto como registro
				AND (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @direccion AND Estado = 1) > 0 --existe direccion
					INSERT INTO [dbo].[empleado] (Nombre, Apellido, Doc_Identificacion, Direccion, SalarioBase, Id_Puesto, Id_Sucursal)
						   VALUES (@nombre, @apellido, @identificacion, @direccion, @salarioBase, @puesto, @sucursal)
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@nombre is null OR @apellido IS NULL OR @identificacion IS NULL OR @direccion is null OR @salarioBase IS NULL OR @puesto IS NULL OR @sucursal IS NULL )
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarEnvio]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--INSERTAR ENVIO
CREATE PROCEDURE [dbo].[insertarEnvio]
@compra INT,
@direccion VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@precioCompra MONEY,
	@precioEnvio MONEY

	SET @error = 2 --valores nulos
	if (@compra IS NULL AND @direccion IS NULL)--valores no nulos
		RETURN @error

	SET @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[compra] where Id = @compra AND Estado = 1) = 0 --existe compra
		RETURN @error

	SET @error = 0 --todo bien

	--obtener precioCompra
	SELECT @precioCompra = [Monto] FROM [dbo].[compra]
						WHERE Id = @compra AND Estado = 1

	--set precio del envio
	SET @precioEnvio = (@precioCompra+0.0)*0.1

	INSERT INTO [dbo].[envio] (Direccion, Precio, Id_Compra)
		   VALUES (@direccion, @precioEnvio, @compra)

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarInventarioProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarInventarioProducto]
@nombre VARCHAR(50),
@cantidad INT,
@maximo INT,
@minimo INT,
@sucursal INT,
@categoria INT,
@proveedor INT,
@precioCompra INT,
@porcentaje INT

AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0 --no hay error

	if (@nombre IS NOT NULL AND @proveedor IS NOT NULL AND @cantidad IS NOT NULL AND @precioCompra IS NOT NULL AND @porcentaje IS NOT NULL
		AND @maximo IS NOT NULL AND @minimo IS NOT NULL AND @sucursal IS NOT NULL AND @categoria IS NOT NULL) --valores no nulos
			if (SELECT COUNT(*) FROM [dbo].[categoriaProducto] where Id = @categoria AND Estado = 1)>0  --existe categoria
				AND (SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0  --existe sucursal
				AND (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0  --existe proveedor
			
					INSERT INTO [dbo].[inventarioProducto] (Nombre, Cantidad, CantMaxima, CantMinima, 
										Id_Categoria, Id_Sucursal, Id_Proveedor, PrecioCompra, Porcentaje)
						   VALUES (@nombre, @cantidad, @maximo, @minimo, @categoria, @sucursal, @proveedor, @precioCompra, @porcentaje)
			else
				set @error = 3 --falta llave foranea


	if (@nombre is null OR @proveedor IS NULL OR @cantidad IS NULL OR @maximo is null OR @minimo IS NULL OR 
		@sucursal IS NULL OR @categoria IS NULL OR @precioCompra IS NULL OR @porcentaje IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarLote]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--INSERTAR LOTE
CREATE PROCEDURE [dbo].[insertarLote]
@descripcion VARCHAR(50),
@expiracion DATE,
@produccion DATE
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@descripcion IS NOT NULL AND @expiracion IS NOT NULL AND @produccion IS NOT NULL) --valores no nulos

		INSERT INTO [dbo].[lote] (FechaExpiracion, FechaProduccion, Descripccion)
			   VALUES (@expiracion, @produccion, @descripcion)


	if (@descripcion is null OR @expiracion IS NULL OR @produccion IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarMetodoPago]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR METODO PAGO
CREATE PROCEDURE [dbo].[insertarMetodoPago]
@nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @nombre IS NOT NULL --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[metodoPago] where Nombre = @nombre) = 0 --valores no repetidos
			INSERT INTO [dbo].[metodoPago] (Nombre)
				   VALUES (@nombre)
		else
			set @error = 1

	if @nombre is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarPais]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR PAIS
CREATE PROCEDURE [dbo].[insertarPais]
@nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @nombre IS NOT NULL
		print @error;
		BEGIN TRANSACTION
		if (SELECT COUNT(*) FROM [dbo].[pais] where Nombre = @nombre) = 0
			INSERT INTO [dbo].[pais] (Nombre)
				   VALUES (@nombre)
		else
			set @error = 1

	if @nombre is null 
		set @error = 2

RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarPedido]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR PEDIDO
CREATE PROCEDURE [dbo].[insertarPedido]
@precio MONEY,
@cantidad INT,
@porcentaje INT,
@proveedor INT,
@codigoProductoInventario INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@precio IS NOT NULL AND @cantidad IS NOT NULL AND @porcentaje IS NOT NULL AND 
		@proveedor IS NOT NULL AND @codigoProductoInventario IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0 --existe proveedor
			AND (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where Id = @codigoProductoInventario AND Estado = 1) > 0 --existe producto en inventario
			INSERT INTO [dbo].[pedidoProveedor] (Precio, Porcentaje, Cant, CodigoInventario, Id_Proveedor)
				   VALUES (@precio, @porcentaje, @cantidad, @codigoProductoInventario, @proveedor)
		else
			set @error = 3 --falta llave foranea


	if (@precio is null OR @cantidad IS NULL OR @porcentaje IS NULL OR @proveedor IS NULL OR @codigoProductoInventario IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--en el inventario (codigo)
CREATE PROCEDURE [dbo].[insertarProducto]
@Descuento INT,
@lote INT,
@pedido INT

AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@precioCompra MONEY,
	@porcentaje INT,
	@impuesto INT,
	@inventarioProduc INT,
	@categoria INT,
	@proveedor INT,
	@precioVenta MONEY,
	@nombre VARCHAR (20)
	

	set @error = 2 --nulos
	if ( @Descuento IS NULL OR 
		@lote IS NULL OR @pedido IS NULL) --valores nulos
		RETURN @error
		
	set @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[lote] where Id = @lote AND Estado = 1) = 0						
		OR (SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where Id = @pedido AND Estado = 1) = 0	
		RETURN @error

	SET @error = 0 --no hay error
	--obtener proveedor
	SELECT @proveedor = [Id_Proveedor] FROM [dbo].[pedidoProveedor]
						WHERE Id = @pedido AND Estado = 1
	--obtener precio compra
	SELECT @precioCompra = Precio FROM [dbo].[pedidoProveedor] 
						WHERE Id = @pedido AND Estado = 1
	--obtener porcentaje
	SELECT @porcentaje = Porcentaje FROM [dbo].[pedidoProveedor]
						WHERE Id = @pedido AND Estado = 1
	--obtener Id Inventario
	SELECT @inventarioProduc = CodigoInventario FROM [dbo].[pedidoProveedor]
						WHERE Id = @pedido AND Estado = 1
	--obtener Categoria
	SELECT @categoria = [Id_Categoria] FROM [dbo].[inventarioProducto]
						WHERE Id = @inventarioProduc AND Estado = 1
	--obtener Impuesto
	SELECT @impuesto = [Impuesto] FROM [dbo].[categoriaProducto]
						WHERE Id = @categoria AND Estado = 1
	--obtener nombre
	SELECT @nombre = [Nombre] FROM [dbo].[inventarioProducto]
						WHERE Id = @inventarioProduc AND Estado = 1

	--actualizar inventario
	UPDATE [dbo].[inventarioProducto] SET [Cantidad] = [Cantidad]+1 WHERE [Id] = @inventarioProduc AND Estado = 1

	--calcular precio Venta
	SET @precioVenta = @precioCompra + (@precioCompra * ((@impuesto+0.0)/100.0))+(@precioCompra * ((@porcentaje+0.0)/100.0)) -(@precioCompra * ((@Descuento+0.0)/100.0)) 

	INSERT INTO [dbo].[producto] (Nombre, PrecioVenta, Descuento, Id_Inventario, Id_Lote, Id_Pedido, Id_EstadoProducto)
			   VALUES (@nombre, @precioVenta, @Descuento, @inventarioProduc, @lote, @pedido, 1)


print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarProveedor]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarProveedor]
@nombre VARCHAR(50),
@telefono INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	
	if (@nombre IS NOT NULL AND @telefono IS NOT NULL) --datos no nulos
		if (SELECT COUNT(*) FROM proveedor where Nombre = @nombre) = 0 --datos no repetidos
			INSERT INTO proveedor(Nombre,Telefono)
				   VALUES (@nombre, @telefono)
		else
			set @error = 1

	if (@nombre is null OR @telefono IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarProvincia]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarProvincia]
@nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @nombre IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[provincia] where Nombre = @nombre) = 0 --no se repite la provincia
			INSERT INTO [dbo].[provincia] (Nombre)
				   VALUES (@nombre)
		else
			set @error = 1

	if @nombre is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarPuesto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarPuesto]
@nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @nombre IS NOT NULL
		if (SELECT COUNT(*) FROM puesto where Nombre = @nombre) = 0
			INSERT INTO puesto(Nombre)
				   VALUES (@nombre)
		else
			set @error = 1

	if @nombre is null 
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarSucursal]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR SUCURSAL
CREATE PROCEDURE [dbo].[insertarSucursal]
@nombre VARCHAR(50),
@direccion INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@nombre IS NOT NULL AND  @direccion IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[sucursal] where Nombre = @nombre) = 0 --valores no repetidos
			if (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @direccion AND Estado = 1) > 0	 --existe la direccion
			INSERT INTO [dbo].[sucursal] (Nombre, Direccion)
				   VALUES (@nombre, @direccion)
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@nombre is null  OR @direccion IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertarSucursalxProveedor]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR sucursalxProveedor
CREATE PROCEDURE [dbo].[insertarSucursalxProveedor]
@sucursal INT,
@proveedor INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@sucursal IS NOT NULL AND @proveedor IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[sucursalxProveedor] where Id_Sucursal = @sucursal AND Id_Proveedor = @proveedor AND Estado = 1) = 0 --valores no repetidos
			if ((SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0 --existe la sucursal como registro
				AND (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0) --existe el proveedor
				INSERT INTO [dbo].[sucursalxProveedor] (Id_Sucursal, Id_Proveedor)
					   VALUES (@sucursal, @proveedor)
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@sucursal is null OR @proveedor IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[insertraCompraxProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERtAR compraxProducto
CREATE PROCEDURE [dbo].[insertraCompraxProducto]
@compra INT,
@producto INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@monto MONEY,
	@inventario INT

	SET @error = 2 --valores nulos
	if (@compra IS NULL AND @producto IS NULL)--valores no nulos
		RETURN @error

	SET @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[compra] where Id = @compra AND Estado = 1) = 0 OR --existe compra
		(SELECT COUNT(*) FROM [dbo].[producto] where Id = @producto AND Estado = 1 AND ([Id_EstadoProducto] = 1 or [Id_EstadoProducto] = 4)) = 0 --existe producto
		RETURN @error

	SET @error = 0 --todo bien

	--obtener precioCompra
	SELECT @monto = [PrecioVenta] FROM [dbo].[producto]
						WHERE Id = @producto AND Estado = 1
	--obtener inventario
	SELECT @inventario = [Id_Inventario] FROM [dbo].[producto]
						WHERE Id = @producto AND Estado = 1


	--actualizar montoCompra
	UPDATE [dbo].[compra] SET [Monto] = [Monto]+@monto WHERE [Id] = @compra AND Estado = 1

	--actualizar estadoProducto
	UPDATE [dbo].[producto] SET [Id_EstadoProducto] = 5 WHERE [Id] = @producto AND Estado = 1

	INSERT INTO [dbo].[compraxProducto] (Subtotal, Id_Producto, Id_Compra)
		   VALUES (@monto, @producto, @compra)

print @error;
RETURN @error
END
GO
/****** Object:  StoredProcedure [dbo].[pagarBonosPendientes]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pagarBonosPendientes]
AS
BEGIN
	SET NOCOUNT ON; 

	UPDATE [dbo].[Bono] SET Condicion = 2
			WHERE Condicion = 1
END
GO
/****** Object:  StoredProcedure [dbo].[productosXcompra]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PRODUCTOS X COMPRA
CREATE PROCEDURE [dbo].[productosXcompra]
@id_compra INT
AS
		SELECT  producto.Id, producto.[Nombre], producto.PrecioVenta, producto.Descuento,  
			[dbo].[categoriaProducto].Nombre as Categoria, [dbo].[sucursal].Nombre AS sucursal, lote.FechaExpiracion, lote.FechaProduccion,
			[dbo].[estadoProducto].Descripccion as estado
			FROM [dbo].[producto]
			INNER JOIN [dbo].[compra] ON [dbo].[compra].[Id] = @id_compra
			INNER JOIN [dbo].[compraxProducto] ON [dbo].[compraxProducto].Id_compra = @id_compra
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoProducto] ON  producto.Id_EstadoProducto = [dbo].[estadoProducto].Id
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = [dbo].[lote].Id
			WHERE [dbo].[compraxProducto].Id_compra = @id_compra AND [dbo].[compraxProducto].Id_Producto = producto.Id

GO
/****** Object:  StoredProcedure [dbo].[realizarPedidos]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[realizarPedidos]
AS
DECLARE 
	@idProductoInventario INT,
	@precio_compra INT,
	@proveedor_var INT,
	@cantMax INT,
	@cantidadActual INT,
	@porcentaje INT
DECLARE productos2 CURSOR FOR
	SELECT Id, PrecioCompra, Id_Proveedor, CantMaxima, Cantidad, Porcentaje
	FROM [dbo].[inventarioProducto]
	WHERE [inventarioProducto].[Cantidad] <= [inventarioProducto].[CantMinima]

	--obtener proveedor
	OPEN productos2 --abre el cursor
	FETCH productos2 into @idProductoInventario, @precio_compra, @proveedor_var, @cantMax, @cantidadActual, @porcentaje
	WHILE @@FETCH_STATUS = 0 --mientras tenga datos el cursor va a agarrar uno por uno
	
	BEGIN 
			INSERT INTO [dbo].[pedidoProveedor] (Precio, Cant, Porcentaje, Id_Proveedor, CodigoInventario)
						VALUES (@precio_compra,@cantMax - @cantidadActual, @porcentaje, @proveedor_var, @idProductoInventario)
			FETCH productos2 INTO @idProductoInventario, @precio_compra, @proveedor_var, @cantMax, @cantidadActual, @porcentaje --trae el siguiente dato
	END

	CLOSE productos2 --cerramos cursos
	DEALLOCATE productos2 --limpiamos memoria
GO
/****** Object:  StoredProcedure [dbo].[selectCategoria]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectCategoria]
@categoria INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[categoriaProducto].Id, [dbo].[categoriaProducto].Nombre, [dbo].[categoriaProducto].[Impuesto]
			FROM [dbo].[categoriaProducto]
			WHERE [dbo].[categoriaProducto].Id = @categoria
END
GO
/****** Object:  StoredProcedure [dbo].[selectCliente]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectCliente]
@cliente INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT cliente.[Id], [Doc_Identificacion], cliente.[Nombre], [Apellido], 
			[Direccion].DireccionExacta AS Direccion, [dbo].[pais].Nombre AS Pais, 
			[dbo].[provincia].Nombre AS Provincia, [dbo].[canton].Nombre AS Canton
			FROM [dbo].[cliente]
			INNER JOIN [dbo].[direccion] ON cliente.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON [dbo].[direccion].Id_pais = [dbo].[pais].Id
			INNER JOIN [dbo].[provincia] ON [dbo].[direccion].Id_provincia = [dbo].[provincia].Id
			INNER JOIN [dbo].[canton] ON [dbo].[direccion].Id_canton = [dbo].[canton].Id
			WHERE Cliente.Id = @cliente
END
GO
/****** Object:  StoredProcedure [dbo].[selectEmpleado]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectEmpleado]
@empleado INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT empleado.[Id], [Doc_Identificacion], empleado.[Nombre], empleado.[Apellido], 
			[Direccion].DireccionExacta AS Direccion, [dbo].[pais].Nombre AS Pais, 
			[dbo].[provincia].Nombre AS Provincia, [dbo].[canton].Nombre AS Canton,
			[dbo].[puesto].Nombre as Puesto, empleado.SalarioBase, [dbo].[sucursal].Nombre AS Sucursal
			FROM empleado
			INNER JOIN [dbo].[direccion] ON empleado.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON [dbo].[direccion].Id_pais = [dbo].[pais].Id
			INNER JOIN [dbo].[provincia] ON [dbo].[direccion].Id_provincia = [dbo].[provincia].Id
			INNER JOIN [dbo].[canton] ON [dbo].[direccion].Id_canton = [dbo].[canton].Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			WHERE empleado.Id = @empleado
END
GO
/****** Object:  StoredProcedure [dbo].[selectInventario]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectInventario]
@inventario INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  [inventarioProducto].Id, [inventarioProducto].[Nombre], [inventarioProducto].Cantidad, [inventarioProducto].CantMaxima,
			[inventarioProducto].CantMinima, [categoriaProducto].Nombre as Categoria
			FROM [inventarioProducto] 
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			WHERE [inventarioProducto].Id = @inventario		
END
GO
/****** Object:  StoredProcedure [dbo].[selectProducto]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR PRODUCTO
CREATE PROCEDURE [dbo].[selectProducto]
@producto INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  producto.Id, producto.[Nombre], producto.PrecioVenta, producto.Descuento,  
			[dbo].[categoriaProducto].Nombre as Categoria, [dbo].[sucursal].Nombre AS sucursal, lote.FechaExpiracion, 
			lote.FechaProduccion, [dbo].[estadoProducto].Descripccion As Estado
			FROM [dbo].[producto]
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = [dbo].[lote].Id
			INNER JOIN [dbo].[estadoProducto] ON producto.Id_EstadoProducto = [dbo].[estadoProducto].Id
			WHERE producto.Id = @producto
END
GO
/****** Object:  StoredProcedure [dbo].[selectProveedor]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectProveedor]
@proveedor INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [Id],[Nombre],[Telefono]
			FROM [dbo].[proveedor]
			WHERE Id = @proveedor
END
GO
/****** Object:  StoredProcedure [dbo].[selectSucursal]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectSucursal]
@sucursal INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT sucursal.[Id], sucursal.[Nombre], 
			[Direccion].DireccionExacta AS Direccion, [dbo].[pais].Nombre AS Pais, 
			[dbo].[provincia].Nombre AS Provincia, [dbo].[canton].Nombre AS Canton
			FROM sucursal
			INNER JOIN [dbo].[direccion] ON sucursal.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON [dbo].[direccion].Id_pais = [dbo].[pais].Id
			INNER JOIN [dbo].[provincia] ON [dbo].[direccion].Id_provincia = [dbo].[provincia].Id
			INNER JOIN [dbo].[canton] ON [dbo].[direccion].Id_canton = [dbo].[canton].Id
			WHERE sucursal.Id = @sucursal
END
GO
/****** Object:  StoredProcedure [dbo].[venderProductos]    Script Date: 11/21/2021 10:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[venderProductos]
@id_compra INT
AS
DECLARE 
	@idCompraxProducto INT,
	@idProducto INT,
	@inventario INT
DECLARE ventas CURSOR FOR
	SELECT [dbo].[compraxProducto].Id, [dbo].[compraxProducto].Id_Producto
	FROM [dbo].[compraxProducto]
	WHERE [dbo].[compraxProducto].Id_compra = @id_compra

	OPEN ventas --abre el cursor
	FETCH ventas into @idCompraxProducto, @idProducto
	WHILE @@FETCH_STATUS = 0 --mientras tenga datos el cursor va a agarrar uno por uno
	
	BEGIN 
			SELECT @inventario = [Id_Inventario] FROM [dbo].[producto]
									WHERE [dbo].[producto].Id = @idProducto
			UPDATE [dbo].[producto] SET [Id_EstadoProducto] = 2
								      WHERE [Id] = @idProducto 
			UPDATE [dbo].[inventarioProducto] SET Cantidad = Cantidad-1
									WHERE [dbo].[inventarioProducto].Id = @inventario

			FETCH ventas INTO @idCompraxProducto, @idProducto  --trae el siguiente dato
	END

	CLOSE ventas --cerramos cursos
	DEALLOCATE ventas --limpiamos memoria
GO
USE [master]
GO
ALTER DATABASE [Supermercado] SET  READ_WRITE 
GO
