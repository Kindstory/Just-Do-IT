-- [SQL문법] 2. Where(조건문) 절과  Order by(정렬) 절
-- [문법] select 컬럼1, 컬럼2, 컬럼3
-- from 테이블명
-- [where 조건문]
-- [order by 컬럼명 [asc | desc]];   대괄호 붙은건 생략가능, 옵션이라는 거임.

-- 2-1 where(조건문)절
-- where절 : 테이블로부터 특정행의 출력을 원한다면  where절에 조건문 작성하면 됨.
-- where절 작성 방법: select 컬럼1, 컬럼2, 컬럼3
--                 from 테이블명
--                 where 좌변           =          우변;
--                  (컬럼명)     	   (비교연산자)      (값) --> 숫자, 문자, 날짜
-- employess 테이블에서 employee_id, last_name, salary, department_id를
-- 출력해서 80번 부서에 소속된 사원을 출력하시오.

   select employee_id, last_name, salary, department_id
   from employees
   where department_id = 80;
   
-- employees 테이블에서 employee_id, last_name, job_id, department_id 를 출력하외 담당업무(job_id) 가 IT_prog인 사람을 출력하시오,

select employee_id, last_name, job_id, department_id
from employees
where job_id = "it_prog";

select* from employees;
-- employees 테이블에서 employee_id, last_name, hire_date, salary,
-- department_id를 출력하되 입사일(hire_date)이 2002년 이전인 사원을 출력하시오.

select employee_id, last_name, hire_date, salary, department_id
from employees
where hire_date < "2000-03-01";
 -- 한글로 설치되어있어서 년 월 일 순서 미국은 월 일 년 ㅇㅇ 순서 다름 영국은 일 월 년
 
 select last_name, job_id, department_id
 from employees
 where last_name = "Whalen";
 
 select last_name
 from employees
 where hire_date = '1996-02-17';
 
select last_name, salary
from employees
where salary <= 3000;

select* from employees;
 
 -- [비교 연산자]
 -- 단일행 비교 연산자 : =, >, >=, <, <=, (<> = !=) 같지 않음 
 -- 단일행 비교 연산자는 a = 100 이런 식이지 우변에 비교할수 있는 값이 딱 한개만 
 -- a = (100, 200, 301) 이런식으로 못옴.
 -- between A and B, in, like, is null
 
 -- [비교연산자 1] between A and B : 범위검색 시 사용하는 비교연산자
--                   	 		  A 이상 B이하의 값을 비교해주는 연산자
-- 					  			  A에 하한 값 작성, B에 상한값 작성해야함.

select employee_id, last_name, salary, department_id
from employees 
where salary between 3000 and 5000;

