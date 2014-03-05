create schema kalendersystem

create table user (
    username varchar(255) not null,
    password varchar(255) not null,
    first_name varchar(255) not null,
    sur_name varchar(255) not null,
    mail varchar(255) not null,
    phone char(12) not null,
    primary key (username),
    foreign key ()
    );

create table group (
    groupname varchar(255) not null,
    primary key (groupname)
    );

create table appointment (
    id int not null auto_increment,
    starttime datetime not null,
    endtime datetime not null,
    description varchar(255),
    location varchar(255),
    primary key (id)
    );

create table meetingroom (
    roomnumber varchar(255) not null,
    address varchar(255) not null,
    capacity int not null,
    primary key (roomnumber, address)
    );

create table notification (
    appointmentID int 

create table participant {
	username varchar(255) not null,
	id int not null,
	status varchar(255),
	hidden boolean,
	alarm int,
	primary key(username, id),
	}

