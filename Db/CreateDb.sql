SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ChildEntity](
	[Id] [int] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[ParentEntityId] [int] NOT NULL,
 CONSTRAINT [PK_ChildEntity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ExtensionEntity](
	[ChildEntityId] [int] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ExtensionEntity] PRIMARY KEY CLUSTERED 
(
	[ChildEntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ParentEntity](
	[Id] [int] NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ParentEntity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [ChildEntity] ([Id], [Value], [ParentEntityId]) VALUES (1, N'Child 1 1', 1)
GO
INSERT [ChildEntity] ([Id], [Value], [ParentEntityId]) VALUES (2, N'Child 1 2', 1)
GO
INSERT [ChildEntity] ([Id], [Value], [ParentEntityId]) VALUES (3, N'Child 2 1', 2)
GO
INSERT [ExtensionEntity] ([ChildEntityId], [Value]) VALUES (2, N'Extension of Child 1 2')
GO
INSERT [ParentEntity] ([Id], [Value]) VALUES (1, N'Parent 1')
GO
INSERT [ParentEntity] ([Id], [Value]) VALUES (2, N'Parent 2')
GO
INSERT [ParentEntity] ([Id], [Value]) VALUES (3, N'Parent 3')
GO
ALTER TABLE [ChildEntity]  WITH CHECK ADD  CONSTRAINT [FK_ChildEntity_ParentEntity] FOREIGN KEY([ParentEntityId])
REFERENCES [ParentEntity] ([Id])
GO
ALTER TABLE [ChildEntity] CHECK CONSTRAINT [FK_ChildEntity_ParentEntity]
GO
ALTER TABLE [ExtensionEntity]  WITH CHECK ADD  CONSTRAINT [FK_ExtensionEntity_ChildEntity] FOREIGN KEY([ChildEntityId])
REFERENCES [ChildEntity] ([Id])
GO
ALTER TABLE [ExtensionEntity] CHECK CONSTRAINT [FK_ExtensionEntity_ChildEntity]
GO