select employee_id, last_name, hire_date, salary
from employees
where hire_date between '1990-01-01' and '1992-12-31';
 
 select employee_id, last_name, department_id
 from employees
 where last_name between "King" and "Rorents";  -- king포함 그래서 들어감 뒤에이름은 항목에 없는데? 막 정해도 되나보네
 
 select* from employees;
 
 select employee_id, last_name, department_id
 from employees
 where last_name between "Benjamin" and "Rorents"; -- 없는 이름도 가능 ㅇㅇ 어차피 알파벳 순
 
 -- [비교연산자 2]in : 우변에 값리스트가 올 수 있는 다중행 비교 연산자
 --     			(=, OR)의 성격을 내포하고 있음.
 --      			우변의 값리스트와 비교해서 하나 이상 같은 경우 true를 반환하는 비교연산자
 
 -- employees 테이블에서 employee_id, last_name, manager_id를 출력하되
 -- manager_id가 100, 101, 201인 사원만 출력하시오.
 select employee_id, last_name, manager_id
 from employees
 where manager_id in (100, 101, 201);
 
 
 -- [비교연산자 3]  like : 패턴일치 여부를 비교해주는 비교연산자
 --                     like 우변에 패턴을 작성해야함.
 -- 					like 우변에 패턴 작성 시 활용되는 기호.
 
 -- 1) % :
 -- 2) _ : 반드시 하나의 문자가 와야 한다.
 -- a로 시작되는 문자열 : "a%"
 -- a가 포함된 문자열 : "%a%"
 -- a로 끝나는 문자열 : "%a"
 -- 두번째 문자가 a인 문자열 : "_a%"
 -- 끝에서 세번쨰 문자가 a인 문자열 : "%a__"   __은 _ 2개 븥어있음
 
 -- last_name의 두번째 문자가 'o'인 사원 출력
 select last_Name
 from employees where last_Name like "_o%";
 
 select employee_id, last_name, job_id
 from employees
 where job_id like "it%";
 
 select last_name, manager_id
 from employees
 where manager_id is null;
 
 select employee_id, last_name, job_id, salary
 from employees
 where salary >= 10000 and job_id like "%man%";
 
 
 select employee_id, last_name, job_id, salary
 from employees
 where salary >= 10000 or job_id like "%man%";
 
 -- [비교연산자 4] is null : 값이 null인지를 비교해주는 비교연산자
 -- 						null은 일반 비교연산자 = => 같은 것들로 비교가 안됨.
 
 -- manager_id를 알 수 없는 사원 출력
 select employee_id, last_name, salary, manager_id, department_id
 from employees
 where manager_id is null;
 -- king은 사장이니까 매니저가 없음 트리 구조 상하관계 구조 ㅇㅇ 
 -- 100번 밑에 101번 102번 103번 그리고 101번 밑에 104 105 머 이런식  102 밑에 106 107 이런 식
 -- mysql 트리구조 검색해서 공부해야지 ㅇㅇ
 
 -- 커미션을 받지 않은 사원 출력
 select employee_id, last_name, salary, commission_pct
 from employees
 where commission_pct is null;  
 -- is null이란 연산자는 연산자 + 우변 ㅇㅇ 따로 우변이 있는게 아니라 is null이 연산자와 우변의 역할을 동시에 함.
 -- null이 있는 데이터만 조회 가능 
 
 select* from employees;


-- [논리 연산자] 종류 : and, or, not
-- 우선순위 : not > and > or

-- [논리연산자 1] AND
-- where절에 여러개의 조건문을 작성하면서 모두 만족되는 행만 출력을 원하는 경우
-- and 연산자로 연결해야함.


 select employee_id, last_name, salary, job_id, department_id
 from employees
 where salary >= 10000 
 and job_id like "%man%";
 
 select * from employees;


-- [논리연산자 2] OR
-- where절에 있는 여러개의 조건문 중 하나 이상 만족하는 행을 출력하는 경우
-- or 연산자로 연결해야함.

-- (예제) employees 테이블에서 부서가 50또는 80인 사원 중 급여가 10000이상인 사원을 출력하시오.
select employee_id, last_name, salary, department_id
from employees
where (department_id = 50 or department_id = 80) and salary >= 10000;

select employee_id, last_name, salary, department_id
from employees
where department_id in (50, 80) and salary >= 10000;

--  같은 값인데 ㅇㅇ query구문은 결국 정답만 나오면 됨 워낙 문법이 다양해서
-- 그치만 성능이 좋은 프로그램이 좋음 안애 프로그램 처리 속도가 빠른거 ㅇㅇ
-- 그게 매출과 직결되니까.
-- 밑에 in이 성능면에서 좋음 한 단계 덜하니까 ㅇㅇ 프로세스 처리가 가벼워지니까 ㅇㅇ 더 빨리 되고 ㅇㅇ
-- 나중에 좀 잘되면 이런거 고려해서 코드 작성해야함. 
-- DB구조를 알아야함 ㅇㅇ DB구조 공부 ㅇㅇ 구조를 알아야 빠르고 효율적으로 값을 처리하게 됨. 성능면에서도 중요함.
 
 
 -- [논리연산자 1] NOT
 -- between A and B <--->  not between A and B : A미만 B초과 범위의 값을 찾아줌,
 -- in              <--->  not in : (<>, AND)
 -- like			<--->  not like : 우변의 패턴과 일치하지 않는 값을 찾아줌
 -- is null			<--->  is not null : null이 아닌 값을 찾아줌.
 -- 커미션을 받는 사월들 출력
 select employee_id, last_name, salary, commission_pct
 from employees
 where commission_pct is not null;
 
 select employee_id, last_name, salary, commission_pct
 from employees
 where commission_pct is not null;
 
 use hr;
 
