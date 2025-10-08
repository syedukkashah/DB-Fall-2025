create table department (
  dept_id number primary key,
  dept_name varchar2(50)
);

create table student (
  student_id number primary key,
  student_name varchar2(50),
  dept_id number,
  gpa number(3,2),
  fee_paid int,
  foreign key (dept_id) references department(dept_id) on delete set null
);

create table faculty (
  faculty_id int primary key,
  faculty_name varchar2(50),
  dept_id number,
  salary number,
  joining_date date,
  foreign key (dept_id) references department(dept_id) on delete set null
);

create table course (
  course_id number primary key,
  course_name varchar2(50),
  dept_id number,
  fee number,
  foreign key (dept_id) references department(dept_id) on delete set null
);

create table enrollment (
  student_id number,
  course_id number,
  primary key(student_id, course_id),
  foreign key (student_id) references student(student_id) on delete cascade,
  foreign key (course_id) references course(course_id) on delete cascade
);

create table faculty_course (
  faculty_id number,
  course_id number,
  primary key(faculty_id, course_id),
  foreign key (faculty_id) references faculty(faculty_id) on delete cascade,
  foreign key (course_id) references course(course_id) on delete cascade
);


insert into department values (1, 'CS');
insert into department values (2, 'EE');
insert into department values (3, 'FT');


insert into student values (1, 'Ali', 1, 3.8, 60000);
insert into student values (2, 'Bob', 1, 3.2, 55000);
insert into student values (3, 'Charlie', 2, 2.8, 45000);
insert into student values (4, 'David', 2, 3.5, 70000);
insert into student values (5, 'Eve', 3, 2.9, 40000);
insert into student values (6, 'Frank', 3, 3.9, 90000);


insert into faculty values (1, 'George', 1, 150000, to_date('01-01-2000', 'DD-MM-YYYY'));
insert into faculty values (2, 'Ali', 1, 120000, to_date('15-03-2005', 'DD-MM-YYYY'));
insert into faculty values (3, 'Robert', 2, 90000, to_date('22-05-2010','DD-MM-YYYY'));
insert into faculty values (4, 'Ahmed', 3, 110000, to_date('11-07-2012','DD-MM-YYYY'));
insert into faculty values (5, 'Hank', 2, 130000, to_date('09-09-1998', 'DD-MM-YYYY'));


insert into course values (1, 'DBMS', 1, 20000);
insert into course values (2, 'Networks', 1, 15000);
insert into course values (3, 'Circuits', 2, 18000);
insert into course values (4, 'Marketing', 3, 17000);
insert into course values (5, 'AI', 1, 25000);


insert into enrollment values (1, 1);
insert into enrollment values (1, 2);
insert into enrollment values (1, 5);
insert into enrollment values (2, 1);
insert into enrollment values (2, 5);
insert into enrollment values (3, 3);
insert into enrollment values (4, 3);
insert into enrollment values (4, 2);
insert into enrollment values (5, 4);
insert into enrollment values (6, 4);
insert into enrollment values (6, 1);


insert into faculty_course values (1,1);
insert into faculty_course values (1,2);
insert into faculty_course values (2,5);
insert into faculty_course values (3,3);
insert into faculty_course values (4,4);

select * from department;
select * from student;
select * from faculty;
select * from course;
select * from enrollment;
