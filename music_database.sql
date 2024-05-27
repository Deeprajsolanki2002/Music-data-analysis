Create database Music_Store;
USE Music_Store;
SELECT *FROM employee;
DROP TABLE employee ;
Select *from employee;
CREATE TABLE album(
album_id INT,
title varchar(255),
artist_id int
);
Select *from playlist;

ALTER table employee MODIFY employee_id int NOT NULL;
ALTER TABLE customer MODIFY customer_id int PRIMARY KEY UNIQUE not null; 
ALTER TABLE invoice MODIFY invoice_id int PRIMARY KEY UNIQUE not null; 
ALTER TABLE invoice_line MODIFY invoice_line_id int PRIMARY KEY UNIQUE not null; 
DROP TABLE INVOICE_LINE;
ALTER TABLE track MODIFY track_id int PRIMARY KEY ; 
ALTER TABLE playlist MODIFY playlist_id int PRIMARY KEY UNIQUE not null; 
ALTER TABLE artist MODIFY artist_id int PRIMARY KEY UNIQUE not null; 
ALTER TABLE media_type MODIFY media_type_id int PRIMARY KEY UNIQUE not null; 
ALTER TABLE invoice add constraint foreign key (Customer_id) references customer(customer_id);
ALTER TABLE customer add constraint foreign key (support_rep_id) references employee(employee_id);
ALTER TABLE invoice_line add constraint foreign key (invoice_id) references invoice(invoice_id);
ALTER TABLE track add constraint foreign key (track_id) references invoice_line(track_id);
desc invoice_line;
ALTER TABLE invoice_line modify column track_id int;
desc track;
alter table track drop primary key;
alter table track drop index track_id;
Alter table playlist_track add constraint foreign key(track_id) references invoice_line(track_id);
alter table playlist_track drop primary key;
alter table playlist_track drop index playlist_track_id;
desc playlist_track;
desc TRACK;
drop table invoice_line;
select count(*) from invoice_line;
SET SQL_SAFE_UPDATES = 0;
delete from track where track_id=3503;
select track_id from track order by track_id desc;
drop table track;
select count(*) from track;

create table track(
track_id int primary key,
track_name varchar(255),
album_id int,
media_type_id int,
genre_id int,
composer varchar(255) default NULL,
milliseconds int,
bytes int,
unit_price float
);

select * from track;
select count(*) from 
(select t.track_id from track as t left join invoice_line as I using (track_id) where I.track_id is NULL) temp;
select t.track_id from track as t left join invoice_line as I using (track_id) where I.track_id is NULL;

Delete from track where track_id in (select tra from(select t.track_id as  tra from track as t left join invoice_line as I using (track_id) where I.track_id is NULL) as temp);

ALTER TABLE playlist add constraint foreign key (playlist_id) references playlist_track(playlist_id);
ALTER TABLE artist add constraint foreign key (artist_id) references album(artist_id);



