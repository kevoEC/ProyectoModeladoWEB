USE [master]
GO
/****** Object:  Database [DBCARRITO]    Script Date: 7/11/2022 8:59:19 ******/
CREATE DATABASE [DBCARRITO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBCARRITO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBCARRITO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBCARRITO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBCARRITO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBCARRITO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBCARRITO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBCARRITO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBCARRITO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBCARRITO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBCARRITO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBCARRITO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBCARRITO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBCARRITO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBCARRITO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBCARRITO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBCARRITO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBCARRITO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBCARRITO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBCARRITO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBCARRITO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBCARRITO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBCARRITO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBCARRITO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBCARRITO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBCARRITO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBCARRITO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBCARRITO] SET  MULTI_USER 
GO
ALTER DATABASE [DBCARRITO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBCARRITO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBCARRITO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBCARRITO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBCARRITO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBCARRITO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBCARRITO] SET QUERY_STORE = OFF
GO
USE [DBCARRITO]
GO
/****** Object:  Table [dbo].[CARRITO]    Script Date: 7/11/2022 8:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITO](
	[IdCarrito] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CIUDAD]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CIUDAD](
	[IdCiudad] [varchar](4) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdProvincia] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](150) NULL,
	[Restablecer] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VENTA](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[IdMarca] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PARROQUIA]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PARROQUIA](
	[IdParroquia] [varchar](6) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdCiudad] [varchar](5) NOT NULL,
	[IdProvincia] [varchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NULL,
	[Descripcion] [varchar](800) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[RutaImagen] [varchar](100) NULL,
	[NombreImagen] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[IdProvincia] [varchar](2) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](150) NULL,
	[Restablecer] [bit] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[TotalProducto] [int] NULL,
	[MontoTotal] [decimal](10, 2) NULL,
	[Contacto] [varchar](50) NULL,
	[IdDistrito] [varchar](10) NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](500) NULL,
	[IdTransaccion] [varchar](50) NULL,
	[FechaVenta] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 

INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'Laptops', 1, CAST(N'2022-11-05T16:21:58.027' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'Consolas', 1, CAST(N'2022-11-05T16:21:58.027' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'Partes para Armados de PC', 1, CAST(N'2022-11-05T16:21:58.027' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'PC Escritorio completo', 1, CAST(N'2022-11-05T16:21:58.027' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (5, N'Escritorios Gamers', 1, CAST(N'2022-11-05T16:21:58.027' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (6, N'Juegos', 1, CAST(N'2022-11-05T16:21:58.027' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (9, N'test', 0, CAST(N'2022-11-05T16:27:40.833' AS DateTime))
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0101', N'Ibarra', N'01')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0102', N'Otavalo', N'01')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0103', N'Atuntaqui', N'01')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0104', N'Cotacachi', N'01')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0201', N'Aloag', N'02')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0202', N'Cayambe', N'02')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0203', N'Machachi', N'02')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0204', N'Quito', N'02')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0205', N'Tabacundo', N'02')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0206', N'San Miguel De los Bancos', N'02')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0207', N'Sangolquí', N'02')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0301', N'Balao', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0302', N'Balzar', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0303', N'Colimes', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0304', N'Daule', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0305', N'Durán', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0306', N'El Empalme', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0307', N'El Triunfo', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0308', N'Guayaquil', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0309', N'Milagro', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0310', N'Naranjal', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0311', N'Naranjito', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0312', N'Palestina', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0313', N'Pedro Carbo', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0314', N'Playas', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0315', N'Samborondón', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0316', N'San Jacinto De Yaguachi', N'03')
INSERT [dbo].[CIUDAD] ([IdCiudad], [Descripcion], [IdProvincia]) VALUES (N'0317', N'Santa Lucía', N'03')
GO
SET IDENTITY_INSERT [dbo].[MARCA] ON 

INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'AMD', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'NVIDIA', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'ACER', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'HP', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (5, N'ASUS', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (6, N'DELL', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (7, N'MAC', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (8, N'INTEL', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (9, N'SONY', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (10, N'NINTENDO', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (11, N'MICROSOFT', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (12, N'TOSHIBA', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (13, N'GYGABYTE', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (14, N'MSI', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (15, N'KINGSTON', 1, CAST(N'2022-11-05T16:22:03.763' AS DateTime))
INSERT [dbo].[MARCA] ([IdMarca], [Descripcion], [Activo], [FechaRegistro]) VALUES (16, N'MARCA TEST', 1, CAST(N'2022-11-05T17:05:13.707' AS DateTime))
SET IDENTITY_INSERT [dbo].[MARCA] OFF
GO
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010101', N'El sagrario', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010102', N'San Francisco', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010103', N'Caranqui', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010104', N'Alpachaca', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010105', N'Priorato', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010106', N'Ambuqui', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010107', N'Angochagua', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010108', N'Carolina', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010109', N'La esperanza', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010110', N'Lita', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010111', N'Salinas', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010112', N'San Antonio', N'0101', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010201', N'Eugenio Espejo', N'0102', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010202', N'San Pablo del Lago', N'0102', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010203', N'González Suárez', N'0102', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010204', N'San Rafael', N'0102', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010205', N'San Juan de Ilumán', N'0102', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010206', N'Dr. Miguel Egas Cabezas', N'0102', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010207', N'San José de Quichinche', N'0102', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010208', N'San Pedro de Pataquí', N'0102', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010209', N'Selva Alegre.', N'0102', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010210', N'Jordán', N'0102', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010211', N'San Luis', N'0102', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010301', N'Atuntaqui', N'0103', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010302', N'San Roque', N'0103', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010303', N'Chaltura', N'0103', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010304', N'Natabuela', N'0103', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010305', N'Imbaya', N'0103', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010401', N'Apuela', N'0104', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010402', N'García Moreno', N'0104', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010403', N'Peñaherrrera', N'0104', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010404', N'6 de Julio de Cuellaje', N'0104', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010405', N'Vacas Galindo', N'0104', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'010406', N'Plaza Gutiérrez', N'0104', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'020101', N'Aloag', N'0201', N'02')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'020201', N'Cayambe', N'0202', N'02')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'020301', N'Machachi', N'0203', N'01')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'020401', N'Quito', N'0204', N'02')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'020501', N'Tabacundo', N'0205', N'02')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'020601', N'San Miguel De los Bancos', N'0206', N'02')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'020701', N'Sangolquí', N'0207', N'02')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'030101', N'Balao', N'0301', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'030201', N'Balzar', N'0302', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'030301', N'Colimes', N'0303', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'030401', N'Daule', N'0304', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'030501', N'Durán', N'0305', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'030601', N'El Empalme', N'0306', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'030701', N'El Triunfo', N'0307', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'030801', N'Guayaquil', N'0308', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'030901', N'Milagro', N'0309', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'031001', N'Naranjal', N'0310', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'031101', N'Naranjito', N'0311', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'031201', N'Palestina', N'0312', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'031301', N'Pedro Carbo', N'0313', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'031401', N'Playas', N'0314', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'031501', N'Samborondón', N'0315', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'031601', N'San Jacinto De Yaguachi', N'0316', N'03')
INSERT [dbo].[PARROQUIA] ([IdParroquia], [Descripcion], [IdCiudad], [IdProvincia]) VALUES (N'031701', N'Santa Lucía', N'0317', N'03')
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 

INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [NombreImagen], [Activo], [FechaRegistro]) VALUES (1, N'ASUS Laptop Gaming ROG', N'Adquiere tu computadora portátil con la prestigiosa marca Asus y su modelo GV301QE211ZG, el cual cue', 5, 1, CAST(2500.00 AS Decimal(10, 2)), 20, N'C:\Users\rosco\source\repos\Prog4\ProyectoProgramacion4\FOTOS_CARRITO', N'1.jpg', 1, CAST(N'2022-11-06T21:11:19.900' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [NombreImagen], [Activo], [FechaRegistro]) VALUES (2, N'PlayStation5', N'2 teras', 9, 2, CAST(800.00 AS Decimal(10, 2)), 200, N'C:\Users\rosco\source\repos\Prog4\ProyectoProgramacion4\FOTOS_CARRITO', N'2.jpg', 1, CAST(N'2022-11-06T21:16:45.573' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [NombreImagen], [Activo], [FechaRegistro]) VALUES (3, N'Nintendo Switch', N'1 tera', 10, 2, CAST(300.00 AS Decimal(10, 2)), 100, N'C:\Users\rosco\source\repos\Prog4\ProyectoProgramacion4\FOTOS_CARRITO', N'3.jpg', 1, CAST(N'2022-11-06T21:26:08.397' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [NombreImagen], [Activo], [FechaRegistro]) VALUES (4, N'XBOX ONE', N'1 TERA', 11, 2, CAST(450.00 AS Decimal(10, 2)), 20, N'C:\Users\rosco\source\repos\Prog4\ProyectoProgramacion4\FOTOS_CARRITO', N'4.png', 1, CAST(N'2022-11-06T21:29:45.507' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [NombreImagen], [Activo], [FechaRegistro]) VALUES (5, N'test1', N'a', 16, 9, CAST(100.00 AS Decimal(10, 2)), 1, N'C:\Users\rosco\source\repos\Prog4\ProyectoProgramacion4\FOTOS_CARRITO', N'5.png', 0, CAST(N'2022-11-06T21:36:40.387' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [NombreImagen], [Activo], [FechaRegistro]) VALUES (6, N'Arduino', N'2', 16, 9, CAST(100.00 AS Decimal(10, 2)), 10, N'C:\Users\rosco\source\repos\Prog4\ProyectoProgramacion4\FOTOS_CARRITO', N'6.png', 0, CAST(N'2022-11-06T21:42:23.277' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Descripcion], [IdMarca], [IdCategoria], [Precio], [Stock], [RutaImagen], [NombreImagen], [Activo], [FechaRegistro]) VALUES (7, N'test2', N'test', 16, 9, CAST(2.00 AS Decimal(10, 2)), 10, N'C:\Users\rosco\source\repos\Prog4\ProyectoProgramacion4\FOTOS_CARRITO', N'7.png', 0, CAST(N'2022-11-06T21:45:06.620' AS DateTime))
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion]) VALUES (N'01', N'Imbabura')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion]) VALUES (N'02', N'Pichincha')
INSERT [dbo].[PROVINCIA] ([IdProvincia], [Descripcion]) VALUES (N'03', N'Guayas')
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Restablecer], [Activo], [FechaRegistro]) VALUES (1, N'test nombre', N'test apellido', N'test@example.com', N'ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae', 1, 1, CAST(N'2022-11-05T16:21:52.503' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Restablecer], [Activo], [FechaRegistro]) VALUES (2, N'test nombre2', N'test apellido2', N'test2@example.com', N'ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae', 1, 0, CAST(N'2022-11-05T16:21:54.987' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Restablecer], [Activo], [FechaRegistro]) VALUES (3, N'Kevin', N'Rosero', N'kevin.rosero@udla.edu.ec', N'8690148ca31d8db17c6cbfd1e99f70afbd83f22481073ea90e5e0199a85fc005', 0, 1, CAST(N'2022-11-05T16:24:00.740' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Restablecer], [Activo], [FechaRegistro]) VALUES (4, N'Emilia', N'Morejon', N'emilia.morejon.cardenas@udla.edu.ec', N'4c9ee2f65c732fe3d4dd74a71f38ef6481ca0d2c6d446eb796cd7a498473ddf8', 1, 1, CAST(N'2022-11-06T23:22:24.687' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Restablecer], [Activo], [FechaRegistro]) VALUES (5, N'Jhonny', N'Montero', N'jhonnymontero88@gmail.com', N'64ec1a0260e1ffea6c8e4e07949616a0b1b98615aacd57a1e15c1e88d0f02e8e', 1, 0, CAST(N'2022-11-06T23:32:49.360' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Clave], [Restablecer], [Activo], [FechaRegistro]) VALUES (7, N'Kevin', N'Rosero', N'rosco_1997_72@hotmail.com', N'a7d3c2df73838229f99b8a6e3f4b08390feb9caf4b5c54a657c7a9307121b501', 1, 1, CAST(N'2022-11-07T08:42:36.697' AS DateTime))
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ((0)) FOR [Restablecer]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MARCA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Restablecer]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[VENTA] ADD  DEFAULT (getdate()) FOR [FechaVenta]
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
ALTER TABLE [dbo].[CARRITO]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[VENTA] ([IdVenta])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdMarca])
REFERENCES [dbo].[MARCA] ([IdMarca])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarCategoria]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EditarCategoria](
@IdCategoria int,
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion and IdCategoria != @IdCategoria)
		begin
			update top (1) CATEGORIA set
			Descripcion = @Descripcion,
			Activo = @Activo
			where IdCategoria = @IdCategoria


			SET @Resultado = 1
		end
		else
			set @Mensaje = 'La categoria ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarMarca]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EditarMarca](
@IdMarca int,
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion and IdMarca != @IdMarca)
		begin
			update top (1) MARCA set
			Descripcion = @Descripcion,
			Activo = @Activo
			where IdMarca = @IdMarca


			SET @Resultado = 1
		end
		else
			set @Mensaje = 'La marca ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarProducto]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EditarProducto](
@IdProducto int,
@Nombre varchar(100),
@Descripcion varchar(100),
@IdMarca varchar(100),
@IdCategoria varchar(100),
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Nombre = @Nombre and IdProducto != @IdProducto )
		begin
			update PRODUCTO set
			Nombre = @Nombre,
			Descripcion = @Descripcion,
			IdMarca =@IdMarca,
			IdCategoria = @IdCategoria,
			Precio = @Precio,
			Stock = @Stock,
			Activo = @Activo
			where IdProducto = @IdProducto


			SET @Resultado = 1
		end
		else
			set @Mensaje = 'El producto  ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarUsuario]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EditarUsuario](
@IdUsuario varchar(100),
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo and IdUsuario != @IdUsuario)
		begin
			update top (1) USUARIO set
			Nombres = @Nombres,
			Apellidos = @Apellidos,
			Correo = @Correo,
			Activo = @Activo
			where IdUsuario = @IdUsuario


			SET @Resultado = 1
		end
		else
			set @Mensaje = 'El correo del usuario ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarCategoria]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarCategoria](
@IdCategoria int,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (select * from PRODUCTO p
	inner join CATEGORIA c on c.IdCategoria = p.IdCategoria
	where p.IdCategoria = @IdCategoria)
	begin
		delete top (1) from CATEGORIA where IdCategoria = @IdCategoria
		SET @Resultado = 1
	end
	else
		set @Mensaje = 'La categoria ya se encuentra relacionada a un producto'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarMarca]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarMarca](
@IdMarca int,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (select * from PRODUCTO p
	inner join MARCA m on m.IdMarca = p.IdMarca
	where p.IdMarca = @IdMarca)
	begin
		delete top (1) from MARCA where IdMarca = @IdMarca
		SET @Resultado = 1
	end
	else
		set @Mensaje = 'La marca ya se encuentra relacionada a un producto'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarProducto]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_EliminarProducto](
@IdProducto int,
@Mensaje varchar(500) output,
@Resultado bit output
)
as
begin
	SET @Resultado = 0
	IF NOT EXISTS (select * from DETALLE_VENTA dv
	inner join PRODUCTO p on p.IdProducto = dv.IdProducto
	where p.IdProducto = @IdProducto)
	begin
		delete top (1) from PRODUCTO where IdProducto = @IdProducto
		SET @Resultado = 1
	end
	else
		set @Mensaje = 'El producto ya se encuentra relacionado a una venta'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCategoria]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarCategoria](
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)
		begin
			insert into CATEGORIA(Descripcion, Activo) values
			(@Descripcion,@Activo)

			SET @Resultado = SCOPE_IDENTITY()
		end
		else
			set @Mensaje = 'La categoria ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarMarca]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarMarca](
@Descripcion varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM MARCA WHERE Descripcion = @Descripcion)
		begin
			insert into MARCA(Descripcion, Activo) values
			(@Descripcion,@Activo)

			SET @Resultado = SCOPE_IDENTITY()
		end
		else
			set @Mensaje = 'La marca ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarProducto]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarProducto](
@Nombre varchar(100),
@Descripcion varchar(100),
@IdMarca varchar(100),
@IdCategoria varchar(100),
@Precio decimal(10,2),
@Stock int,
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Nombre = @Nombre)
		begin
			insert into PRODUCTO(Nombre,Descripcion,IdMarca,IdCategoria,Precio,Stock,Activo) values
			(@Nombre,@Descripcion,@IdMarca,@IdCategoria,@Precio,@Stock,@Activo)

			SET @Resultado = SCOPE_IDENTITY()
		end
		else
			set @Mensaje = 'El producto ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarUsuario]    Script Date: 7/11/2022 8:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_RegistrarUsuario](
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Clave varchar(100),
@Activo bit,
@Mensaje varchar(500) output,
@Resultado int output
)
as
begin
		SET @Resultado = 0
		IF NOT EXISTS (SELECT * FROM USUARIO WHERE Correo = @Correo)
		begin
			insert into USUARIO(Nombres,Apellidos,Correo,Clave,Activo) values
			(@Nombres,@Apellidos,@Correo,@Clave,@Activo)

			SET @Resultado = SCOPE_IDENTITY()
		end
		else
			set @Mensaje = 'El correo del usuario ya existe'
end
GO
USE [master]
GO
ALTER DATABASE [DBCARRITO] SET  READ_WRITE 
GO