-- 2-2 order by(정렬) 절
-- 			[문법] select 컬럼1 컬럼2 컬럼3
--  		from 테이블명
--  		[where 조건문]
-- 			[order by 컬럼명[ asc | desc]];  정렬방법이 안 적혀있으면 오름차순  asc다.
-- 			무조건 마지막에 위치

select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc;

select last_name, job_id, department_id, hire_date
from employees
where department_id >= 50
order by department_id;

select employee_id, last_name, salary*12 annsal
from employees
order by annsal;

select employee_id, last_name, salary*12 ansa
from employees
order by ansa;

select last_name , job_id, department_id, hire_date  -- select한 칼럼들에 왼쪽부터 번호가 매겨짐 1 2 3  칼럼명 대신 귀찮으니까 숫자로 입력 --
from employees
order by 3;

select employee_id, last_name, hire_date
from employees
order by 2 desc;

select employee_id, hire_Date, last_name
from employees
order by 1 desc;

select hire_date, last_name, employee_id,job_id
from employees
order by 1 desc;   -- 숫자로 하는게 편하네, 숫자는 다른 조건은 안됨 where에서 써보니까 안됨 order에서만 가능.

select last_name, department_id, salary
from employees
order by 2, 3;      -- 일단 정렬기준이 2개면, 처음기준으로 나눈다음에 그 기준안에서 각 값마다 또 오름이나 내림차순으로 가는거임 헷갈릴수있음.
					-- 예를 들면, department_id 20 항목중에 salary를 내림이나 오름차순 하고, 그담 다시 department_id 30 항목중에
					-- 내림이나 오름차순으로 가는거임. 계속 쭉 오름이나 내림으로 가는게 아님.
select employee_id, last_name
from employees
order by salary desc;      -- 정렬기준이 되는 컬럼을 select 안해도 되긴 됨 맞게 
						   -- 근데 먼 의미가 있나 ㅇㅇ 확인이 안되니까 ㅇㅇ
						   -- 그래서 정렬기준이 되는 항목을 같이 select시킨다.
-- 연습문제 1, 2번 
-- between, like방식 2가지로 1번 풀기

select last_name, hire_date
from employees
where hire_date between "2000-01-01" and "2000-12-31";

select last_name, hire_date
from employees
where hire_date like "2000%";

select last_name, salary, commission_pct
from employees
where commission_pct is null
order by 2 desc;  -- order에서만 숫자로 가능.


-- [SQL문법] 3. 역모델링 작업

-- <DB 내 Table을 생성하기 위한 데이터모델링 설치>
-- DB주제에 맞는 데이터가 저장될 수 있도록 table개수가 20~30개고 테이블당 컬럼이 10개 넘어가면 머리로 짜기 힘듬.
-- 1. 요구사항 수집 및 분석  
-- 2. 개념 모델링 : 1번을 토대로 주요 테이블 추출, 테이블의 컬럼, 테이블 간의 관계 등이 결정됨.
-- 				 전체적인 뼈대가 만들어지는 단계
-- 				 결과물 - ERD(피터첸 방식) 정해진 규격이 있음
-- 3. 논리 모델링 : 개념 모델링 결과를 토대로 세부 내용이 결정되는 단계
-- 				 컬럼의 데이터타입, 컬럼 사이즈, 제약조건 등
-- 				 결과물 - 구체화된 ERD(IE표기법) (정해진 규격이 없어서 한글,엑센 막 써도 됨), 테이블 차트(많이 씀) 등
-- 4. 물리 모델링 : 논리모델링의 결과를 토대로 DB에 구현하는 단계
-- 				 create table 구문 작성
-- 				 결과물 - 테이블 생성됨.

