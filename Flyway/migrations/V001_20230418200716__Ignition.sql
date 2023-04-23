USE [esencialverde]
GO
ALTER DATABASE [esencialverde] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [esencialverde].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [esencialverde] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [esencialverde] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [esencialverde] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [esencialverde] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [esencialverde] SET ARITHABORT OFF 
GO
ALTER DATABASE [esencialverde] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [esencialverde] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [esencialverde] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [esencialverde] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [esencialverde] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [esencialverde] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [esencialverde] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [esencialverde] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [esencialverde] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [esencialverde] SET  DISABLE_BROKER 
GO
ALTER DATABASE [esencialverde] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [esencialverde] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [esencialverde] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [esencialverde] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [esencialverde] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [esencialverde] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [esencialverde] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [esencialverde] SET RECOVERY FULL 
GO
ALTER DATABASE [esencialverde] SET  MULTI_USER 
GO
ALTER DATABASE [esencialverde] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [esencialverde] SET DB_CHAINING OFF 
GO
ALTER DATABASE [esencialverde] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [esencialverde] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [esencialverde] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [esencialverde] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'esencialverde', N'ON'
GO
ALTER DATABASE [esencialverde] SET QUERY_STORE = ON
GO
ALTER DATABASE [esencialverde] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [esencialverde]
GO
/****** Object:  Table [dbo].[actoresContratoProd]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actoresContratoProd](
	[prodContratoId] [int] NOT NULL,
	[actorId] [int] IDENTITY(1,1) NOT NULL,
	[objectTypeId] [tinyint] NULL,
	[genericId] [int] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_actoresContratoProd] PRIMARY KEY CLUSTERED 
(
	[actorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[areasPorRecolector]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[areasPorRecolector](
	[recolectorId] [int] NOT NULL,
	[areaRecolectorId] [int] NULL,
	[objectTypeId] [tinyint] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[beneficiariosPorContaminante]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[beneficiariosPorContaminante](
	[contaContratoId] [int] NOT NULL,
	[porcentaje] [decimal](5, 2) NOT NULL,
	[monedaId] [int] NOT NULL,
	[validFrom] [datetime2](7) NULL,
	[validTo] [datetime2](7) NULL,
	[benefId] [int] NOT NULL,
	[objectType] [tinyint] NULL,
	[areaEfectoId] [int] NULL,
	[productorId] [int] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_beneficiariosPorContaminante] PRIMARY KEY CLUSTERED 
(
	[benefId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[camiones]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[camiones](
	[camionId] [int] IDENTITY(1,1) NOT NULL,
	[recolectorId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[capacidadMaxima] [smallint] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_camiones] PRIMARY KEY CLUSTERED 
(
	[camionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[canales]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[canales](
	[canalId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](15) NULL,
	[tipoEntidadId] [smallint] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_canales] PRIMARY KEY CLUSTERED 
(
	[canalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[certificacionesCamion]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certificacionesCamion](
	[camionId] [int] NOT NULL,
	[desechoId] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudades]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudades](
	[ciudadId] [int] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NOT NULL,
	[estadoId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_ciudades] PRIMARY KEY CLUSTERED 
(
	[ciudadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clasificacionesDesechos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clasificacionesDesechos](
	[desClasificacionId] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NULL,
	[enabled] [bit] NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_clasificacionesResiduos] PRIMARY KEY CLUSTERED 
(
	[desClasificacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactos](
	[contactoId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NOT NULL,
	[apellido1] [nchar](20) NOT NULL,
	[apellido2] [nchar](20) NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_contactos] PRIMARY KEY CLUSTERED 
(
	[contactoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosCanales]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosCanales](
	[contactoId] [int] NOT NULL,
	[canalId] [int] NOT NULL,
	[enabled] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosContratos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosContratos](
	[prodContratoId] [int] NULL,
	[contactoId] [int] NULL,
	[enabled] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosEV]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosEV](
	[contactoId] [int] NOT NULL,
	[plantaId] [int] NULL,
	[enabled] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosParticipantes]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosParticipantes](
	[contactoId] [int] NOT NULL,
	[participanteId] [int] NOT NULL,
	[enabled] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosProductores]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosProductores](
	[contactoId] [int] NOT NULL,
	[productorId] [int] NOT NULL,
	[enabled] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosRecolectores]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosRecolectores](
	[contactoId] [int] NOT NULL,
	[recolectorId] [int] NOT NULL,
	[chofer] [bit] NOT NULL,
	[enabled] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosValores]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosValores](
	[contactoId] [int] NOT NULL,
	[contactTypeId] [tinyint] NULL,
	[valor] [nchar](30) NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactTypes]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactTypes](
	[contactTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_contactTypes] PRIMARY KEY CLUSTERED 
(
	[contactTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contratosEmpContaminantes]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contratosEmpContaminantes](
	[contaContratoId] [int] IDENTITY(1,1) NOT NULL,
	[productorId] [int] NOT NULL,
	[montoPorExceso] [money] NOT NULL,
	[periodicidad] [smallint] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
	[fechaFiniquitacion] [datetime] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_contratosEmpContaminantes] PRIMARY KEY CLUSTERED 
(
	[contaContratoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contratosProduccion]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contratosProduccion](
	[prodContratoId] [int] IDENTITY(1,1) NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
	[fechaFiniquitacion] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL,
	[periodicidad] [smallint] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_contratos] PRIMARY KEY CLUSTERED 
(
	[prodContratoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contratosRecoleccion]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contratosRecoleccion](
	[recContratoId] [int] IDENTITY(1,1) NOT NULL,
	[productorId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[recStartDate] [datetime] NOT NULL,
	[recEndDate] [datetime] NOT NULL,
	[contEstadoId] [tinyint] NOT NULL,
	[areaEfectoId] [int] NULL,
	[objectTypeId] [tinyint] NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_cicloRecoleccion] PRIMARY KEY CLUSTERED 
(
	[recContratoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[costosPasoRecoleccion]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[costosPasoRecoleccion](
	[recPasoId] [int] NOT NULL,
	[costoRec] [money] NOT NULL,
	[recolectorId] [int] NOT NULL,
	[comisionEV] [money] NOT NULL,
	[costoTrato] [money] NOT NULL,
	[areaEfectoId] [int] NOT NULL,
	[objectTypeId] [tinyint] NOT NULL,
	[monedaId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[costosTratamiento]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[costosTratamiento](
	[costoTratoId] [int] IDENTITY(1,1) NOT NULL,
	[precioKg] [money] NOT NULL,
	[areaEfectoId] [int] NOT NULL,
	[objectTypeId] [tinyint] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[monedaId] [int] NOT NULL,
	[productorId] [int] NULL,
	[tratoId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_costosTratamientoContrato] PRIMARY KEY CLUSTERED 
(
	[costoTratoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[costosTratoPorContrato]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[costosTratoPorContrato](
	[prodContratoId] [int] NOT NULL,
	[costoTratoId] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[descuentosPorItem]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[descuentosPorItem](
	[itemRecId] [bigint] NOT NULL,
	[saldoId] [int] NOT NULL,
	[montoUsado] [money] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechos](
	[desechoId] [int] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NULL,
	[enabled] [bit] NULL,
	[desTipoId] [smallint] NULL,
	[desClasificacionId] [tinyint] NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_desechos] PRIMARY KEY CLUSTERED 
(
	[desechoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechosLoteLogs]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechosLoteLogs](
	[loteId] [int] NOT NULL,
	[desPlantLogId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechosPlantasLogs]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechosPlantasLogs](
	[desPlantLogId] [int] IDENTITY(1,1) NOT NULL,
	[plantaId] [int] NOT NULL,
	[desechoId] [int] NOT NULL,
	[cantidad] [decimal](10, 2) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[viajeId] [int] NULL,
	[costoTrato] [money] NOT NULL,
	[enabled] [bit] NOT NULL,
	[costoTratoId] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_desechosPlantasLogs] PRIMARY KEY CLUSTERED 
(
	[desPlantLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechosPorPaso]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechosPorPaso](
	[recPasoId] [int] NOT NULL,
	[maxEsperado] [decimal](10, 2) NOT NULL,
	[recoger] [bit] NOT NULL,
	[minEsperado] [decimal](10, 2) NOT NULL,
	[costoTratoId] [int] NULL,
	[desechoId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechosPorProducto]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechosPorProducto](
	[productoId] [int] NULL,
	[desechoId] [int] NOT NULL,
	[cantidad] [decimal](10, 2) NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechosPorRecipiente]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechosPorRecipiente](
	[recipienteId] [int] NOT NULL,
	[desechoId] [int] NOT NULL,
	[desechoReciId] [int] IDENTITY(1,1) NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_desechosPorRecipiente] PRIMARY KEY CLUSTERED 
(
	[desechoReciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechosPorTratamiento]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechosPorTratamiento](
	[tratoId] [int] NOT NULL,
	[desechoId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechosStatuses]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechosStatuses](
	[desStatusId] [tinyint] IDENTITY(1,1) NOT NULL,
	[desStatusName] [nchar](12) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_desechosStatuses] PRIMARY KEY CLUSTERED 
(
	[desStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechosStatusLogs]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechosStatusLogs](
	[desStatusLogId] [int] IDENTITY(1,1) NOT NULL,
	[desPlantLogId] [int] NOT NULL,
	[desStatusId] [tinyint] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_desechosStatusLogs] PRIMARY KEY CLUSTERED 
(
	[desStatusLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deterioriosReciLogs]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deterioriosReciLogs](
	[deterioroReciLogId] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[plantaId] [int] NOT NULL,
	[recipienteId] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[deterioroId] [tinyint] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_deterioriosReciLogs] PRIMARY KEY CLUSTERED 
(
	[deterioroReciLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deterioroRecipientes]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deterioroRecipientes](
	[deterioroId] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_deterioroRecipientes] PRIMARY KEY CLUSTERED 
(
	[deterioroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deteriorosReciPlantas]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deteriorosReciPlantas](
	[plantaId] [int] NOT NULL,
	[recipienteId] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[validFrom] [datetime2](7) NOT NULL,
	[validTo] [datetime2](7) NOT NULL,
	[deterioroId] [tinyint] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direcciones]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direcciones](
	[direccionId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](50) NOT NULL,
	[ciudadId] [int] NOT NULL,
	[geolocation] [geography] NOT NULL,
	[detalle1] [nchar](100) NULL,
	[detalle2] [nchar](100) NULL,
	[zipcode] [nchar](15) NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_direcciones] PRIMARY KEY CLUSTERED 
(
	[direccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[elementosPorRegion]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[elementosPorRegion](
	[regionId] [int] NOT NULL,
	[paisId] [int] NULL,
	[estadoId] [int] NULL,
	[ciudadId] [int] NULL,
	[direccionId] [int] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados](
	[estadoId] [int] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[paisId] [int] NOT NULL,
 CONSTRAINT [PK_estados] PRIMARY KEY CLUSTERED 
(
	[estadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadosContratos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadosContratos](
	[contEstadoId] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_estadosContratos] PRIMARY KEY CLUSTERED 
(
	[contEstadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadosEventos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadosEventos](
	[estadoEventoId] [int] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_estadosEventos] PRIMARY KEY CLUSTERED 
(
	[estadoEventoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadosReciLogs]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadosReciLogs](
	[estadoReciLogId] [int] IDENTITY(1,1) NOT NULL,
	[plantaId] [int] NOT NULL,
	[recipienteId] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[estadoReciId] [tinyint] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_estadosReciLogs] PRIMARY KEY CLUSTERED 
(
	[estadoReciLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadosRecipientes]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadosRecipientes](
	[estadoReciId] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_estadosRecipientes] PRIMARY KEY CLUSTERED 
(
	[estadoReciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadosReciPlantas]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadosReciPlantas](
	[plantaId] [int] NOT NULL,
	[recipienteId] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[validFrom] [datetime2](7) NOT NULL,
	[validTo] [datetime2](7) NOT NULL,
	[estadoReciId] [tinyint] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventLogs]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventLogs](
	[eventLogId] [int] IDENTITY(1,1) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[username] [nchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[descripcion] [nchar](250) NOT NULL,
	[referenceId1] [bigint] NOT NULL,
	[referenceId2] [bigint] NOT NULL,
	[value1] [nchar](60) NOT NULL,
	[values2] [nchar](60) NOT NULL,
	[ubicacion] [geography] NOT NULL,
	[levelId] [tinyint] NOT NULL,
	[eventTypeId] [int] NOT NULL,
	[objectTypeId] [tinyint] NOT NULL,
	[sourceId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[computer] [varchar](20) NOT NULL,
 CONSTRAINT [PK_eventLogs] PRIMARY KEY CLUSTERED 
(
	[eventLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventosPorViaje]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventosPorViaje](
	[reciEventoId] [int] IDENTITY(1,1) NOT NULL,
	[reciMoveId] [int] NOT NULL,
	[reciTipoEventoId] [tinyint] NOT NULL,
	[estadoEventoId] [int] NULL,
	[fecha] [datetime] NOT NULL,
	[contactoId] [int] NOT NULL,
	[validFrom] [datetime2](7) NOT NULL,
	[validTo] [datetime2](7) NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_eventosPorViaje] PRIMARY KEY CLUSTERED 
(
	[reciEventoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventTypes]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventTypes](
	[eventTypeId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_eventTypes] PRIMARY KEY CLUSTERED 
(
	[eventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturas]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturas](
	[facturaId] [bigint] IDENTITY(1,1) NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[facturaStatusId] [tinyint] NOT NULL,
	[descripcion] [nchar](50) NULL,
 CONSTRAINT [PK_facturas] PRIMARY KEY CLUSTERED 
(
	[facturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[facturaStatuses]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturaStatuses](
	[facturaStatusId] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_pagoStatuses] PRIMARY KEY CLUSTERED 
(
	[facturaStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[horariosRecoleccion]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horariosRecoleccion](
	[recHorarioId] [int] IDENTITY(1,1) NOT NULL,
	[recContratoId] [int] NULL,
	[recPeriodicidad] [smallint] NULL,
	[recStartDate] [datetime] NULL,
	[recEndDate] [datetime] NULL,
	[contEstadoId] [tinyint] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_horariosRecoleccion] PRIMARY KEY CLUSTERED 
(
	[recHorarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idiomas]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idiomas](
	[idiomaId] [int] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_idiomas] PRIMARY KEY CLUSTERED 
(
	[idiomaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventarioCamiones]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventarioCamiones](
	[invCamionId] [int] IDENTITY(1,1) NOT NULL,
	[camionId] [int] NOT NULL,
	[recipienteId] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[validFrom] [datetime2](7) NOT NULL,
	[validTo] [datetime2](7) NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_inventarioCamiones] PRIMARY KEY CLUSTERED 
(
	[invCamionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventarioLocales]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventarioLocales](
	[invLocalId] [int] IDENTITY(1,1) NOT NULL,
	[localId] [int] NOT NULL,
	[recipienteId] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[validFrom] [datetime2](7) NOT NULL,
	[validTo] [datetime2](7) NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_inventarioLocales] PRIMARY KEY CLUSTERED 
(
	[invLocalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventarioPlantas]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventarioPlantas](
	[invPlantaId] [int] IDENTITY(1,1) NOT NULL,
	[plantaId] [int] NOT NULL,
	[recipienteId] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[validFrom] [datetime2](7) NOT NULL,
	[validTo] [datetime2](7) NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_inventarioPlantas] PRIMARY KEY CLUSTERED 
(
	[invPlantaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itemsContaminantes]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itemsContaminantes](
	[itemContId] [bigint] IDENTITY(1,1) NOT NULL,
	[montoTotal] [money] NOT NULL,
	[productorId] [int] NOT NULL,
	[contaContratoId] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[puntosExceso] [tinyint] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_facturasContaminantes] PRIMARY KEY CLUSTERED 
(
	[itemContId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itemsFactura]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itemsFactura](
	[facturaId] [bigint] NULL,
	[itemId] [bigint] NULL,
	[tipoItemId] [tinyint] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itemsGanancias]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itemsGanancias](
	[itemGanaId] [bigint] IDENTITY(1,1) NOT NULL,
	[porcentajeId] [int] NULL,
	[montoTotal] [money] NULL,
	[monedaId] [int] NULL,
	[fecha] [datetime] NULL,
	[itemProdId] [bigint] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_facturasGanancias] PRIMARY KEY CLUSTERED 
(
	[itemGanaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itemsProductos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itemsProductos](
	[itemProdId] [bigint] IDENTITY(1,1) NOT NULL,
	[canalId] [int] NOT NULL,
	[loteId] [int] NOT NULL,
	[cantidadProductos] [decimal](10, 2) NOT NULL,
	[montoTotal] [money] NOT NULL,
	[monedaId] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[precioProductoId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_ventasProductosLogs] PRIMARY KEY CLUSTERED 
(
	[itemProdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itemsRecoleccion]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itemsRecoleccion](
	[itemRecId] [bigint] IDENTITY(1,1) NOT NULL,
	[productorId] [int] NOT NULL,
	[montoTotal] [money] NOT NULL,
	[recolectorId] [int] NOT NULL,
	[montoRec] [money] NOT NULL,
	[montoTrato] [money] NOT NULL,
	[montoComisionEV] [money] NOT NULL,
	[viajeId] [int] NOT NULL,
	[fechaFactura] [datetime] NOT NULL,
	[descuentoSaldo] [money] NOT NULL,
	[montoAPagar] [money] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_pagosRecoleccion] PRIMARY KEY CLUSTERED 
(
	[itemRecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[levels]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[levels](
	[levelId] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [nchar](25) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_levels] PRIMARY KEY CLUSTERED 
(
	[levelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locales]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locales](
	[localId] [int] IDENTITY(1,1) NOT NULL,
	[productorId] [int] NOT NULL,
	[direccionId] [int] NOT NULL,
	[nombre] [nchar](20) NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_locales] PRIMARY KEY CLUSTERED 
(
	[localId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[localesPorHorario]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[localesPorHorario](
	[recHorarioId] [int] NOT NULL,
	[areaEfectoId] [int] NULL,
	[objectTypeId] [tinyint] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lotesProduccionLogs]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lotesProduccionLogs](
	[loteId] [int] IDENTITY(1,1) NOT NULL,
	[productoId] [int] NOT NULL,
	[plantaId] [int] NOT NULL,
	[cantidad] [decimal](10, 2) NOT NULL,
	[prodContratoId] [int] NOT NULL,
	[costoProduccion] [money] NOT NULL,
	[monedaId] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_productosFabricados] PRIMARY KEY CLUSTERED 
(
	[loteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcasRecipiente]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcasRecipiente](
	[marcaId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_marcasRecipiente] PRIMARY KEY CLUSTERED 
(
	[marcaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelosRecipientes]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelosRecipientes](
	[modeloId] [int] IDENTITY(1,1) NOT NULL,
	[marcaId] [int] NOT NULL,
	[nombre] [nchar](20) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_modelosRecipientes] PRIMARY KEY CLUSTERED 
(
	[modeloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monedas]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monedas](
	[monedaId] [int] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NOT NULL,
	[simbolo] [nchar](1) NOT NULL,
	[acronimo] [nchar](3) NOT NULL,
	[defaultMoneda] [bit] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_monedas] PRIMARY KEY CLUSTERED 
(
	[monedaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nombres]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nombres](
	[nombreId] [int] IDENTITY(1,1) NOT NULL,
	[nombreBase] [nchar](20) NULL,
	[idiomaId] [int] NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_traduccionesNombres] PRIMARY KEY CLUSTERED 
(
	[nombreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[objectTypes]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objectTypes](
	[objectTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[objectName] [nchar](15) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_objectTypes] PRIMARY KEY CLUSTERED 
(
	[objectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagos](
	[pagoId] [int] IDENTITY(1,1) NOT NULL,
	[facturaId] [bigint] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[montoPagado] [money] NOT NULL,
 CONSTRAINT [PK_pagos] PRIMARY KEY CLUSTERED 
(
	[pagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[paisId] [int] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED 
(
	[paisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[participantes]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[participantes](
	[participanteId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NOT NULL,
	[tipoEntidadId] [smallint] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_participantes] PRIMARY KEY CLUSTERED 
(
	[participanteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pasosRecoleccion]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pasosRecoleccion](
	[recPasoId] [int] IDENTITY(1,1) NOT NULL,
	[plantaIdOrigen] [int] NULL,
	[dia] [smallint] NOT NULL,
	[horaRecogerEV] [datetime] NULL,
	[horaEntregarEV] [datetime] NULL,
	[recHorarioId] [int] NOT NULL,
	[hora] [time](7) NOT NULL,
	[plantaIdDestino] [int] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_pasosRecoleccion] PRIMARY KEY CLUSTERED 
(
	[recPasoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plantas]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantas](
	[plantaId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](15) NOT NULL,
	[direccionId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_plantas] PRIMARY KEY CLUSTERED 
(
	[plantaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[porcentajesActores]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[porcentajesActores](
	[porcentajeId] [int] IDENTITY(1,1) NOT NULL,
	[prodContratoId] [int] NOT NULL,
	[actorId] [int] NOT NULL,
	[porcentaje] [decimal](5, 2) NOT NULL,
	[productoId] [int] NOT NULL,
	[monedaId] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[fechaFiniquitacion] [datetime] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_porcentajesActores] PRIMARY KEY CLUSTERED 
(
	[porcentajeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preciosProductosContrato]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preciosProductosContrato](
	[prodContratoId] [int] NOT NULL,
	[productoId] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[areaEfectoId] [int] NOT NULL,
	[objectTypeId] [tinyint] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[monedaId] [int] NOT NULL,
	[precioProductoId] [int] IDENTITY(1,1) NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_preciosProductosContrato] PRIMARY KEY CLUSTERED 
(
	[precioProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productores]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productores](
	[productorId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NOT NULL,
	[tipoEntidadId] [smallint] NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[estadoContaminanteId] [nchar](10) NULL,
	[huellaCarbonoProd] [tinyint] NULL,
	[validFrom] [datetime2](7) NOT NULL,
	[validTo] [datetime2](7) NOT NULL,
	[huellaCarbonoReco] [tinyint] NULL,
	[monedaId] [int] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_productores] PRIMARY KEY CLUSTERED 
(
	[productorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[productoId] [int] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[productoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipientes]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipientes](
	[recipienteId] [int] IDENTITY(1,1) NOT NULL,
	[reciCapacidad] [decimal](10, 2) NOT NULL,
	[desTipoId] [smallint] NOT NULL,
	[modeloId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_recipientes] PRIMARY KEY CLUSTERED 
(
	[recipienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recipientesMovimientos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recipientesMovimientos](
	[recipienteId] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[reciMoveId] [int] IDENTITY(1,1) NOT NULL,
	[cantidadRecipientes] [int] NOT NULL,
	[plantaId] [int] NOT NULL,
	[direccion] [bit] NOT NULL,
	[viajeId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_eventosRecipienteLog] PRIMARY KEY CLUSTERED 
(
	[reciMoveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recoleccionesPorProduccion]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recoleccionesPorProduccion](
	[prodContratoId] [int] NOT NULL,
	[recContratoId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recolectores]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recolectores](
	[recolectorId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NULL,
	[fechaRegistro] [datetime] NULL,
	[tipoEntidadId] [smallint] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_recolectores] PRIMARY KEY CLUSTERED 
(
	[recolectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regiones]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regiones](
	[regionId] [int] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_regiones] PRIMARY KEY CLUSTERED 
(
	[regionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requerimientosRecolectores]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requerimientosRecolectores](
	[recolectorId] [int] NOT NULL,
	[desTipoId] [smallint] NOT NULL,
	[enabled] [bit] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[saldosDistribucion]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[saldosDistribucion](
	[saldoId] [int] IDENTITY(1,1) NOT NULL,
	[productorId] [int] NULL,
	[areaEfectoId] [int] NULL,
	[objectTypeId] [tinyint] NULL,
	[validFrom] [datetime2](7) NOT NULL,
	[validTo] [datetime2](7) NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_saldosDistribucion] PRIMARY KEY CLUSTERED 
(
	[saldoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[saldosPorItem]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[saldosPorItem](
	[saldoFactId] [int] IDENTITY(1,1) NOT NULL,
	[ingreso] [money] NOT NULL,
	[monedaId] [int] NOT NULL,
	[productorId] [int] NULL,
	[itemContId] [bigint] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[areaEfectoId] [int] NULL,
	[objectTypeId] [tinyint] NULL,
 CONSTRAINT [PK_saldosPorFact] PRIMARY KEY CLUSTERED 
(
	[saldoFactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sources]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sources](
	[sourceId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](20) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_sources] PRIMARY KEY CLUSTERED 
(
	[sourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tarifasActores]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarifasActores](
	[prodContratoId] [int] NOT NULL,
	[deudorId] [int] NOT NULL,
	[monto] [money] NOT NULL,
	[monedaId] [int] NOT NULL,
	[periodicidad] [smallint] NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[fechaFiniquitacion] [datetime] NULL,
	[tarifaId] [int] IDENTITY(1,1) NOT NULL,
	[acreedorId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[objectTypeDeudor] [tinyint] NOT NULL,
	[objectTypeAcreedor] [tinyint] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_tarifasActores] PRIMARY KEY CLUSTERED 
(
	[tarifaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiposDeCambio]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposDeCambio](
	[monedaBaseId] [int] NOT NULL,
	[conversion] [money] NOT NULL,
	[monedaCambioId] [int] NULL,
	[validFrom] [datetime2](7) NOT NULL,
	[validTo] [datetime2](7) NOT NULL,
	[enabled] [bit] NOT NULL,
	[tipoCambioId] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_tiposDeCambio] PRIMARY KEY CLUSTERED 
(
	[tipoCambioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_tiposDeCambio] UNIQUE NONCLUSTERED 
(
	[monedaBaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiposDesechos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposDesechos](
	[desTipoId] [smallint] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_tiposRecipientes] PRIMARY KEY CLUSTERED 
(
	[desTipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiposEntidades]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposEntidades](
	[tipoEntidadId] [smallint] IDENTITY(1,1) NOT NULL,
	[tipoNombre] [nchar](15) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_tiposEntidades] PRIMARY KEY CLUSTERED 
(
	[tipoEntidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiposEventosViajesReci]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposEventosViajesReci](
	[reciTipoEventoId] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_tiposEventosCiclos] PRIMARY KEY CLUSTERED 
(
	[reciTipoEventoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiposItems]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposItems](
	[tipoItemId] [tinyint] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_tiposFactura] PRIMARY KEY CLUSTERED 
(
	[tipoItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[traduccionesPorIdioma]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[traduccionesPorIdioma](
	[idiomaId] [int] NOT NULL,
	[nombreId] [int] NOT NULL,
	[traduccion] [nchar](20) NOT NULL,
	[traduccionId] [int] IDENTITY(1,1) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_traduccionesPorIdioma] PRIMARY KEY CLUSTERED 
(
	[traduccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tratamientos]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tratamientos](
	[tratoId] [int] IDENTITY(1,1) NOT NULL,
	[nombreId] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_tratamientos] PRIMARY KEY CLUSTERED 
(
	[tratoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[viajesRecoleccion]    Script Date: 4/18/2023 8:33:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[viajesRecoleccion](
	[viajeId] [int] IDENTITY(1,1) NOT NULL,
	[recPasoId] [int] NOT NULL,
	[localId] [int] NOT NULL,
	[camionId] [int] NOT NULL,
	[plantaOrigenId] [int] NOT NULL,
	[plantaDestinoId] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[choferId] [int] NULL,
	[enabled] [bit] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[updatedAt] [datetime] NULL,
	[computer] [varchar](20) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_ciclosRecipientes] PRIMARY KEY CLUSTERED 
(
	[viajeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[actoresContratoProd]  WITH CHECK ADD  CONSTRAINT [FK_actoresContratoProd_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[actoresContratoProd] CHECK CONSTRAINT [FK_actoresContratoProd_objectTypes]
GO
ALTER TABLE [dbo].[actoresContratoProd]  WITH CHECK ADD  CONSTRAINT [FK_involucradosPorContrato_contratos] FOREIGN KEY([prodContratoId])
REFERENCES [dbo].[contratosProduccion] ([prodContratoId])
GO
ALTER TABLE [dbo].[actoresContratoProd] CHECK CONSTRAINT [FK_involucradosPorContrato_contratos]
GO
ALTER TABLE [dbo].[areasPorRecolector]  WITH CHECK ADD  CONSTRAINT [FK_areasPorRecolector_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[areasPorRecolector] CHECK CONSTRAINT [FK_areasPorRecolector_objectTypes]
GO
ALTER TABLE [dbo].[areasPorRecolector]  WITH CHECK ADD  CONSTRAINT [FK_regionesPorRecolector_recolectores] FOREIGN KEY([recolectorId])
REFERENCES [dbo].[recolectores] ([recolectorId])
GO
ALTER TABLE [dbo].[areasPorRecolector] CHECK CONSTRAINT [FK_regionesPorRecolector_recolectores]
GO
ALTER TABLE [dbo].[beneficiariosPorContaminante]  WITH CHECK ADD  CONSTRAINT [FK_beneficiariosPorContaminante_contratosEmpContaminantes] FOREIGN KEY([contaContratoId])
REFERENCES [dbo].[contratosEmpContaminantes] ([contaContratoId])
GO
ALTER TABLE [dbo].[beneficiariosPorContaminante] CHECK CONSTRAINT [FK_beneficiariosPorContaminante_contratosEmpContaminantes]
GO
ALTER TABLE [dbo].[beneficiariosPorContaminante]  WITH CHECK ADD  CONSTRAINT [FK_beneficiariosPorContaminante_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[beneficiariosPorContaminante] CHECK CONSTRAINT [FK_beneficiariosPorContaminante_monedas]
GO
ALTER TABLE [dbo].[beneficiariosPorContaminante]  WITH CHECK ADD  CONSTRAINT [FK_beneficiariosPorContaminante_objectTypes] FOREIGN KEY([objectType])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[beneficiariosPorContaminante] CHECK CONSTRAINT [FK_beneficiariosPorContaminante_objectTypes]
GO
ALTER TABLE [dbo].[beneficiariosPorContaminante]  WITH CHECK ADD  CONSTRAINT [FK_beneficiariosPorContaminante_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[beneficiariosPorContaminante] CHECK CONSTRAINT [FK_beneficiariosPorContaminante_productores]
GO
ALTER TABLE [dbo].[camiones]  WITH CHECK ADD  CONSTRAINT [FK_camiones_recolectores] FOREIGN KEY([recolectorId])
REFERENCES [dbo].[recolectores] ([recolectorId])
GO
ALTER TABLE [dbo].[camiones] CHECK CONSTRAINT [FK_camiones_recolectores]
GO
ALTER TABLE [dbo].[canales]  WITH CHECK ADD  CONSTRAINT [FK_canales_tiposEntidades] FOREIGN KEY([tipoEntidadId])
REFERENCES [dbo].[tiposEntidades] ([tipoEntidadId])
GO
ALTER TABLE [dbo].[canales] CHECK CONSTRAINT [FK_canales_tiposEntidades]
GO
ALTER TABLE [dbo].[certificacionesCamion]  WITH CHECK ADD  CONSTRAINT [FK_certificacionesCamion_camiones] FOREIGN KEY([camionId])
REFERENCES [dbo].[camiones] ([camionId])
GO
ALTER TABLE [dbo].[certificacionesCamion] CHECK CONSTRAINT [FK_certificacionesCamion_camiones]
GO
ALTER TABLE [dbo].[certificacionesCamion]  WITH CHECK ADD  CONSTRAINT [FK_certificacionesCamion_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[certificacionesCamion] CHECK CONSTRAINT [FK_certificacionesCamion_desechos]
GO
ALTER TABLE [dbo].[ciudades]  WITH CHECK ADD  CONSTRAINT [FK_ciudades_estados] FOREIGN KEY([estadoId])
REFERENCES [dbo].[estados] ([estadoId])
GO
ALTER TABLE [dbo].[ciudades] CHECK CONSTRAINT [FK_ciudades_estados]
GO
ALTER TABLE [dbo].[ciudades]  WITH CHECK ADD  CONSTRAINT [FK_ciudades_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[ciudades] CHECK CONSTRAINT [FK_ciudades_traduccionesNombres]
GO
ALTER TABLE [dbo].[clasificacionesDesechos]  WITH CHECK ADD  CONSTRAINT [FK_clasificacionesDesechos_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[clasificacionesDesechos] CHECK CONSTRAINT [FK_clasificacionesDesechos_traduccionesNombres]
GO
ALTER TABLE [dbo].[contactosCanales]  WITH CHECK ADD  CONSTRAINT [FK_contactosCanales_canales] FOREIGN KEY([canalId])
REFERENCES [dbo].[canales] ([canalId])
GO
ALTER TABLE [dbo].[contactosCanales] CHECK CONSTRAINT [FK_contactosCanales_canales]
GO
ALTER TABLE [dbo].[contactosCanales]  WITH CHECK ADD  CONSTRAINT [FK_contactosCanales_contactos] FOREIGN KEY([contactoId])
REFERENCES [dbo].[contactos] ([contactoId])
GO
ALTER TABLE [dbo].[contactosCanales] CHECK CONSTRAINT [FK_contactosCanales_contactos]
GO
ALTER TABLE [dbo].[contactosContratos]  WITH CHECK ADD  CONSTRAINT [FK_contactosContratos_contactos] FOREIGN KEY([contactoId])
REFERENCES [dbo].[contactos] ([contactoId])
GO
ALTER TABLE [dbo].[contactosContratos] CHECK CONSTRAINT [FK_contactosContratos_contactos]
GO
ALTER TABLE [dbo].[contactosContratos]  WITH CHECK ADD  CONSTRAINT [FK_contactosContratos_contratosProduccion] FOREIGN KEY([prodContratoId])
REFERENCES [dbo].[contratosProduccion] ([prodContratoId])
GO
ALTER TABLE [dbo].[contactosContratos] CHECK CONSTRAINT [FK_contactosContratos_contratosProduccion]
GO
ALTER TABLE [dbo].[contactosEV]  WITH CHECK ADD  CONSTRAINT [FK_contactosEV_contactos] FOREIGN KEY([contactoId])
REFERENCES [dbo].[contactos] ([contactoId])
GO
ALTER TABLE [dbo].[contactosEV] CHECK CONSTRAINT [FK_contactosEV_contactos]
GO
ALTER TABLE [dbo].[contactosEV]  WITH CHECK ADD  CONSTRAINT [FK_contactosEV_plantas] FOREIGN KEY([plantaId])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[contactosEV] CHECK CONSTRAINT [FK_contactosEV_plantas]
GO
ALTER TABLE [dbo].[contactosParticipantes]  WITH CHECK ADD  CONSTRAINT [FK_contactosParticipantes_contactos] FOREIGN KEY([contactoId])
REFERENCES [dbo].[contactos] ([contactoId])
GO
ALTER TABLE [dbo].[contactosParticipantes] CHECK CONSTRAINT [FK_contactosParticipantes_contactos]
GO
ALTER TABLE [dbo].[contactosParticipantes]  WITH CHECK ADD  CONSTRAINT [FK_contactosParticipantes_participantes] FOREIGN KEY([participanteId])
REFERENCES [dbo].[participantes] ([participanteId])
GO
ALTER TABLE [dbo].[contactosParticipantes] CHECK CONSTRAINT [FK_contactosParticipantes_participantes]
GO
ALTER TABLE [dbo].[contactosProductores]  WITH CHECK ADD  CONSTRAINT [FK_contactosProductores_contactos] FOREIGN KEY([contactoId])
REFERENCES [dbo].[contactos] ([contactoId])
GO
ALTER TABLE [dbo].[contactosProductores] CHECK CONSTRAINT [FK_contactosProductores_contactos]
GO
ALTER TABLE [dbo].[contactosProductores]  WITH CHECK ADD  CONSTRAINT [FK_contactosProductores_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[contactosProductores] CHECK CONSTRAINT [FK_contactosProductores_productores]
GO
ALTER TABLE [dbo].[contactosRecolectores]  WITH CHECK ADD  CONSTRAINT [FK_contactosRecolectores_contactos] FOREIGN KEY([contactoId])
REFERENCES [dbo].[contactos] ([contactoId])
GO
ALTER TABLE [dbo].[contactosRecolectores] CHECK CONSTRAINT [FK_contactosRecolectores_contactos]
GO
ALTER TABLE [dbo].[contactosRecolectores]  WITH CHECK ADD  CONSTRAINT [FK_contactosRecolectores_recolectores] FOREIGN KEY([recolectorId])
REFERENCES [dbo].[recolectores] ([recolectorId])
GO
ALTER TABLE [dbo].[contactosRecolectores] CHECK CONSTRAINT [FK_contactosRecolectores_recolectores]
GO
ALTER TABLE [dbo].[contactosValores]  WITH CHECK ADD  CONSTRAINT [FK_contactosValores_contactos] FOREIGN KEY([contactoId])
REFERENCES [dbo].[contactos] ([contactoId])
GO
ALTER TABLE [dbo].[contactosValores] CHECK CONSTRAINT [FK_contactosValores_contactos]
GO
ALTER TABLE [dbo].[contactosValores]  WITH CHECK ADD  CONSTRAINT [FK_contactosValores_contactTypes] FOREIGN KEY([contactTypeId])
REFERENCES [dbo].[contactTypes] ([contactTypeId])
GO
ALTER TABLE [dbo].[contactosValores] CHECK CONSTRAINT [FK_contactosValores_contactTypes]
GO
ALTER TABLE [dbo].[contactTypes]  WITH CHECK ADD  CONSTRAINT [FK_contactTypes_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[contactTypes] CHECK CONSTRAINT [FK_contactTypes_traduccionesNombres]
GO
ALTER TABLE [dbo].[contratosEmpContaminantes]  WITH CHECK ADD  CONSTRAINT [FK_contratosEmpContaminantes_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[contratosEmpContaminantes] CHECK CONSTRAINT [FK_contratosEmpContaminantes_productores]
GO
ALTER TABLE [dbo].[contratosRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_contratosRecoleccion_estadosContratos] FOREIGN KEY([contEstadoId])
REFERENCES [dbo].[estadosContratos] ([contEstadoId])
GO
ALTER TABLE [dbo].[contratosRecoleccion] CHECK CONSTRAINT [FK_contratosRecoleccion_estadosContratos]
GO
ALTER TABLE [dbo].[contratosRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_contratosRecoleccion_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[contratosRecoleccion] CHECK CONSTRAINT [FK_contratosRecoleccion_objectTypes]
GO
ALTER TABLE [dbo].[contratosRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_contratosRecoleccion_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[contratosRecoleccion] CHECK CONSTRAINT [FK_contratosRecoleccion_productores]
GO
ALTER TABLE [dbo].[costosPasoRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_costosPasoRecoleccion_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[costosPasoRecoleccion] CHECK CONSTRAINT [FK_costosPasoRecoleccion_monedas]
GO
ALTER TABLE [dbo].[costosPasoRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_costosPasoRecoleccion_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[costosPasoRecoleccion] CHECK CONSTRAINT [FK_costosPasoRecoleccion_objectTypes]
GO
ALTER TABLE [dbo].[costosPasoRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_costosPasoRecoleccion_pasosRecoleccion] FOREIGN KEY([recPasoId])
REFERENCES [dbo].[pasosRecoleccion] ([recPasoId])
GO
ALTER TABLE [dbo].[costosPasoRecoleccion] CHECK CONSTRAINT [FK_costosPasoRecoleccion_pasosRecoleccion]
GO
ALTER TABLE [dbo].[costosPasoRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_costosPasoRecoleccion_recolectores] FOREIGN KEY([recolectorId])
REFERENCES [dbo].[recolectores] ([recolectorId])
GO
ALTER TABLE [dbo].[costosPasoRecoleccion] CHECK CONSTRAINT [FK_costosPasoRecoleccion_recolectores]
GO
ALTER TABLE [dbo].[costosTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_costosTratamiento_tratamientos] FOREIGN KEY([tratoId])
REFERENCES [dbo].[tratamientos] ([tratoId])
GO
ALTER TABLE [dbo].[costosTratamiento] CHECK CONSTRAINT [FK_costosTratamiento_tratamientos]
GO
ALTER TABLE [dbo].[costosTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_costosTratamientoContrato_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[costosTratamiento] CHECK CONSTRAINT [FK_costosTratamientoContrato_monedas]
GO
ALTER TABLE [dbo].[costosTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_costosTratamientoContrato_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[costosTratamiento] CHECK CONSTRAINT [FK_costosTratamientoContrato_objectTypes]
GO
ALTER TABLE [dbo].[costosTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_costosTratamientoContrato_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[costosTratamiento] CHECK CONSTRAINT [FK_costosTratamientoContrato_productores]
GO
ALTER TABLE [dbo].[costosTratoPorContrato]  WITH CHECK ADD  CONSTRAINT [FK_costosTratoPorContrato_contratosProduccion] FOREIGN KEY([prodContratoId])
REFERENCES [dbo].[contratosProduccion] ([prodContratoId])
GO
ALTER TABLE [dbo].[costosTratoPorContrato] CHECK CONSTRAINT [FK_costosTratoPorContrato_contratosProduccion]
GO
ALTER TABLE [dbo].[costosTratoPorContrato]  WITH CHECK ADD  CONSTRAINT [FK_costosTratoPorContrato_costosTratamiento] FOREIGN KEY([costoTratoId])
REFERENCES [dbo].[costosTratamiento] ([costoTratoId])
GO
ALTER TABLE [dbo].[costosTratoPorContrato] CHECK CONSTRAINT [FK_costosTratoPorContrato_costosTratamiento]
GO
ALTER TABLE [dbo].[descuentosPorItem]  WITH CHECK ADD  CONSTRAINT [FK_descuentosPorFactura_facturasRecoleccion] FOREIGN KEY([itemRecId])
REFERENCES [dbo].[itemsRecoleccion] ([itemRecId])
GO
ALTER TABLE [dbo].[descuentosPorItem] CHECK CONSTRAINT [FK_descuentosPorFactura_facturasRecoleccion]
GO
ALTER TABLE [dbo].[descuentosPorItem]  WITH CHECK ADD  CONSTRAINT [FK_descuentosPorFactura_saldosDistribucion] FOREIGN KEY([saldoId])
REFERENCES [dbo].[saldosDistribucion] ([saldoId])
GO
ALTER TABLE [dbo].[descuentosPorItem] CHECK CONSTRAINT [FK_descuentosPorFactura_saldosDistribucion]
GO
ALTER TABLE [dbo].[desechos]  WITH CHECK ADD  CONSTRAINT [FK_desechos_clasificacionesResiduos] FOREIGN KEY([desClasificacionId])
REFERENCES [dbo].[clasificacionesDesechos] ([desClasificacionId])
GO
ALTER TABLE [dbo].[desechos] CHECK CONSTRAINT [FK_desechos_clasificacionesResiduos]
GO
ALTER TABLE [dbo].[desechos]  WITH CHECK ADD  CONSTRAINT [FK_desechos_tiposDesechos] FOREIGN KEY([desTipoId])
REFERENCES [dbo].[tiposDesechos] ([desTipoId])
GO
ALTER TABLE [dbo].[desechos] CHECK CONSTRAINT [FK_desechos_tiposDesechos]
GO
ALTER TABLE [dbo].[desechos]  WITH CHECK ADD  CONSTRAINT [FK_desechos_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[desechos] CHECK CONSTRAINT [FK_desechos_traduccionesNombres]
GO
ALTER TABLE [dbo].[desechosLoteLogs]  WITH CHECK ADD  CONSTRAINT [FK_desechosLoteLogs_desechosPlantasLogs] FOREIGN KEY([desPlantLogId])
REFERENCES [dbo].[desechosPlantasLogs] ([desPlantLogId])
GO
ALTER TABLE [dbo].[desechosLoteLogs] CHECK CONSTRAINT [FK_desechosLoteLogs_desechosPlantasLogs]
GO
ALTER TABLE [dbo].[desechosLoteLogs]  WITH CHECK ADD  CONSTRAINT [FK_desechosLoteLogs_lotesProduccionLogs] FOREIGN KEY([loteId])
REFERENCES [dbo].[lotesProduccionLogs] ([loteId])
GO
ALTER TABLE [dbo].[desechosLoteLogs] CHECK CONSTRAINT [FK_desechosLoteLogs_lotesProduccionLogs]
GO
ALTER TABLE [dbo].[desechosPlantasLogs]  WITH CHECK ADD  CONSTRAINT [FK_desechosPlantasLogs_costosTratamiento] FOREIGN KEY([costoTratoId])
REFERENCES [dbo].[costosTratamiento] ([costoTratoId])
GO
ALTER TABLE [dbo].[desechosPlantasLogs] CHECK CONSTRAINT [FK_desechosPlantasLogs_costosTratamiento]
GO
ALTER TABLE [dbo].[desechosPlantasLogs]  WITH CHECK ADD  CONSTRAINT [FK_desechosPlantasLogs_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[desechosPlantasLogs] CHECK CONSTRAINT [FK_desechosPlantasLogs_desechos]
GO
ALTER TABLE [dbo].[desechosPlantasLogs]  WITH CHECK ADD  CONSTRAINT [FK_desechosPlantasLogs_plantas] FOREIGN KEY([plantaId])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[desechosPlantasLogs] CHECK CONSTRAINT [FK_desechosPlantasLogs_plantas]
GO
ALTER TABLE [dbo].[desechosPlantasLogs]  WITH CHECK ADD  CONSTRAINT [FK_desechosPlantasLogs_viajeRecipientes] FOREIGN KEY([viajeId])
REFERENCES [dbo].[viajesRecoleccion] ([viajeId])
GO
ALTER TABLE [dbo].[desechosPlantasLogs] CHECK CONSTRAINT [FK_desechosPlantasLogs_viajeRecipientes]
GO
ALTER TABLE [dbo].[desechosPorPaso]  WITH CHECK ADD  CONSTRAINT [FK_desechosPorPaso_costosTratamientoContrato] FOREIGN KEY([costoTratoId])
REFERENCES [dbo].[costosTratamiento] ([costoTratoId])
GO
ALTER TABLE [dbo].[desechosPorPaso] CHECK CONSTRAINT [FK_desechosPorPaso_costosTratamientoContrato]
GO
ALTER TABLE [dbo].[desechosPorPaso]  WITH CHECK ADD  CONSTRAINT [FK_desechosPorPaso_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[desechosPorPaso] CHECK CONSTRAINT [FK_desechosPorPaso_desechos]
GO
ALTER TABLE [dbo].[desechosPorPaso]  WITH CHECK ADD  CONSTRAINT [FK_recipientesPorPaso_pasosRecoleccion] FOREIGN KEY([recPasoId])
REFERENCES [dbo].[pasosRecoleccion] ([recPasoId])
GO
ALTER TABLE [dbo].[desechosPorPaso] CHECK CONSTRAINT [FK_recipientesPorPaso_pasosRecoleccion]
GO
ALTER TABLE [dbo].[desechosPorProducto]  WITH CHECK ADD  CONSTRAINT [FK_desechosPorProducto_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[desechosPorProducto] CHECK CONSTRAINT [FK_desechosPorProducto_desechos]
GO
ALTER TABLE [dbo].[desechosPorProducto]  WITH CHECK ADD  CONSTRAINT [FK_desechosPorProducto_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[desechosPorProducto] CHECK CONSTRAINT [FK_desechosPorProducto_productos]
GO
ALTER TABLE [dbo].[desechosPorRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_desechosPorRecipiente_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[desechosPorRecipiente] CHECK CONSTRAINT [FK_desechosPorRecipiente_desechos]
GO
ALTER TABLE [dbo].[desechosPorRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_desechosPorRecipiente_recipientes] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[desechosPorRecipiente] CHECK CONSTRAINT [FK_desechosPorRecipiente_recipientes]
GO
ALTER TABLE [dbo].[desechosPorTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_desechosPorTratamiento_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[desechosPorTratamiento] CHECK CONSTRAINT [FK_desechosPorTratamiento_desechos]
GO
ALTER TABLE [dbo].[desechosPorTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_desechosPorTratamiento_tratamientos] FOREIGN KEY([tratoId])
REFERENCES [dbo].[tratamientos] ([tratoId])
GO
ALTER TABLE [dbo].[desechosPorTratamiento] CHECK CONSTRAINT [FK_desechosPorTratamiento_tratamientos]
GO
ALTER TABLE [dbo].[desechosStatusLogs]  WITH CHECK ADD  CONSTRAINT [FK_desechosStatusLogs_desechosPlantasLogs] FOREIGN KEY([desPlantLogId])
REFERENCES [dbo].[desechosPlantasLogs] ([desPlantLogId])
GO
ALTER TABLE [dbo].[desechosStatusLogs] CHECK CONSTRAINT [FK_desechosStatusLogs_desechosPlantasLogs]
GO
ALTER TABLE [dbo].[desechosStatusLogs]  WITH CHECK ADD  CONSTRAINT [FK_desechosStatusLogs_desechosStatuses] FOREIGN KEY([desStatusId])
REFERENCES [dbo].[desechosStatuses] ([desStatusId])
GO
ALTER TABLE [dbo].[desechosStatusLogs] CHECK CONSTRAINT [FK_desechosStatusLogs_desechosStatuses]
GO
ALTER TABLE [dbo].[deterioriosReciLogs]  WITH CHECK ADD  CONSTRAINT [FK_deterioriosReciLogs_deterioroRecipientes] FOREIGN KEY([deterioroId])
REFERENCES [dbo].[deterioroRecipientes] ([deterioroId])
GO
ALTER TABLE [dbo].[deterioriosReciLogs] CHECK CONSTRAINT [FK_deterioriosReciLogs_deterioroRecipientes]
GO
ALTER TABLE [dbo].[deterioriosReciLogs]  WITH CHECK ADD  CONSTRAINT [FK_deterioriosReciLogs_recipientes] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[deterioriosReciLogs] CHECK CONSTRAINT [FK_deterioriosReciLogs_recipientes]
GO
ALTER TABLE [dbo].[deterioroRecipientes]  WITH CHECK ADD  CONSTRAINT [FK_deterioroRecipientes_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[deterioroRecipientes] CHECK CONSTRAINT [FK_deterioroRecipientes_traduccionesNombres]
GO
ALTER TABLE [dbo].[deteriorosReciPlantas]  WITH CHECK ADD  CONSTRAINT [FK_deteriorosReciPlantas_deterioriosReciLogs] FOREIGN KEY([plantaId])
REFERENCES [dbo].[deterioriosReciLogs] ([deterioroReciLogId])
GO
ALTER TABLE [dbo].[deteriorosReciPlantas] CHECK CONSTRAINT [FK_deteriorosReciPlantas_deterioriosReciLogs]
GO
ALTER TABLE [dbo].[deteriorosReciPlantas]  WITH CHECK ADD  CONSTRAINT [FK_deteriorosReciPlantas_deterioroRecipientes] FOREIGN KEY([deterioroId])
REFERENCES [dbo].[deterioroRecipientes] ([deterioroId])
GO
ALTER TABLE [dbo].[deteriorosReciPlantas] CHECK CONSTRAINT [FK_deteriorosReciPlantas_deterioroRecipientes]
GO
ALTER TABLE [dbo].[deteriorosReciPlantas]  WITH CHECK ADD  CONSTRAINT [FK_deteriorosReciPlantas_plantas] FOREIGN KEY([plantaId])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[deteriorosReciPlantas] CHECK CONSTRAINT [FK_deteriorosReciPlantas_plantas]
GO
ALTER TABLE [dbo].[deteriorosReciPlantas]  WITH CHECK ADD  CONSTRAINT [FK_deteriorosReciPlantas_recipientes] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[deteriorosReciPlantas] CHECK CONSTRAINT [FK_deteriorosReciPlantas_recipientes]
GO
ALTER TABLE [dbo].[direcciones]  WITH CHECK ADD  CONSTRAINT [FK_direcciones_ciudades] FOREIGN KEY([ciudadId])
REFERENCES [dbo].[ciudades] ([ciudadId])
GO
ALTER TABLE [dbo].[direcciones] CHECK CONSTRAINT [FK_direcciones_ciudades]
GO
ALTER TABLE [dbo].[elementosPorRegion]  WITH CHECK ADD  CONSTRAINT [FK_elementosPorRegion_ciudades] FOREIGN KEY([ciudadId])
REFERENCES [dbo].[ciudades] ([ciudadId])
GO
ALTER TABLE [dbo].[elementosPorRegion] CHECK CONSTRAINT [FK_elementosPorRegion_ciudades]
GO
ALTER TABLE [dbo].[elementosPorRegion]  WITH CHECK ADD  CONSTRAINT [FK_elementosPorRegion_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[elementosPorRegion] CHECK CONSTRAINT [FK_elementosPorRegion_direcciones]
GO
ALTER TABLE [dbo].[elementosPorRegion]  WITH CHECK ADD  CONSTRAINT [FK_elementosPorRegion_estados] FOREIGN KEY([estadoId])
REFERENCES [dbo].[estados] ([estadoId])
GO
ALTER TABLE [dbo].[elementosPorRegion] CHECK CONSTRAINT [FK_elementosPorRegion_estados]
GO
ALTER TABLE [dbo].[elementosPorRegion]  WITH CHECK ADD  CONSTRAINT [FK_elementosPorRegion_paises] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[elementosPorRegion] CHECK CONSTRAINT [FK_elementosPorRegion_paises]
GO
ALTER TABLE [dbo].[elementosPorRegion]  WITH CHECK ADD  CONSTRAINT [FK_localesPorRegion_regiones] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[elementosPorRegion] CHECK CONSTRAINT [FK_localesPorRegion_regiones]
GO
ALTER TABLE [dbo].[estados]  WITH CHECK ADD  CONSTRAINT [FK_estados_paises] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[estados] CHECK CONSTRAINT [FK_estados_paises]
GO
ALTER TABLE [dbo].[estados]  WITH CHECK ADD  CONSTRAINT [FK_estados_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[estados] CHECK CONSTRAINT [FK_estados_traduccionesNombres]
GO
ALTER TABLE [dbo].[estadosContratos]  WITH CHECK ADD  CONSTRAINT [FK_estadosContratos_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[estadosContratos] CHECK CONSTRAINT [FK_estadosContratos_traduccionesNombres]
GO
ALTER TABLE [dbo].[estadosEventos]  WITH CHECK ADD  CONSTRAINT [FK_estadosEventos_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[estadosEventos] CHECK CONSTRAINT [FK_estadosEventos_traduccionesNombres]
GO
ALTER TABLE [dbo].[estadosReciLogs]  WITH CHECK ADD  CONSTRAINT [FK_estadosReciLogs_estadosRecipientes] FOREIGN KEY([estadoReciId])
REFERENCES [dbo].[estadosRecipientes] ([estadoReciId])
GO
ALTER TABLE [dbo].[estadosReciLogs] CHECK CONSTRAINT [FK_estadosReciLogs_estadosRecipientes]
GO
ALTER TABLE [dbo].[estadosReciLogs]  WITH CHECK ADD  CONSTRAINT [FK_estadosReciLogs_plantas] FOREIGN KEY([plantaId])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[estadosReciLogs] CHECK CONSTRAINT [FK_estadosReciLogs_plantas]
GO
ALTER TABLE [dbo].[estadosReciLogs]  WITH CHECK ADD  CONSTRAINT [FK_estadosReciLogs_recipientes] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[estadosReciLogs] CHECK CONSTRAINT [FK_estadosReciLogs_recipientes]
GO
ALTER TABLE [dbo].[estadosRecipientes]  WITH CHECK ADD  CONSTRAINT [FK_estadosRecipientes_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[estadosRecipientes] CHECK CONSTRAINT [FK_estadosRecipientes_traduccionesNombres]
GO
ALTER TABLE [dbo].[estadosReciPlantas]  WITH CHECK ADD  CONSTRAINT [FK_estadosReciPlantas_estadosRecipientes] FOREIGN KEY([estadoReciId])
REFERENCES [dbo].[estadosRecipientes] ([estadoReciId])
GO
ALTER TABLE [dbo].[estadosReciPlantas] CHECK CONSTRAINT [FK_estadosReciPlantas_estadosRecipientes]
GO
ALTER TABLE [dbo].[estadosReciPlantas]  WITH CHECK ADD  CONSTRAINT [FK_estadosReciPlantas_plantas] FOREIGN KEY([plantaId])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[estadosReciPlantas] CHECK CONSTRAINT [FK_estadosReciPlantas_plantas]
GO
ALTER TABLE [dbo].[estadosReciPlantas]  WITH CHECK ADD  CONSTRAINT [FK_estadosReciPlantas_recipientes] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[estadosReciPlantas] CHECK CONSTRAINT [FK_estadosReciPlantas_recipientes]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_eventTypes] FOREIGN KEY([eventTypeId])
REFERENCES [dbo].[eventTypes] ([eventTypeId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_eventTypes]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_levels] FOREIGN KEY([levelId])
REFERENCES [dbo].[levels] ([levelId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_levels]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_objectTypes]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_sources] FOREIGN KEY([sourceId])
REFERENCES [dbo].[sources] ([sourceId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_sources]
GO
ALTER TABLE [dbo].[eventosPorViaje]  WITH CHECK ADD  CONSTRAINT [FK_eventosPorCiclo_tiposEventosCiclos] FOREIGN KEY([reciTipoEventoId])
REFERENCES [dbo].[tiposEventosViajesReci] ([reciTipoEventoId])
GO
ALTER TABLE [dbo].[eventosPorViaje] CHECK CONSTRAINT [FK_eventosPorCiclo_tiposEventosCiclos]
GO
ALTER TABLE [dbo].[eventosPorViaje]  WITH CHECK ADD  CONSTRAINT [FK_eventosPorViaje_contactos] FOREIGN KEY([contactoId])
REFERENCES [dbo].[contactos] ([contactoId])
GO
ALTER TABLE [dbo].[eventosPorViaje] CHECK CONSTRAINT [FK_eventosPorViaje_contactos]
GO
ALTER TABLE [dbo].[eventosPorViaje]  WITH CHECK ADD  CONSTRAINT [FK_eventosPorViaje_estadosEventos] FOREIGN KEY([estadoEventoId])
REFERENCES [dbo].[estadosEventos] ([estadoEventoId])
GO
ALTER TABLE [dbo].[eventosPorViaje] CHECK CONSTRAINT [FK_eventosPorViaje_estadosEventos]
GO
ALTER TABLE [dbo].[eventosPorViaje]  WITH CHECK ADD  CONSTRAINT [FK_eventosPorViaje_recipientesMovimientos] FOREIGN KEY([reciMoveId])
REFERENCES [dbo].[recipientesMovimientos] ([reciMoveId])
GO
ALTER TABLE [dbo].[eventosPorViaje] CHECK CONSTRAINT [FK_eventosPorViaje_recipientesMovimientos]
GO
ALTER TABLE [dbo].[facturas]  WITH CHECK ADD  CONSTRAINT [FK_facturas_facturaStatuses] FOREIGN KEY([facturaStatusId])
REFERENCES [dbo].[facturaStatuses] ([facturaStatusId])
GO
ALTER TABLE [dbo].[facturas] CHECK CONSTRAINT [FK_facturas_facturaStatuses]
GO
ALTER TABLE [dbo].[facturaStatuses]  WITH CHECK ADD  CONSTRAINT [FK_facturaStatuses_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[facturaStatuses] CHECK CONSTRAINT [FK_facturaStatuses_traduccionesNombres]
GO
ALTER TABLE [dbo].[horariosRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_horariosRecoleccion_contratosRecoleccion] FOREIGN KEY([recContratoId])
REFERENCES [dbo].[contratosRecoleccion] ([recContratoId])
GO
ALTER TABLE [dbo].[horariosRecoleccion] CHECK CONSTRAINT [FK_horariosRecoleccion_contratosRecoleccion]
GO
ALTER TABLE [dbo].[horariosRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_horariosRecoleccion_estadosContratos] FOREIGN KEY([contEstadoId])
REFERENCES [dbo].[estadosContratos] ([contEstadoId])
GO
ALTER TABLE [dbo].[horariosRecoleccion] CHECK CONSTRAINT [FK_horariosRecoleccion_estadosContratos]
GO
ALTER TABLE [dbo].[idiomas]  WITH CHECK ADD  CONSTRAINT [FK_idiomas_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[idiomas] CHECK CONSTRAINT [FK_idiomas_traduccionesNombres]
GO
ALTER TABLE [dbo].[inventarioCamiones]  WITH CHECK ADD  CONSTRAINT [FK_inventarioCamiones_camiones] FOREIGN KEY([camionId])
REFERENCES [dbo].[camiones] ([camionId])
GO
ALTER TABLE [dbo].[inventarioCamiones] CHECK CONSTRAINT [FK_inventarioCamiones_camiones]
GO
ALTER TABLE [dbo].[inventarioCamiones]  WITH CHECK ADD  CONSTRAINT [FK_inventarioCamiones_recipientes] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[inventarioCamiones] CHECK CONSTRAINT [FK_inventarioCamiones_recipientes]
GO
ALTER TABLE [dbo].[inventarioLocales]  WITH CHECK ADD  CONSTRAINT [FK_inventarioLocales_locales] FOREIGN KEY([localId])
REFERENCES [dbo].[locales] ([localId])
GO
ALTER TABLE [dbo].[inventarioLocales] CHECK CONSTRAINT [FK_inventarioLocales_locales]
GO
ALTER TABLE [dbo].[inventarioLocales]  WITH CHECK ADD  CONSTRAINT [FK_inventarioLocales_recipientes] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[inventarioLocales] CHECK CONSTRAINT [FK_inventarioLocales_recipientes]
GO
ALTER TABLE [dbo].[inventarioPlantas]  WITH CHECK ADD  CONSTRAINT [FK_inventarioPlantas_plantas] FOREIGN KEY([plantaId])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[inventarioPlantas] CHECK CONSTRAINT [FK_inventarioPlantas_plantas]
GO
ALTER TABLE [dbo].[inventarioPlantas]  WITH CHECK ADD  CONSTRAINT [FK_inventarioPlantas_recipientes] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[inventarioPlantas] CHECK CONSTRAINT [FK_inventarioPlantas_recipientes]
GO
ALTER TABLE [dbo].[itemsContaminantes]  WITH CHECK ADD  CONSTRAINT [FK_facturasContaminantes_contratosEmpContaminantes] FOREIGN KEY([contaContratoId])
REFERENCES [dbo].[contratosEmpContaminantes] ([contaContratoId])
GO
ALTER TABLE [dbo].[itemsContaminantes] CHECK CONSTRAINT [FK_facturasContaminantes_contratosEmpContaminantes]
GO
ALTER TABLE [dbo].[itemsFactura]  WITH CHECK ADD  CONSTRAINT [FK_itemsFactura_facturas] FOREIGN KEY([facturaId])
REFERENCES [dbo].[facturas] ([facturaId])
GO
ALTER TABLE [dbo].[itemsFactura] CHECK CONSTRAINT [FK_itemsFactura_facturas]
GO
ALTER TABLE [dbo].[itemsFactura]  WITH CHECK ADD  CONSTRAINT [FK_itemsFactura_tiposItems] FOREIGN KEY([tipoItemId])
REFERENCES [dbo].[tiposItems] ([tipoItemId])
GO
ALTER TABLE [dbo].[itemsFactura] CHECK CONSTRAINT [FK_itemsFactura_tiposItems]
GO
ALTER TABLE [dbo].[itemsGanancias]  WITH CHECK ADD  CONSTRAINT [FK_facturasGanancias_facturasProductos] FOREIGN KEY([itemProdId])
REFERENCES [dbo].[itemsProductos] ([itemProdId])
GO
ALTER TABLE [dbo].[itemsGanancias] CHECK CONSTRAINT [FK_facturasGanancias_facturasProductos]
GO
ALTER TABLE [dbo].[itemsGanancias]  WITH CHECK ADD  CONSTRAINT [FK_facturasGanancias_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[itemsGanancias] CHECK CONSTRAINT [FK_facturasGanancias_monedas]
GO
ALTER TABLE [dbo].[itemsGanancias]  WITH CHECK ADD  CONSTRAINT [FK_facturasGanancias_porcentajesActores] FOREIGN KEY([porcentajeId])
REFERENCES [dbo].[porcentajesActores] ([porcentajeId])
GO
ALTER TABLE [dbo].[itemsGanancias] CHECK CONSTRAINT [FK_facturasGanancias_porcentajesActores]
GO
ALTER TABLE [dbo].[itemsProductos]  WITH CHECK ADD  CONSTRAINT [FK_ventasProductosLogs_canales] FOREIGN KEY([canalId])
REFERENCES [dbo].[canales] ([canalId])
GO
ALTER TABLE [dbo].[itemsProductos] CHECK CONSTRAINT [FK_ventasProductosLogs_canales]
GO
ALTER TABLE [dbo].[itemsProductos]  WITH CHECK ADD  CONSTRAINT [FK_ventasProductosLogs_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[itemsProductos] CHECK CONSTRAINT [FK_ventasProductosLogs_monedas]
GO
ALTER TABLE [dbo].[itemsProductos]  WITH CHECK ADD  CONSTRAINT [FK_ventasProductosLogs_preciosProductosContrato] FOREIGN KEY([precioProductoId])
REFERENCES [dbo].[preciosProductosContrato] ([precioProductoId])
GO
ALTER TABLE [dbo].[itemsProductos] CHECK CONSTRAINT [FK_ventasProductosLogs_preciosProductosContrato]
GO
ALTER TABLE [dbo].[itemsRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_pagosRecoleccion_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[itemsRecoleccion] CHECK CONSTRAINT [FK_pagosRecoleccion_productores]
GO
ALTER TABLE [dbo].[itemsRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_pagosRecoleccion_recolectores] FOREIGN KEY([recolectorId])
REFERENCES [dbo].[recolectores] ([recolectorId])
GO
ALTER TABLE [dbo].[itemsRecoleccion] CHECK CONSTRAINT [FK_pagosRecoleccion_recolectores]
GO
ALTER TABLE [dbo].[itemsRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_pagosRecoleccion_viajeRecipientes] FOREIGN KEY([viajeId])
REFERENCES [dbo].[viajesRecoleccion] ([viajeId])
GO
ALTER TABLE [dbo].[itemsRecoleccion] CHECK CONSTRAINT [FK_pagosRecoleccion_viajeRecipientes]
GO
ALTER TABLE [dbo].[locales]  WITH CHECK ADD  CONSTRAINT [FK_locales_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[locales] CHECK CONSTRAINT [FK_locales_direcciones]
GO
ALTER TABLE [dbo].[locales]  WITH CHECK ADD  CONSTRAINT [FK_locales_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[locales] CHECK CONSTRAINT [FK_locales_productores]
GO
ALTER TABLE [dbo].[localesPorHorario]  WITH CHECK ADD  CONSTRAINT [FK_localesPorHorario_horariosRecoleccion] FOREIGN KEY([recHorarioId])
REFERENCES [dbo].[horariosRecoleccion] ([recHorarioId])
GO
ALTER TABLE [dbo].[localesPorHorario] CHECK CONSTRAINT [FK_localesPorHorario_horariosRecoleccion]
GO
ALTER TABLE [dbo].[localesPorHorario]  WITH CHECK ADD  CONSTRAINT [FK_localesPorHorario_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[localesPorHorario] CHECK CONSTRAINT [FK_localesPorHorario_objectTypes]
GO
ALTER TABLE [dbo].[lotesProduccionLogs]  WITH CHECK ADD  CONSTRAINT [FK_lotesProduccionLogs_contratosProduccion] FOREIGN KEY([prodContratoId])
REFERENCES [dbo].[contratosProduccion] ([prodContratoId])
GO
ALTER TABLE [dbo].[lotesProduccionLogs] CHECK CONSTRAINT [FK_lotesProduccionLogs_contratosProduccion]
GO
ALTER TABLE [dbo].[lotesProduccionLogs]  WITH CHECK ADD  CONSTRAINT [FK_productosFabricados_plantas] FOREIGN KEY([plantaId])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[lotesProduccionLogs] CHECK CONSTRAINT [FK_productosFabricados_plantas]
GO
ALTER TABLE [dbo].[lotesProduccionLogs]  WITH CHECK ADD  CONSTRAINT [FK_productosFabricados_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[lotesProduccionLogs] CHECK CONSTRAINT [FK_productosFabricados_productos]
GO
ALTER TABLE [dbo].[modelosRecipientes]  WITH CHECK ADD  CONSTRAINT [FK_modelosRecipientes_marcasRecipiente] FOREIGN KEY([marcaId])
REFERENCES [dbo].[marcasRecipiente] ([marcaId])
GO
ALTER TABLE [dbo].[modelosRecipientes] CHECK CONSTRAINT [FK_modelosRecipientes_marcasRecipiente]
GO
ALTER TABLE [dbo].[monedas]  WITH CHECK ADD  CONSTRAINT [FK_monedas_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[monedas] CHECK CONSTRAINT [FK_monedas_traduccionesNombres]
GO
ALTER TABLE [dbo].[nombres]  WITH CHECK ADD  CONSTRAINT [FK_traduccionesNombres_idiomas] FOREIGN KEY([idiomaId])
REFERENCES [dbo].[idiomas] ([idiomaId])
GO
ALTER TABLE [dbo].[nombres] CHECK CONSTRAINT [FK_traduccionesNombres_idiomas]
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD  CONSTRAINT [FK_pagos_facturas] FOREIGN KEY([facturaId])
REFERENCES [dbo].[facturas] ([facturaId])
GO
ALTER TABLE [dbo].[pagos] CHECK CONSTRAINT [FK_pagos_facturas]
GO
ALTER TABLE [dbo].[paises]  WITH CHECK ADD  CONSTRAINT [FK_paises_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[paises] CHECK CONSTRAINT [FK_paises_traduccionesNombres]
GO
ALTER TABLE [dbo].[participantes]  WITH CHECK ADD  CONSTRAINT [FK_participantes_tiposEntidades] FOREIGN KEY([tipoEntidadId])
REFERENCES [dbo].[tiposEntidades] ([tipoEntidadId])
GO
ALTER TABLE [dbo].[participantes] CHECK CONSTRAINT [FK_participantes_tiposEntidades]
GO
ALTER TABLE [dbo].[pasosRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_pasosRecoleccion_horariosRecoleccion] FOREIGN KEY([recHorarioId])
REFERENCES [dbo].[horariosRecoleccion] ([recHorarioId])
GO
ALTER TABLE [dbo].[pasosRecoleccion] CHECK CONSTRAINT [FK_pasosRecoleccion_horariosRecoleccion]
GO
ALTER TABLE [dbo].[pasosRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_pasosRecoleccion_plantas] FOREIGN KEY([plantaIdOrigen])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[pasosRecoleccion] CHECK CONSTRAINT [FK_pasosRecoleccion_plantas]
GO
ALTER TABLE [dbo].[pasosRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_pasosRecoleccion_plantas1] FOREIGN KEY([plantaIdDestino])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[pasosRecoleccion] CHECK CONSTRAINT [FK_pasosRecoleccion_plantas1]
GO
ALTER TABLE [dbo].[porcentajesActores]  WITH CHECK ADD  CONSTRAINT [FK_porcentajesActores_actoresContratoProd] FOREIGN KEY([actorId])
REFERENCES [dbo].[actoresContratoProd] ([actorId])
GO
ALTER TABLE [dbo].[porcentajesActores] CHECK CONSTRAINT [FK_porcentajesActores_actoresContratoProd]
GO
ALTER TABLE [dbo].[porcentajesActores]  WITH CHECK ADD  CONSTRAINT [FK_porcentajesActores_contratosProduccion] FOREIGN KEY([porcentajeId])
REFERENCES [dbo].[contratosProduccion] ([prodContratoId])
GO
ALTER TABLE [dbo].[porcentajesActores] CHECK CONSTRAINT [FK_porcentajesActores_contratosProduccion]
GO
ALTER TABLE [dbo].[porcentajesActores]  WITH CHECK ADD  CONSTRAINT [FK_porcentajesActores_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[porcentajesActores] CHECK CONSTRAINT [FK_porcentajesActores_monedas]
GO
ALTER TABLE [dbo].[porcentajesActores]  WITH CHECK ADD  CONSTRAINT [FK_porcentajesActores_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[porcentajesActores] CHECK CONSTRAINT [FK_porcentajesActores_productos]
GO
ALTER TABLE [dbo].[preciosProductosContrato]  WITH CHECK ADD  CONSTRAINT [FK_preciosProductosContrato_contratosProduccion] FOREIGN KEY([prodContratoId])
REFERENCES [dbo].[contratosProduccion] ([prodContratoId])
GO
ALTER TABLE [dbo].[preciosProductosContrato] CHECK CONSTRAINT [FK_preciosProductosContrato_contratosProduccion]
GO
ALTER TABLE [dbo].[preciosProductosContrato]  WITH CHECK ADD  CONSTRAINT [FK_preciosProductosContrato_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[preciosProductosContrato] CHECK CONSTRAINT [FK_preciosProductosContrato_monedas]
GO
ALTER TABLE [dbo].[preciosProductosContrato]  WITH CHECK ADD  CONSTRAINT [FK_preciosProductosContrato_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[preciosProductosContrato] CHECK CONSTRAINT [FK_preciosProductosContrato_objectTypes]
GO
ALTER TABLE [dbo].[preciosProductosContrato]  WITH CHECK ADD  CONSTRAINT [FK_preciosProductosContrato_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[preciosProductosContrato] CHECK CONSTRAINT [FK_preciosProductosContrato_productos]
GO
ALTER TABLE [dbo].[productores]  WITH CHECK ADD  CONSTRAINT [FK_productores_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[productores] CHECK CONSTRAINT [FK_productores_monedas]
GO
ALTER TABLE [dbo].[productores]  WITH CHECK ADD  CONSTRAINT [FK_productores_tiposEntidades] FOREIGN KEY([tipoEntidadId])
REFERENCES [dbo].[tiposEntidades] ([tipoEntidadId])
GO
ALTER TABLE [dbo].[productores] CHECK CONSTRAINT [FK_productores_tiposEntidades]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [FK_productos_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [FK_productos_traduccionesNombres]
GO
ALTER TABLE [dbo].[recipientes]  WITH CHECK ADD  CONSTRAINT [FK_recipientes_modelosRecipientes] FOREIGN KEY([modeloId])
REFERENCES [dbo].[modelosRecipientes] ([modeloId])
GO
ALTER TABLE [dbo].[recipientes] CHECK CONSTRAINT [FK_recipientes_modelosRecipientes]
GO
ALTER TABLE [dbo].[recipientes]  WITH CHECK ADD  CONSTRAINT [FK_recipientes_tiposRecipientes] FOREIGN KEY([desTipoId])
REFERENCES [dbo].[tiposDesechos] ([desTipoId])
GO
ALTER TABLE [dbo].[recipientes] CHECK CONSTRAINT [FK_recipientes_tiposRecipientes]
GO
ALTER TABLE [dbo].[recipientesMovimientos]  WITH CHECK ADD  CONSTRAINT [FK_eventosRecipienteLog_recipientes] FOREIGN KEY([recipienteId])
REFERENCES [dbo].[recipientes] ([recipienteId])
GO
ALTER TABLE [dbo].[recipientesMovimientos] CHECK CONSTRAINT [FK_eventosRecipienteLog_recipientes]
GO
ALTER TABLE [dbo].[recipientesMovimientos]  WITH CHECK ADD  CONSTRAINT [FK_recipientesMovimientos_viajesRecoleccion] FOREIGN KEY([viajeId])
REFERENCES [dbo].[viajesRecoleccion] ([viajeId])
GO
ALTER TABLE [dbo].[recipientesMovimientos] CHECK CONSTRAINT [FK_recipientesMovimientos_viajesRecoleccion]
GO
ALTER TABLE [dbo].[recoleccionesPorProduccion]  WITH CHECK ADD  CONSTRAINT [FK_recoleccionesPorProduccion_contratosProduccion] FOREIGN KEY([prodContratoId])
REFERENCES [dbo].[contratosProduccion] ([prodContratoId])
GO
ALTER TABLE [dbo].[recoleccionesPorProduccion] CHECK CONSTRAINT [FK_recoleccionesPorProduccion_contratosProduccion]
GO
ALTER TABLE [dbo].[recoleccionesPorProduccion]  WITH CHECK ADD  CONSTRAINT [FK_recoleccionesPorProduccion_contratosRecoleccion] FOREIGN KEY([recContratoId])
REFERENCES [dbo].[contratosRecoleccion] ([recContratoId])
GO
ALTER TABLE [dbo].[recoleccionesPorProduccion] CHECK CONSTRAINT [FK_recoleccionesPorProduccion_contratosRecoleccion]
GO
ALTER TABLE [dbo].[recolectores]  WITH CHECK ADD  CONSTRAINT [FK_recolectores_tiposEntidades] FOREIGN KEY([tipoEntidadId])
REFERENCES [dbo].[tiposEntidades] ([tipoEntidadId])
GO
ALTER TABLE [dbo].[recolectores] CHECK CONSTRAINT [FK_recolectores_tiposEntidades]
GO
ALTER TABLE [dbo].[regiones]  WITH CHECK ADD  CONSTRAINT [FK_regiones_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[regiones] CHECK CONSTRAINT [FK_regiones_traduccionesNombres]
GO
ALTER TABLE [dbo].[requerimientosRecolectores]  WITH CHECK ADD  CONSTRAINT [FK_requerimientosRecolectores_recolectores] FOREIGN KEY([recolectorId])
REFERENCES [dbo].[recolectores] ([recolectorId])
GO
ALTER TABLE [dbo].[requerimientosRecolectores] CHECK CONSTRAINT [FK_requerimientosRecolectores_recolectores]
GO
ALTER TABLE [dbo].[requerimientosRecolectores]  WITH CHECK ADD  CONSTRAINT [FK_requerimientosRecolectores_tiposDesechos] FOREIGN KEY([desTipoId])
REFERENCES [dbo].[tiposDesechos] ([desTipoId])
GO
ALTER TABLE [dbo].[requerimientosRecolectores] CHECK CONSTRAINT [FK_requerimientosRecolectores_tiposDesechos]
GO
ALTER TABLE [dbo].[saldosDistribucion]  WITH CHECK ADD  CONSTRAINT [FK_saldosDistribucion_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[saldosDistribucion] CHECK CONSTRAINT [FK_saldosDistribucion_objectTypes]
GO
ALTER TABLE [dbo].[saldosDistribucion]  WITH CHECK ADD  CONSTRAINT [FK_saldosDistribucion_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[saldosDistribucion] CHECK CONSTRAINT [FK_saldosDistribucion_productores]
GO
ALTER TABLE [dbo].[saldosPorItem]  WITH CHECK ADD  CONSTRAINT [FK_saldosPorFactura_facturasContaminantes] FOREIGN KEY([itemContId])
REFERENCES [dbo].[itemsContaminantes] ([itemContId])
GO
ALTER TABLE [dbo].[saldosPorItem] CHECK CONSTRAINT [FK_saldosPorFactura_facturasContaminantes]
GO
ALTER TABLE [dbo].[saldosPorItem]  WITH CHECK ADD  CONSTRAINT [FK_saldosPorFactura_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[saldosPorItem] CHECK CONSTRAINT [FK_saldosPorFactura_objectTypes]
GO
ALTER TABLE [dbo].[saldosPorItem]  WITH CHECK ADD  CONSTRAINT [FK_saldosPorFactura_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[saldosPorItem] CHECK CONSTRAINT [FK_saldosPorFactura_productores]
GO
ALTER TABLE [dbo].[tarifasActores]  WITH CHECK ADD  CONSTRAINT [FK_tarifasActores_actoresContratoProd] FOREIGN KEY([deudorId])
REFERENCES [dbo].[actoresContratoProd] ([actorId])
GO
ALTER TABLE [dbo].[tarifasActores] CHECK CONSTRAINT [FK_tarifasActores_actoresContratoProd]
GO
ALTER TABLE [dbo].[tarifasActores]  WITH CHECK ADD  CONSTRAINT [FK_tarifasActores_actoresContratoProd1] FOREIGN KEY([acreedorId])
REFERENCES [dbo].[actoresContratoProd] ([actorId])
GO
ALTER TABLE [dbo].[tarifasActores] CHECK CONSTRAINT [FK_tarifasActores_actoresContratoProd1]
GO
ALTER TABLE [dbo].[tarifasActores]  WITH CHECK ADD  CONSTRAINT [FK_tarifasActores_contratosProduccion] FOREIGN KEY([prodContratoId])
REFERENCES [dbo].[contratosProduccion] ([prodContratoId])
GO
ALTER TABLE [dbo].[tarifasActores] CHECK CONSTRAINT [FK_tarifasActores_contratosProduccion]
GO
ALTER TABLE [dbo].[tarifasActores]  WITH CHECK ADD  CONSTRAINT [FK_tarifasActores_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[tarifasActores] CHECK CONSTRAINT [FK_tarifasActores_monedas]
GO
ALTER TABLE [dbo].[tarifasActores]  WITH CHECK ADD  CONSTRAINT [FK_tarifasActores_objectTypes] FOREIGN KEY([objectTypeDeudor])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[tarifasActores] CHECK CONSTRAINT [FK_tarifasActores_objectTypes]
GO
ALTER TABLE [dbo].[tarifasActores]  WITH CHECK ADD  CONSTRAINT [FK_tarifasActores_objectTypes1] FOREIGN KEY([objectTypeAcreedor])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[tarifasActores] CHECK CONSTRAINT [FK_tarifasActores_objectTypes1]
GO
ALTER TABLE [dbo].[tiposDeCambio]  WITH CHECK ADD  CONSTRAINT [FK_tiposDeCambio_monedas] FOREIGN KEY([monedaBaseId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[tiposDeCambio] CHECK CONSTRAINT [FK_tiposDeCambio_monedas]
GO
ALTER TABLE [dbo].[tiposDeCambio]  WITH CHECK ADD  CONSTRAINT [FK_tiposDeCambio_monedas1] FOREIGN KEY([monedaCambioId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[tiposDeCambio] CHECK CONSTRAINT [FK_tiposDeCambio_monedas1]
GO
ALTER TABLE [dbo].[tiposDesechos]  WITH CHECK ADD  CONSTRAINT [FK_tiposDesechos_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[tiposDesechos] CHECK CONSTRAINT [FK_tiposDesechos_traduccionesNombres]
GO
ALTER TABLE [dbo].[tiposEventosViajesReci]  WITH CHECK ADD  CONSTRAINT [FK_tiposEventosViajesReci_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[tiposEventosViajesReci] CHECK CONSTRAINT [FK_tiposEventosViajesReci_traduccionesNombres]
GO
ALTER TABLE [dbo].[tiposItems]  WITH CHECK ADD  CONSTRAINT [FK_tiposFactura_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[tiposItems] CHECK CONSTRAINT [FK_tiposFactura_traduccionesNombres]
GO
ALTER TABLE [dbo].[traduccionesPorIdioma]  WITH CHECK ADD  CONSTRAINT [FK_traduccionesPorIdioma_idiomas] FOREIGN KEY([idiomaId])
REFERENCES [dbo].[idiomas] ([idiomaId])
GO
ALTER TABLE [dbo].[traduccionesPorIdioma] CHECK CONSTRAINT [FK_traduccionesPorIdioma_idiomas]
GO
ALTER TABLE [dbo].[traduccionesPorIdioma]  WITH CHECK ADD  CONSTRAINT [FK_traduccionesPorIdioma_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[traduccionesPorIdioma] CHECK CONSTRAINT [FK_traduccionesPorIdioma_traduccionesNombres]
GO
ALTER TABLE [dbo].[tratamientos]  WITH CHECK ADD  CONSTRAINT [FK_tratamientos_traduccionesNombres] FOREIGN KEY([nombreId])
REFERENCES [dbo].[nombres] ([nombreId])
GO
ALTER TABLE [dbo].[tratamientos] CHECK CONSTRAINT [FK_tratamientos_traduccionesNombres]
GO
ALTER TABLE [dbo].[viajesRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_viajesRecoleccion_contactos] FOREIGN KEY([choferId])
REFERENCES [dbo].[contactos] ([contactoId])
GO
ALTER TABLE [dbo].[viajesRecoleccion] CHECK CONSTRAINT [FK_viajesRecoleccion_contactos]
GO
ALTER TABLE [dbo].[viajesRecoleccion]  WITH CHECK ADD  CONSTRAINT [FK_viajesRecoleccion_pasosRecoleccion] FOREIGN KEY([recPasoId])
REFERENCES [dbo].[pasosRecoleccion] ([recPasoId])
GO
ALTER TABLE [dbo].[viajesRecoleccion] CHECK CONSTRAINT [FK_viajesRecoleccion_pasosRecoleccion]
GO
USE [master]
GO
ALTER DATABASE [esencialverde] SET  READ_WRITE 
GO
