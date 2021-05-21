
--- create database  &  Tables -----

create database Split

create table Rough (Id int Identity , Upload nvarchar(100) , Primary key (Id))

create table Hockey_Team (Id int identity , Team nvarchar(20) , Country nvarchar(20) , NameF nvarchar(30) ,NameL nvarchar(25) , Weight int ,Height 
nvarchar(5) , DOB date , Hometown nvarchar(25) , Prov nvarchar(10) , Pos nvarchar(15) , Age int ,HeightFt float ,HtIn
float ,BMI int  , primary key (Id) )


--- create trigger ----

create trigger insertintoHockey
on Rough
after insert
as
begin

insert into Hockey_Team (Team , Country , NameF , NameL , Weight , Height , DOB , Hometown , Prov , Pos , Age , HeightFt , HtIn , BMI)
select ISNULL([up1],'') as [Team] , ISNULL([up2],'') as [country] ,ISNULL([up3],'') as [namef] ,ISNULL([up4],'') as [namel] ,ISNULL([up5],'') as [weight] ,
ISNULL([up6],'') as [height] ,ISNULL([up7],'') as [dob] ,ISNULL([up8],'') as [hometown] ,ISNULL([up9],'') as [prov] ,ISNULL([up10],'') as [pos] ,ISNULL([up11],'') as [age] ,
ISNULL([up12],'') as [heightft] ,ISNULL([up13],'') as [htln] ,ISNULL([up14],'') as [bmi]  from (
select Id ,'up' + cast (ROW_NUMBER () Over (Partition By Id order By Id) as varchar ) as col , Split.value from Rough as data cross apply string_split (Upload,',') as split 
 ) as tbl   
 pivot (max (value) for col in ([up1],[up2],[up3],[up4],[up5],[up6],[up7],[up8],[up9],[up10],[up11],[up12],[up13],[up14]) ) as pvt

 end

 create trigger truncaterought
 on Hockey_Team
 after insert
 as
 begin

 Truncate table Rough

 end


 ---  create Stored Procedure----

 create Proc insertintorough @Upload nvarchar(100)
 as
 begin

 insert into Rough (Upload) values (@Upload)

 end

 ----------------------------  Sql part Over --------------------




























































