-- 4장에서 배우는 join을 할려면 테이블 간의 관계를 알아야 함. 
-- join : 여러 테이블을 함께 join해서 출력하는 것
-- 3번째 단계의 구체화된 ERD가 있으면 관계를 파악하기 좋음.
-- 근데 설계할때의 그런 파일을 잘 안들고 있음. 
-- 회사가 돌아가다보면 초창기떄의 설계와 파일이 많이 바뀔수도 있음.
-- 이미 구현된 테이블들을 반대로 ERD를 그려주는 것 => 역모델링 
-- 요즘 DB에서 다 제공함. 굳이 전임자한테 그 자료 달라고 할 필요가 없음.

-- [SQL문법] 4. 조인(JOIN)

-- 조인이란?
-- 여러 테이블로부터 데이터를 검색하고자 하는 경우 사용함.
-- 조인을 하고자 하는 테이블로부터 공통된 데이터가 저장된 컬럼을 찾아야함.  * 데이터가 공통되어야 한다.
-- 기본 조인 유형 : On절을 사용한 조인
-- [문법] select 컬럼1 컬럼2 컬럼3 컬럼4 컬럼5
--       from 테이블1 join 테이블2
--       on 테이블1.컬럼명 = 테이블2.컬럼명   (조인 조건)
--       [where 좌변 = 우변]
--       [order by 컬렴명  [asc|desc]];

-- (예제1) employees 테이블과 departments 테이블을 사용해서 employ_id, last_name,
-- 		  salary, department_name을 함께 출력하는 구문을 작성하시오.

select employee_id, last_name, salary, department_name
from employees join departments
on employees.department_id = departments.department_id;

-- (예제2) employees 테이블과 departments 테이블을 사용해서 department_id, dmpartment_name, 부서의 매니저 이름을 함께 출력하는 구문을
--        작성하시오.

select departments.department_id, department_name, last_name as "부서의 매니저 이름"
from employees join departments -- from A join B 순서 상관없음
on employees.employee_id = departments.manager_id;    -- employee안에 각 부서의 매니저들이 있으니까 department의 매니저랑 데이터가 겹치지 데이터가 겹쳐야 조건이 가능

select* from employees;
select* from departments;
-- department_id is ambiguous는 department_id가 두 테이블에 다 있어서.
-- 앞에 테이블 적어줘야함. departments 

-- (예제3) employees, jobs 테이블을 이용해 employee_id, last_name, salary, job_id, job_title을 함께 출력하는 구문을 작성하시오.

select employee_id, last_name, salary, employees.job_id, job_title
from employees join jobs
on employees.job_id = jobs.job_id;


-- (예제4) departments 테이블과 locations 테이블을 사용해서 department_id, department_name, location_id,
-- city를 함께 출력하는 구문을 작성하시오.

select department_id, department_name, locations.location_id, city
from departments join locations
on departments.location_id = locations.location_id;

-- [ 모호한 컬럼 제거 방법 ]
-- 컬럼명 앞에 테이블명 또는 테이블 alis를 접두어로 붙여줘야 함.
-- 여러 테이블에 동일한 이름의 컬럼명 앞에는 반드시 접두어 사용해야함.
-- 한쪽 테이블에만 있는 유일한 이름의 컬럼명 앞에는 사용하지 않아도 되나
-- 접두어를 사용하는 것을 권장. => 이유 : 성능!

