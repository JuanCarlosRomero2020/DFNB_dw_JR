USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadAccountCustomerDim]    Script Date: 3/24/2021 11:37:05 PM ******/
DROP PROCEDURE [dbo].[usp_LoadAccountCustomerDim]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadAccountCustomerDim]    Script Date: 3/24/2021 11:37:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_LoadAccountCustomerDim]
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadAccountCustomerDim
PURPOSE: Load the Account Customer Dimension
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------

1.0     11/12/2019   JJAUSSI       1. Built this table for LDS BC IT240
1.1     03/12/2021   JJAUSSI       1. Added PK and NOT NULL contraints

RUNTIME: 

NOTES:



LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

     
BEGIN

    -- 1) Truncate existing data

    TRUNCATE TABLE dbo.tblAccountCustomerDim;

    -- 2) Reload data

    INSERT INTO dbo.tblAccountCustomerDim
           SELECT DISTINCT 
                  s.acct_id, 
                  s.cust_id, 
                  s.acct_cust_role_id
           FROM dbo.stg_p1 AS s
           ORDER BY s.acct_id;
END;   
GO

