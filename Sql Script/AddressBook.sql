show databases;
use addressbookservice;
  /* TO CREATE TABLE */
create table addressbook (
BookId int(5) not null unique key auto_increment,
firstName VARCHAR(29) NOT NULL, 
lastName VARCHAR(20) NOT NULL,     
address VARCHAR(60) NOT NULL, 
city VARCHAR(10) NOT NULL, 
state VARCHAR(20) NOT NULL, 
zip INT(6) ,
phoneNumber VARCHAR(10) ) ;
describe addressbook;
Insert Into addressbook(firstName , lastName , address , city , State , Zip, phoneNumber)
values('Kuldeep' , 'Pandey' , '212,DeepmalaComplex' , 'Vapi' , 'Gujarat' , 396195 , '9723846921'),
('Priti' , 'Rai' , '309,NakastraComplex' , 'Valsad' , 'Gujarat' , 396191 , '8128273574');
select * from addressbook;
update addressbook 
Set FirstName = 'Manoj' , phonenumber = '9786756878'
where bookId = 2;
select * from addressbook;
SET SQL_SAFE_UPDATES = 0;
delete from addressbook 
where FirstName = 'Manoj';
select * from addressbook;
Insert Into addressbook(firstName , lastName , address , city , State , Zip, phoneNumber)
values('Rahul' , 'Mane' , '212,ShantiComplex' , 'Thane' , 'Mumbai' , 400032, '9723854531'),
('Raj' , 'Patel' , 'ShantiVilla' , 'Naqpur' , 'maharastra' , 443032, '972385667');
/*Count*/
Select * from addressbook
where city = 'vapi';
select count(Bookid) As total_size from Addressbook;
/*Sort*/
Select * from addressbook
Order by firstName Asc;
/* adding name and type  */
Alter table addressbook 
Add column relation varCHAR(30) AFTER zip;
alter table addressbook
add column name varchar(50) after zip;
update addressbook 
set name = 'vishnu' , relation = 'friend'
where bookid  = 1  ;
update addressbook 
set name = 'vishnu' , relation = 'Family'
where bookid  = 3  ;
update addressbook 
set name = 'Ram' , relation = 'freind'
where bookid  = 4  ;
select * from addressbook;
select count(relation) from addressbook;
Insert into addressbook(firstName , lastName , address , city   , State , Zip, name , relation, phoneNumber)
values('Bunty' , 'Sinha' ,'Shanti appartment', 'Vapi' , 'Gujarat ' , 396195 , 'chikku' , 'Family' , '9887567867' );
select * from addressbook;


create table person(
personId int(10) Auto_increment,
firstname varchar(50),
lastName varchar(50),
primary key (personId));
desc person;

insert into person(firstName , lastName)
values('Kuldeep' , 'Pandey'),
('Manoj' , 'Nadar'),
('Priti' , 'Rai'),
('Rahul' , 'Mane');
Select * from person;

Create table PersonAddress(
AddressID int(10) primary key auto_increment,
city varchar(50),
State varchar(50), 
PhoneNumber varchar(10),
Address varchar(250),
Zip int(6) not null );
desc personAddress;

Insert into personAddress(AddressID , city ,state , phonenumber , address , Zip)
values(101 , 'vapi' , 'Gujarat' , '9723846921' , '212,deepmalaComplex' , 396195);
Insert into personAddress(city ,state , phonenumber , address , Zip)
values('bhavanagr' , 'Gujarat' , '8128273574' , 'Plotno.32 jewels circle' , 364002);
Insert into personAddress(city ,state , phonenumber , address , Zip)
values('Vidhyanagar' , 'Gujarat' , '8128256674' , 'Plotno.36 vidyanagar' , 365002),
('vadodra' , 'Gujarat' , '9875666754' , 'Bunglow no.43 ShantiVilla' , 345001);
select *from personAddress;

create table connection (
PersonId int(10) Not Null , 
AddressId int(10) Not null  ,
Foreign Key(PersonId) References person(personId),
Foreign key(AddressId) references PersonAddress(Addressid),
primary key(PersonId , AddressId));

Insert into connection values(1,101),
                             (1,102),
							 (2,103),
                             (3,104),
                             (4,104);
							 
select * from connection;
select person.personId , person.Firstname , Person.LastName , personAddress.addressid , personAddress.city , personAddress.state ,
personAddress.address,personAddress.phonenumber ,personAddress.zip from person
join connection on (person.personid = connection.personid)
join personaddress on (personAddress.addressid = connection.addressid);


                             











 









