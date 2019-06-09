

--user's table
create table users(
username varchar(50) unique not null,
passwrod varchar(50) not null,
name varchar(50) not null,
email varchar(50) not null,
dob varchar(50),
primary key (username)
)

--all movie database
create table movieDataBase
(
id int IDENTITY (1,1) not null, 
name varchar(50) not null,
rating float not null,
gener varchar(100),
imageName varchar(20),
primary key (id)
)

--user's liked/disliked movie
create table userMovie
(
id int identity (1,1) not null, 
movieId int not null,
username varchar(50) not null,
status int not null,   --1 for liked and 0 for disliked
primary key(id)
)



create table LikedGener
(
id int identity(1,1) not null,
username varchar(50) not null,
gener varchar(50) not null,
count int default 0 ,
primary key(id)
)



create table DislikedGener
(
id int identity(1,1) not null,
username varchar(50) not null,
gener varchar(50) not null,
count int default 0 ,
primary key(id)
)


create table recommendedGener
(
id int identity (1,1) not null,
gener varchar(50) not null,
weight int not null,
primary key(id)
)


create table tempRecommended
(
id int identity(1,1) not null,
movieId int not null,
primary key (id)
)







-- store procedures
go
create procedure SignUp
@Username varchar(50),
@pass varchar(50),
@Name varchar(50),
@email varchar(50),
@Dob varchar(50)
as
insert into users(name,username,passwrod,email,dob) values(@Name,@Username,@pass,@email,@Dob)

go
create procedure logIn
@username varchar(50),
@pass varchar(50),
@count int output
as
select @count = COUNT(*) from users where username=@username and passwrod=@pass 


go
create procedure userInfo
@username varchar(50)
as
select * from users where username=@username


go
create procedure movieLiked
@name varchar(50),
@movie_name varchar(50)
as
declare @i int
select @i = id from movieDataBase where @movie_name = Imagename
insert into userMovie (movieId,status,username) values(@i,1,@name)  



go
create procedure movieDisLiked
@name varchar(50),
@movie_name varchar(50)
as
declare @i int
select @i = id from movieDataBase where @movie_name = Imagename
insert into userMovie (movieId,status,username) values(@i,0,@name)  



go
create procedure topRated
@name varchar(50)
as
select distinct m.imageName, m.name, rating from movieDataBase m
where m.id not in 
(
	select u.movieId from userMovie u where u.username = @name

)
order by rating DESC



go
create procedure userLiked
@name varchar(50)
as
select m.imageName,m.name,u.status from userMovie u, movieDataBase m
where m.id=u.movieId
order by status desc


go
create procedure userLikedGener
@name varchar(50)
as
select gener from movieDataBase m, userMovie u 
where u.username = @name and m.id = u.movieId
and u.status = 1


go
create procedure userDislikedGener
@name varchar(50)
as
select gener from movieDataBase m, userMovie u 
where u.username = @name and m.id = u.movieId
and u.status = 0



go
create procedure RemoveChoice
@name varchar(50),
@image_name varchar(50)
as
declare @id int
select @id = id from movieDataBase where @image_name = movieDataBase.imageName
delete from userMovie where movieId = @id and username = @name


go
create procedure saveLikedGener
@name varchar(50),
@gene varchar(50),
@count int
as
insert into LikedGener(username,gener,count) values (@name, @gene, @count)



go
create procedure saveDislikedGener
@name varchar(50),
@gene varchar(50),
@count int
as
insert into DislikedGener(username,gener,count) values (@name, @gene, @count)


go
create procedure clearData
@name varchar(50)
as
delete from LikedGener
delete from DislikedGener
delete from recommendedGener 
delete from tempRecommended



go
create procedure getRecommendedGener
@name varchar(50)
as
select l.gener,(l.count-ISNULL(d.count/2,0))as coun  from LikedGener as l left outer join DislikedGener as d on l.gener = d.gener
order by coun desc



