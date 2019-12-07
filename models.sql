
/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
CREATE table Customer (
   Id                   int                  ,
   FirstName            varchar(40)         not null,
   LastName             varchar(40)         not null,
   City                 varchar(40)         null,
   Country              varchar(40)         null,
   Phone                varchar(20)         null,
   constraint PK_CUSTOMER primary key (Id)
);

/*==============================================================*/
/* Index: IndexCustomerName                                     */
/*==============================================================*/
CREATE index IndexCustomerName on Customer (
LastName ASC,
FirstName ASC
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
CREATE table "Order" (
   Id                   int                  ,
   OrderDate            text             not null,
   OrderNumber          varchar(10)         null,
   CustomerId           int                  not null,
   TotalAmount          decimal(12,2)        null default 0,
   constraint PK_ORDER primary key (Id)
);


/*==============================================================*/
/* Index: IndexOrderCustomerId                                  */
/*==============================================================*/
CREATE index IndexOrderCustomerId on "Order" (
CustomerId ASC
);


/*==============================================================*/
/* Index: IndexOrderOrderDate                                   */
/*==============================================================*/
CREATE index IndexOrderOrderDate on "Order" (
OrderDate ASC
);


/*==============================================================*/
/* Table: OrderItem                                             */
/*==============================================================*/
CREATE table OrderItem (
   Id                   int                  ,
   OrderId              int                  not null,
   ProductId            int                  not null,
   UnitPrice            decimal(12,2)        not null default 0,
   Quantity             int                  not null default 1,
   constraint PK_ORDERITEM primary key (Id)
);


/*==============================================================*/
/* Index: IndexOrderItemOrderId                                 */
/*==============================================================*/
CREATE index IndexOrderItemOrderId on OrderItem (
OrderId ASC
);


/*==============================================================*/
/* Index: IndexOrderItemProductId                               */
/*==============================================================*/
CREATE index IndexOrderItemProductId on OrderItem (
ProductId ASC
);


/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
CREATE table Product (
   Id                   int                  ,
   ProductName          varchar(50)         not null,
   SupplierId           int                  not null,
   UnitPrice            decimal(12,2)        null default 0,
   Package              varchar(30)         null,
   IsDiscontinued       int                  not null default 0,
   constraint PK_PRODUCT primary key (Id)
);


/*==============================================================*/
/* Index: IndexProductSupplierId                                */
/*==============================================================*/
CREATE index IndexProductSupplierId on Product (
SupplierId ASC
);


/*==============================================================*/
/* Index: IndexProductName                                      */
/*==============================================================*/
CREATE index IndexProductName on Product (
ProductName ASC
);


/*==============================================================*/
/* Table: Supplier                                              */
/*==============================================================*/
CREATE table Supplier (
   Id                   int                  ,
   CompanyName          varchar(40)         not null,
   ContactName          varchar(50)         null,
   ContactTitle         varchar(40)         null,
   City                 varchar(40)         null,
   Country              varchar(40)         null,
   Phone                varchar(30)         null,
   Fax                  varchar(30)         null,
   constraint PK_SUPPLIER primary key (Id)
);


/*==============================================================*/
/* Index: IndexSupplierName                                     */
/*==============================================================*/
CREATE index IndexSupplierName on Supplier (
CompanyName ASC
);


/*==============================================================*/
/* Index: IndexSupplierCountry                                  */
/*==============================================================*/
CREATE index IndexSupplierCountry on Supplier (
Country ASC
);


ALTER table "Order" add constraint FK_ORDER_REFERENCE_CUSTOMER foreign key (CustomerId) references Customer (Id);


ALTER table OrderItem add constraint FK_ORDERITE_REFERENCE_ORDER foreign key (OrderId) references "Order" (Id);


ALTER table OrderItem add constraint FK_ORDERITE_REFERENCE_PRODUCT foreign key (ProductId) references Product (Id);


ALTER table Product add constraint FK_PRODUCT_REFERENCE_SUPPLIER foreign key (SupplierId) references Supplier (Id);


