/*==============================================================================
    DATA WAREHOUSE - BRONZE LAYER
    Purpose:
        Create Bronze-layer tables for CRM and ERP source data.

    Bronze Layer:
        Stores raw source data with minimal transformation.
==============================================================================*/


USE DataWarehouse;
GO


/*==============================================================================
    CRM TABLES
==============================================================================*/


/*------------------------------------------------------------------------------
    CRM Customer Information
    Source File: cust_info.csv
------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info
(
    cst_id             INT,
    cst_key            NVARCHAR(50),
    cst_firstname      NVARCHAR(50),
    cst_lastname       NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr           NVARCHAR(50),
    cst_create_date    DATE
);
GO


/*------------------------------------------------------------------------------
    CRM Sales Details
    Source File: sales_details.csv
------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details
(
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt DATE,
    sls_ship_dt  DATE,
    sls_due_dt   DATE,
    sls_sales    DECIMAL(18,2),
    sls_quantity INT,
    sls_price    DECIMAL(18,2)
);
GO


/*------------------------------------------------------------------------------
    CRM Product Information
    Source File: prd_info.csv
------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info
(
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(100),
    prd_cost     DECIMAL(18,2),
    prd_line     NVARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt   DATE
);
GO


/*==============================================================================
    ERP TABLES
==============================================================================*/


/*------------------------------------------------------------------------------
    ERP Product Category
    Source File: PX_CAT_G1V2.csv
------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2
(
    ID          NVARCHAR(50),
    CAT         NVARCHAR(50),
    SUBCAT      NVARCHAR(100),
    MAINTENANCE NVARCHAR(50)
);
GO


/*------------------------------------------------------------------------------
    ERP Customer Location
    Source File: LOC_A101.csv
------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101
(
    CID   NVARCHAR(50),
    CNTRY NVARCHAR(100)
);
GO


/*------------------------------------------------------------------------------
    ERP Customer Information
    Source File: CUST_AZ12.csv
------------------------------------------------------------------------------*/

DROP TABLE IF EXISTS bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12
(
    CID   NVARCHAR(50),
    BDATE DATE,
    GEN   NVARCHAR(50)
);
GO


/*==============================================================================
    BRONZE LAYER COMPLETE
==============================================================================*/

PRINT 'Bronze layer tables created successfully.';
GO
