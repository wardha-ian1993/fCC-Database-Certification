create database salon;

create table customers(
  customer_id serial primary key,
  phone varchar(20) unique,
  name varchar(255)
);

create table services(
  service_id serial primary key,
  name varchar(255),
  price DECIMAL(7,2)
);

create table appointments(
  appointment_id serial primary key,
  time varchar(255),
  customer_id int not null,
  service_id int not null,
  foreign key(customer_id) references customers(customer_id),
  foreign key(service_id) references services(service_id)
);

insert into services(name, price) 
values
('Hair Washing', 20.00),
('Eyebrow Shaping', 20.00),
('Hair Conditioning', 25.00),
('Hair Cutting', 35.00),
('Hair Styling', 40.00),
('Manicure & Pedicure', 45.00),
('Body Shaving', 30.00),
('Body Waxing', 50.00),
('Facial Treatment', 60.00),
('Hair Coloring', 75.00),
('Eyelash Extensions', 80.00),
('Massage Therapy', 80.00),
('Hair Extensions', 100.00);

