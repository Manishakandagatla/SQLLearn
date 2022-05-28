/*CREATING DATABASE*/
CREATE DATABASE sample

/*ALTER DATABSE NAME*/
ALTER DATABASE SAMPLE modify name = sample1

/*USING STORED PROCEDURES*/
sp_renameDB 'sample1','sample2'

/*Drop(delete) Database*/
drop database sample2
Note:whenever deleting a database that DB should not be in use

/*CREATE TABLE*/
create table tblGender
(
ID int NOT NULL Primary Key,
Gender nvarchar(50) NOT NULL
)

/*If a query is executed in different database and to execute that query in sample database use SAMPLE*/
use [sample]
Go

/* update GenderID as foreignkey using query*/
alter table tblperson add constraint tblperson_GenderID_FK
Foreign key (GenderID) references tblGender(ID)

/*Select query*/
select * from tblGender
select * from tblPerson

/*Insert Query*/
insert into tblPerson (ID, Name, Email) values (3, 'simon','s@s.com')
insert into tblPerson (ID, Name, Email) values (4, 'sam','sam@sam.com')
insert into tblPerson (ID, Name, Email) values (5, 'may','m@m.com')
insert into tblPerson (ID, Name, Email) values (6, 'kenny','k@sk.com')
insert into tblPerson (ID, Name, Email) values (7, 'rich','r@r.com')

update [tblPerson] set GenderID='2' where Name='Mary'
update [tblPerson] set GenderID='1' where Name='simon'
update [tblPerson] set GenderID='1' where Name='sam'
update [tblPerson] set GenderID='2' where Name='may'
update [tblPerson] set GenderID='3' where Name='kenny'
update [tblPerson] set GenderID='2' where Name='Mary'
update [tblGender] set Gender='Male' where ID='1'
update [tblGender] set Gender='Female' where ID='2'
update [tblGender] set Gender='Unknown' where ID='3'


alter table tblGender
drop column Gender

Alter table tblGender
Add Gender nvarchar(50);

/*adding value in replacing NULL in GenderID name rich*/
alter table tblPerson
ADD CONSTRAINT [Default_tblPerson_GenderID]
DEFAULT 3 FOR GenderID

insert into tblPerson (ID, Name, Email) values (8, 'Mike', 'mike@r.com')
insert into tblPerson (ID, Name, Email) values (9, 'sara', 'sara@r.com',3)
insert into tblPerson (ID, Name, Email) values (10, 'Johnny', 'j@r.com',NULL )

/*Drop Constraint*/
alter table tblPerson
drop constraint [DF_tblperson_GenderID]

/*PART-5: CASCADING REFERENTIAL INTEGRITY CONSTRAINT*/
select * from tblGender
select * from tblPerson

delete from tblGender where ID=2/*set default*/
delete from tblGender where ID=3 /*set NULL in keys-tblperson genderid FK->relationships-insert and update*/
delete from tblGender where ID=1 /*set cascade*/

/*PART6-CHECK CONSTRAINT*/
select * from tblPerson
select * from [dbo].[tblGender]
Alter table tblPerson
Add Age int;

insert into tblPerson values(11, 'theja', 't@t.com',1, 150)

delete from tblPerson where id=10

insert into tblGender values(2,'female')
insert into tblGender values(3,'unknown')

delete from tblPerson where ID=10

alter table tblperson
add constraint ck_AgeConstraint check (Age>0 AND Age<=150)






