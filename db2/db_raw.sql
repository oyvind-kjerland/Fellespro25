create schema kalendersystem;

create table user (
    username varchar(15) not null,
    password varchar(45) not null,
    first_name varchar(45) not null,
    sur_name varchar(45) not null,
    mail varchar(45) not null,
    phone char(12) not null,
    primary key (username)
    );

create table group (
    groupname varchar(15) not null,
    parent_groupname varchar(15),
    primary key (groupname),
    constraint subgroup foreign key parent_groupname references group(groupname)
    	on update cascade
    );

create table appointment (
    id int not null auto_increment,
    starttime datetime not null,
    endtime datetime not null,
    description varchar(255),
    location varchar(45),
    responsible_username varchar(15) not null,
    primary key (id),
    constraint responsible foreign key (responsible_username) references user(username)
    	on delete cascade
    	on update cascade
    );

create table meetingroom (
    roomnumber varchar(45) not null,
    capacity int not null,
    primary key (roomnumber)
    );

create table notification (
    appointmentID int 
    type varchar(15)
    description varchar(255)
	);

create table participant (
	username varchar(45) not null,
	id int not null,
	status varchar(45),
	hidden boolean,
	alarm int,
	primary key(username, id),
	constraint user_participant foreign key username references user(username)
		on delete cascade
		on update cascade,
	constraint appointment_participant foreign key id references appointment(id)
		on delete cascade
		on update cascade
	);

create table member (
	groupname varchar(15) not null,
	username varchar(15) not null,
	primary key (groupname, username),
	constraint member_username foreign key username references user(username)
		on delete cascade
		on update cascade,
	constraint member_of_group foreign key groupname references group(groupname)
		on delete cascade
		on update cascade
	);