-- [예제5] 테이블명을 접두어로 사용한 경우
select employees.employee_id, employees.last_name, employees.salary,
		departments.department_id, departments.department_name
from employees join departments
on employees.department_id = departments.department_id;

-- [예제6] 테이블 alias명을 접두어로 사용한 경우 테이블명을 앞에 다 적자니 너무 길어서 벌명 (앞에 1~3글자로) as는 컬럼때만 써도 되고 안 써도 되고
--        테이블 alias는 as 안 붙임.
select e.employee_id, e.last_name, e.salary, d.department_id, d.department_name
from employees e join departments d -- from절에 별명 정의해줘야함 앞에서 썻으면.
on e.department_id = d.department_id;


select* from departments;
select* from employees;

-- 교재 연습문제 1
select e.employee_id, e.last_name, e.salary, 
d.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;

-- 교재 연습문제 2(Self Join)
-- 하나의 테이블을 마치 다른 테이블인듯 조인을 하는 방식
-- self join(자체조건)시 테이블 alias가 필수임.    // 클래스가 객체 생성하는 느낌 ㅇㅇ 객체가 별명 주는거니까
use hr;
select e1.last_name as "Employee", e1.employee_id as "Emp#", 
		e2.last_name as "Manager", e1.manager_id as "Mgr#"
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;

-- (==)
select e1.last_name as "Employee", e1.employee_id as "Emp#", 
		e2.last_name as "Manager", e2.employee_id as "Mgr#"
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;

-- (오답) 직원 정보와 직원의 매니저 이름과 매니저의 매니저  ID가 출력되는 구문
select e1.last_name as "Employee", e1.employee_id as "Emp#", 
		e2.last_name as "Manager", e2.manager_id as "Mgr#"
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;




