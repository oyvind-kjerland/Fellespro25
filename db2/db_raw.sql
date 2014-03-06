create database cal;

use cal;

create table user (
    username varchar(15) not null,
    password varchar(45) not null,
    first_name varchar(45) not null,
    last_name varchar(45) not null,
    mail varchar(45) not null,
    phone char(12) not null,
    primary key (username)
    );

create table group_table (
    groupname varchar(15) not null,
    parent_groupname varchar(15),
    primary key (groupname),
    constraint subgroup foreign key (parent_groupname) references group_table(groupname)
    	on update cascade
    );

create table meetingroom (
    roomnumber varchar(45) not null,
    capacity int not null,
    primary key (roomnumber),
    ); 

create table appointment (
    id int not null auto_increment,
    starttime datetime not null,
    endtime datetime not null,
    description varchar(255),
    location varchar(45),
    responsible_username varchar(15) not null,
    roomnumber varchar(45),
    primary key (id),
    constraint reservation foreign key (roomnumber) references meetingroom(roomnumber)
    	on delete cascade
    	on update cascade,
    constraint responsible foreign key (responsible_username) references user(username)
    	on delete cascade
    	on update cascade
    );

create table notification (
    id int,
    type varchar(15),
    description varchar(255),
    appointmentId int not null,
    primary key (id),
    constraint belonging_to foreign key (appointmentId) references appointment(id)
        on delete cascade
        on update cascade
	);

create table user_notification (
    notificationId int not null,
    username varchar(15) not null,
    primary key (notificationId, username),
    constraint user_notification_n foreign key (notificationId) references notification(id)
        on delete cascade
        on update cascade,
    constraint user_notification_u foreign key (username) references user(username)
        on delete cascade
        on update cascade
);

create table participant (
	username varchar(45) not null,
	id int not null,
	status varchar(45),
	hsidden boolean,
	alarm int,
	primary key(username, id),
	constraint user_participant foreign key (username) references user(username)
		on delete cascade
		on update cascade,
	constraint appointment_participant foreign key (id) references appointment(id)
		on delete cascade
		on update cascade
	);

create table member (
	groupname varchar(15) not null,
	username varchar(15) not null,
	primary key (groupname, username),
	constraint member_username foreign key (username) references user(username)
		on delete cascade
		on update cascade,
	constraint member_of_group foreign key (groupname) references group_table(groupname)
		on delete cascade
		on update cascade
	);
