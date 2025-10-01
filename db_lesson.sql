-- Q1
create table departments (
  department_id int unsigned auto_increment primary key,
  name varchar(20) not null,
  created_at timestamp default current_timestamp,
  updated_at timestamp default current_timestamp on update current_timestamp
);

-- Q2
alter table people add department_id int unsigned after email;

-- Q3_departments
insert into departments (name)
value
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

-- Q3_people
insert into people (name, email, department_id, age, gender)
values
('高橋まり', 'takahashi@gizumo.jp', 2, 26, 2),
('菅原ちこ', 'sugawara@gizumo.jp', 3, 21, 2),
('木村あや', 'kimura@gizumo.jp', 2, 31, 2),
('徳永ゆうき', 'tokunaga@gizumo.jp', 1, 27, 1),
('松本ひなた', 'matsumoto@gizumo.jp', 4, 22, 1);

-- Q3_reports
insert into reports (person_id, content)
values
(8, 'すすすすすすすすすす'),
(4, 'せせせせせせせせせせ'),
(1, 'そそそそそそそそそそ'),
(11, 'たたたたたたたたたた'),
(9, 'ちちちちちちちちちち'),
(4, 'つつつつつつつつつつ'),
(7, 'てててててててててて'),
(10, 'とととととととととと'),
(2, 'なななななななななな'),
(3, 'にににににににににに');

-- Q4
update people set department_id=5 where name='不思議沢みちこ';



-- Q5
select * from people where gender ='1' order by age desc;


-- Q6
部署ナンバー1であるpeopleテーブルの名前とメールアドレスと年齢カラムのレコードを作成順に表示

-- Q7
select * from people where age > 20 and age < 30 and gender = 2;
select * from people where age > 40 and age < 50 and gender = 3;

-- Q8
select * from people where department_id = '1' order by age asc;

-- Q9
select avg(age) as average_age from people where department_id = '2' and gender = '2';

-- Q10
select people.name, departments.name, content from reports inner join people on reports.person_id = people.person_id join departments on people.department_id = departments.department_id;

-- Q11
select * from people where not exists (
  select * from reports where people.person_id = reports.person_id
);