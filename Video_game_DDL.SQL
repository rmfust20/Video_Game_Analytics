
create table sales
	(Rank			text(30), 
	 Global_Sales		numeric(30), 
	 NA_Sales	 	numeric(30),
	 EU_Sales		numeric(30), 
	 JP_Sales 		numeric(30),
	 Other_Sales		numeric(30),
	 primary key (Rank)
	);

create table games
	(Title 			text(30), 
	 Genre			text(30),
	 Publisher		text(30), 
	 Year			text(30),
	 primary key (Title),
	 foreign key (Rank) references sales (Rank)
		on delete cascade
	);


create table steam-200k
	(Title 			text(30), 
	 User_ID		text(30),
	 Behavior		text(30), 
	 Playtime 		numeric(30),
	 primary key (Title, User_ID, Behavior, Playtime)
	);