go
create procedure insertRecommendedGener
@gener varchar(50),
@weight int
as 
insert into recommendedGener (weight,gener) values (@weight,@gener)




go
create procedure populateUselessTable
as
insert into tempRecommended (movieId)
(select distinct m.id from recommendedGener r, movieDataBase m 
where r.weight > 0 and m.gener like '%'+r.gener+'%')
delete from tempRecommended 
where movieId in (select distinct m.id from recommendedGener r, movieDataBase m 
where r.weight < 0 and m.gener like '%'+r.gener+'%')



go
create procedure Recommended
@name varchar(50)
as
select distinct m.imageName, m.name, rating from movieDataBase m, tempRecommended t
where m.id = t.movieId and  m.id not in 
(
	select u.movieId from userMovie u where u.username = @name
)



-- creating movie database
insert into movieDataBase (name,rating,gener,imageName) values ('the avengers',	8.2, 'Action, Adventure, Sci-Fi','1.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('casino royale',8,'Action, Adventure, Thriller','2.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('transporter',6.8,'Action, Crime, Thriller'	,'3.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('robocop',6.3,'Action, Sci-Fi, Thriller','4.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('captain america',6.8,'Action, Adventure, Sci-Fi','5.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('horrible bosses',6.9,'Comedy, Crime','6.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('21 jump street',7.2,'Action, Comedy, Crime','7.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('dumb and dumber to',5.9,'Comedy','8.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('now you see me',7.3,'Crime, Mystery, Thriller','9.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('escape plan',6.8,'Action, Mystery, Thriller','10.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('elysium',6.7,'Action, Drama, Sci-Fi','11.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('white house down',6.4,'Action, Drama, Thriller','12.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('the fault in our stars',8,'Drama, Romance','13.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Robot & Frank',7.1,'Comedy, Crime, Drama','14.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('wall-e',8.4,'Animation, Adventure, Sci-Fi','15.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('lucy',6.4,'Action, Sci-Fi, Thriller','16.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('interstellar',8.7,'Adventure, Sci-Fi','17.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('big hero 6',7.9,'Animation, Action, Adventure','18.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('edge of tomorrow',7.9,	'Action, Sci-Fi','19.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('ratatouille',8,'Animation, Comedy, Family','20.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('the imitation game',8.1,'Biography, Drama, Thriller','21.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('planes',5.7,'Animation, Adventure, Comedy','22.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('the lorax',6.5,'Animation, Comedy, Family','23.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('the maze runner',6.9,'Action, Mystery, Sci-Fi','24.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('the giver',6.5,'Drama, Sci-Fi','25.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('divergent',6.8,'Adventure, Sci-Fi, Thriller','26.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('the A-team',6.8,'Action, Adventure, Comedy','27.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('the incredibles',8,'Animation, Action, Adventure','28.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('turbo',6.5,'Animation, Adventure, Comedy','29.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('need for speed',6.6,'Action, Crime, Drama','30.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('fast and furious 7',7.9,'Action, Crime, Thriller','31.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('rio',7,'Animation, Adventure, Comedy','32.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('kung fu panda',7.6,'Animation, Action, Adventure','33.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('the shawshank redemption',9.3,'Crime, Drama','34.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('upside down',6.4,'Drama, Fantasy, Romance','35.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('fifty shades of grey',4.2,'Drama, Romance','36.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('the croods',7.3,'Animation, Adventure, Comedy','37.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('despicable me',7.7,'Animation, Comedy, Family','38.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('21',6.8,'Biography, Crime, Drama','39.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('titanic',7.7,'Drama, Romance','40.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('17 again',6.4,'Comedy, Drama, Fantasy','41.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Paper Towns',8.3,'Adventure, Mystery, Romance','42.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('twice born',7.4,'Drama, Romance, War','43.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('ender''s game',6.7,'Action, Sci-Fi','44.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('frozen',7.7,'Animation, Adventure, Comedy','45.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('free birds',5.9,'Animation, Adventure, Comedy','46.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('if i stay',6.8,'Drama, Music, Romance','47.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('live free or die hard',7.2,'Action, Adventure, Thriller','48.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('whiplash',8.6,'Drama, Music','49.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('ted',7,'Comedy, Fantasy','50.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Gone girl',8.2,'Drama, Mystery, Thriller','51.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('The Grand Budapest Hotel',8.1,' Adventure, Comedy, Drama','52.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Guardians of the galaxy',8.1,' Action, Adventure, Sci-Fi','53.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Boyhood',8.1,'Drama','54.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Wild Tales',8.2,'Comedy, Drama, Thriller ','55.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('12 Years a slave',8.1,'Biography, Drama, History','57.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Rush',8.2,'Action, Biography, Drama','58.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Prisoners',8.1,'Crime, Drama, Mystery ','59.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('The Hunt',8.3,'Drama','60.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Django Unchained',8.6,'Western','61.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('The Dark Knight Rises',8.5,'Action, Thriller','62.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('The Avengers',8.2,'Action, Adventure, Sci-Fi','63.jpg' )
insert into movieDataBase (name,rating,gener,imageName) values ('Warrior',8.2,' Drama, Sport','64.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('A Seperation',8.4,'Drama','65.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('The Help',8.1,'Drama','66.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Harry Potter and the Deathly Hallows: Part 2',8.1,'Adventure, Fantasy, Mystery','67.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('The Kings Speech',8.1,'Biography, Drama, History','68.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Ip Man',8.2,'Action, Biography, Drama','69.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Incendies',8.2,'Drama, Mystery, War','70.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Inception',8.8,'Action, Mystery, Sci-Fi','71.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Toy Story 3',8.4,'Animation, Adventure, Comedy','72.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('How to Train Your Dragon',8.2,'Animation, Adventure, Family','73.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Shutter Island',8.1,'Mystery, Thriller','74.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Like Stars on Earth',8.5,'Drama, Family, Music','75.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('The Secret in Their Eyes',8.3,'Drama, Mystery, Thriller','76.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Inglourious Basterds',8.3,'Adventure, Drama, War','77.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Hachi: A Dogs Tale',8.2,'Drama, Family','78.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('UP',8.3,'Animation, Adventure, Comedy','79.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Mary and Max',8.2,'Animation, Comedy, Drama','80.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Gran Torino',8.2,'Drama','81.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('A Wednesday',8.4,'Crime, Drama, Mystery','82.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('The Dark Knight',9.0,'Action, Crime, Drama ','83.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('There Will Be Blood ',8.1,'Drama','84.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('No Country for Old Men',8.1,'Crime, Drama, Thriller','85.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Into the wild',8.2,'Adventure, Biography, Drama','86.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('The Bourne Ultimatum',8.1,'Action, Thriller','87.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('The Lives of Others',8.5,'Drama, Thriller','88.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Pans Labyrinth',8.3,'Drama, Fantacy, War','89.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('V for Vendetta',8.2,'Action, Drama, Thriller','90.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Howls Moving Castle',8.2,'Animation, Adventure, Family','91.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Batman Begins',8.3,'Action, Adventure','92.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Downfall',8.3,'Biography, Drama, History','93.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Sin City',8.1,'Crime, Thriller','94.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Hotel Rwanda',8.2,'Drama, History, War','95.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Million Dollar Baby',8.1,'Drama, Sport','96.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Oldboy',8.4,'Drama, Mystery, Thriller','97.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Infernal Affairs',8.1,'Crime, Mystery, Thriller','98.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('Eternal Sunshine of the Spotless Mind',8.4,'Drama, Romance, Sci-Fi','99.jpg')
insert into movieDataBase (name,rating,gener,imageName) values ('The Lord of the Rings: The Return of the King',8.9,'Adventure, Fantasy','100.jpg')
