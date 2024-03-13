create table teams(
  team_id serial primary key,
  name varchar(255) unique not null
);

create table games(
  game_id serial primary key,
  year int not null,
  round varchar(255) not null,
  winner_id int not null,
  opponent_id int not null,
  foreign key(winner_id) references teams(team_id),
  foreign key(opponent_id) references teams(team_id),
  winner_goals int not null,
  opponent_goals int not null
);