-- 매니저 이름 때문에 셀프 조인 하는 거임.`

-- [예제 7] employees 테이블에서 사원(employee_id), 사원 이름(last_name), 매니저 이름(last_name)을
-- 함께 출력하는 구문을 작성하시오.

select e1.employee_id, e1.last_name as "사원이름", e2.last_name "매니저 이름"
from employees e1 join employees e2
on e1.manager_id = e2.employee_id; -- 순서 바뀌면 안됨.

-- [조인 추가 문법]
-- <inner join>              vs              <outer join>
-- * 내부 조인            					  * 외부 조인
-- * 조인 조건을 만족하는 행만 				      * 조인 조건을 만족하지 않는 행까지
--   반환하는 조인 유형								반환하는 조인 유형
													
-- * on절을 사용한 조인 						  * left outer 조인                    
-- 											  * right outer 조인
-- (inner join - 예제)

-- (예제) inner join
select e.employee_id, e.last_name, e.salary, 
d.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id; 

-- 부서없는 Grant까지 다 출력됨.

select department_id, employee_id, last_name
from employees
where department_id is null;
-- 아직 부서를 배정받지 못한 신입 때문에,총 107명중에 위에 조회하면 106명 나옴.

select* 
from departments;

-- 120~270까지 부서는 새로 만들어진 부서라 아직 직원이 없음.
-- departments 테이블에서 소속된 직원이 없는 120~270번 부서가 결과에 출력되지 않음.

-- (예제) left outer join
-- 조인 조건을 만족하지 않는 왼쪽 테이블의 데이터를 포함해서 출력하는 조인 유형
-- employees 테이블에서 부서가 없는 "Grant"도 함께 출력됨.

select e.employee_id, e.last_name, e.salary, 
d.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id; 

-- (예제) right outer join
-- 조인 조건을 만족하지 않는 오른쪽 테이블의 데이터를 포함해서 출력하는 조인 유형
-- departments 테이블에서 소속된 직원이 없는 빈 부서도 함께 출력됨.

select e.employee_id, e.last_name, e.salary, 
d.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id; 

-- [조인 추가 문법]
-- <N개의 테이블 조인>
-- 테이블 수 || 조인조건 수
-- - - - - - - - - - - -
 --   2     |     1
 --   3     |     2
 --   N     | 	  NAN
 
 -- (예제) employees, departments, loctaions,  테이블을 사용해서, employee_id, last_name,
 --       department_name,city 를 함께 출력하시오.
 
 select e.employee_id, e.last_name, d.department_name, l.city
 from employees e join departments d 
 on e.department_id = d.department_id
 join locations l
 on d.location_id = l.location_id

-- join 
-- on
-- join
-- on 이런식으로 쓰는게 정석임.  on절이 짝은 join임 

-- ,  ,  ,로 join 대신 쓰면  on은 못 쓰고 and로 씀. (옛날 문법)


-- [SQL문법] 5-1. 단일행 함수 - 문자함수

-- 함수란? 인수를 받아들여 '정해진 조작'을 한 다음에 반드시 하나의 값을 반환해 주는 것.
-- 많이 알수록 개발할 때 유용하다.
-- 함수유형 : 단일행함수 - 행 당 조작해서 하나의 결과값을 반환함.
--          다중행함수(그룹함수) - 행그룹을 조작해서 하나의 결과값을 반환함.
-- 문법은 같으나, 인수 개수가 다양함. 1 2 3.... n 개 


select ascii("A"), char(65);
select length("abc"), bit_length("abc"), char_length("abc"), length("가나다"); -- 영어는 1바이트.
select length("가나다"), bit_length("가나다"), char_length("가나다"); -- 한글은 글자당 3바이트 중국어나 다른 글자들중에는 글자당 5~6바이트씩 하는 것도 있다.
select length(24)*"*";
select employee_id, concat(first_name, last_name) as "이름"
from employees;

select employee_id, concat(first_name, " ", last_name) as "이름"
from employees;


select concat_ws("/", "2025", "01","01"); -- 2개 연결은 굳이 쓸필요없음 3개 이상할때 많이 씀.

select concat_ws("--", last_name, job_id, salary)
from employees;
 
select instr("하나둘셋", "둘");
select last_name, instr(last_name, "a")
from employees;

select lower("abcdEFGH"), upper("abcdEFGH");

select employee_id, upper(last_name) as "L-name", lower(job_id) as "Job",
phone_number, lower(email) as "E-mail"
from employees;

select concat("The job id for ", upper(last_name), " is " , lower(job_id))
from employees;

select left("abcdefghi", 3), right("abcdegfhi",3);

select last_name, left(last_name, 2), right(last_name, 2)
from employees;

select lpad("", 5, "#"), rpad("가나다", 5, "#"),lpad(" ", 5, "#");
select lpad(last_name,20,"_") as "L-name", rpad(first_name, 20, "_") as "F-name" 
from employees;

select ltrim("      SQL 문법  "), rtrim("            SQL 문법     ");

select trim("     SQL 문법    "), trim(both "_" from "_SQL문법__");

select employee_id, last_name, phone_number, replace(phone_number, ".","-") as "전화번호"
from employees;

select concat("MySQL", space(10), "DBMS");
select concat("MySQL", "               ", "DBMS");

select substr("대한민국 만세", 3, 2);  -- substr == substring
select last_name, substr(last_name,2, 3), substring(last_name, 2, 3)
from employees;

-- concat(substr("주민번호", 1, 6), " _*******) -> 901009_*******


-- 연습문제 1 2 3번

select last_name, length(last_name)
from employees
where last_name like "J%" or "A%" or "M%"
order by last_name asc;

select last_name, lpad(salary, 15, "$") as "SALARY"
from employees;


select last_name, replace(salary, salary, lpad("", salary/1000 , "*"))  as "EMPLOYEES_AND_THEIR_SALARIES" -- lpad할때 공백있으면 하나 깍임 공백없애면됨.
from employees
order by salary desc;

select* from employees
order by salary desc;






