/*insert into ORG*/
delete from ORGANISATIONS ;
insert into ORGANISATIONS (ORG_ID, ORG_CODE, ORG_NAME) values (1, 'HR', 'Human Resources');
insert into ORGANISATIONS (ORG_ID, ORG_CODE, ORG_NAME) values (2, 'OR', 'Operations');
insert into ORGANISATIONS (ORG_ID, ORG_CODE, ORG_NAME) values (3, 'IT', 'Information Technology');
insert into ORGANISATIONS (ORG_ID, ORG_CODE, ORG_NAME) values (4, 'FI', 'Finance');
insert into ORGANISATIONS (ORG_ID, ORG_CODE, ORG_NAME) values (5, 'MR', 'Marketing');

/*insert into questions*/
delete from QUESTIONS ;
insert into QUESTIONS (QUESTION_ID, QUESTION,QUESTION_CATEGORY, QUESTION_TYPE) values (1, 'Rate HR Dept', 'FEEDBACK', 'Dept');
insert into QUESTIONS (QUESTION_ID, QUESTION,QUESTION_CATEGORY, QUESTION_TYPE) values (2, 'Rate OR Dept', 'FEEDBACK', 'Dept');
insert into QUESTIONS (QUESTION_ID, QUESTION,QUESTION_CATEGORY, QUESTION_TYPE) values (3, 'Rate FI Dept', 'FEEDBACK', 'Dept');
insert into QUESTIONS (QUESTION_ID, QUESTION,QUESTION_CATEGORY, QUESTION_TYPE) values (4, 'Rate IT Dept', 'FEEDBACK', 'Dept');
insert into QUESTIONS (QUESTION_ID, QUESTION,QUESTION_CATEGORY, QUESTION_TYPE) values (5, 'Rate MR Dept', 'FEEDBACK', 'Dept');
insert into QUESTIONS (QUESTION_ID, QUESTION,QUESTION_CATEGORY, QUESTION_TYPE) values (6, 'Fun activities', 'SUGGESTIONS', 'GENERAL');
insert into QUESTIONS (QUESTION_ID, QUESTION,QUESTION_CATEGORY, QUESTION_TYPE) values (7, 'Employee engagement', 'SUGGESTIONS', 'GENERAL');
insert into QUESTIONS (QUESTION_ID, QUESTION,QUESTION_CATEGORY, QUESTION_TYPE) values (8, 'Annual outings', 'SUGGESTIONS', 'GENERAL');
insert into QUESTIONS (QUESTION_ID, QUESTION,QUESTION_CATEGORY, QUESTION_TYPE) values (9, 'Workplace improvement', 'SUGGESTIONS', 'GENERAL');

/*insert into ORG_QUESTIONS */
delete from ORG_QUESTIONS;
insert into ORG_QUESTIONS (ORG_ID, QUESTION_ID) values (1, 1);
insert into ORG_QUESTIONS (ORG_ID, QUESTION_ID) values (1, 8);
insert into ORG_QUESTIONS (ORG_ID, QUESTION_ID) values (2, 2);
insert into ORG_QUESTIONS (ORG_ID, QUESTION_ID) values (3, 3);
insert into ORG_QUESTIONS (ORG_ID, QUESTION_ID) values (3, 7);
insert into ORG_QUESTIONS (ORG_ID, QUESTION_ID) values (3, 8);
insert into ORG_QUESTIONS (ORG_ID, QUESTION_ID) values (5, 6);
insert into ORG_QUESTIONS (ORG_ID, QUESTION_ID) values (5, 9);

/*insert into users*/
delete from "USER";
insert into "USER" (USER_ID, USER_NAME, ORG_ID, DOB) values (1, 'James', 1, '');
insert into "USER" (USER_ID, USER_NAME, ORG_ID, DOB) values (2, 'Wilson', 2, '');
insert into "USER" (USER_ID, USER_NAME, ORG_ID, DOB) values (3, 'Ryan', 3, to_date('01-19-2017', 'MM-DD-YYYY'));
insert into "USER" (USER_ID, USER_NAME, ORG_ID, DOB) values (4, 'Michael', 3, '');
insert into "USER" (USER_ID, USER_NAME, ORG_ID, DOB) values (5, 'Jared', 3, '');
insert into "USER" (USER_ID, USER_NAME, ORG_ID, DOB) values (6, 'Ramesh', 3, '');
/*

/* insert into survey_questions*/

insert into SURVEY (SURVEY_ID,SURVEY_NAME,SURVEY_TYPE,RECIPIENT) values (1,'Early Year Survey','GENERAL', 3);
insert into SURVEY (SURVEY_ID,SURVEY_NAME,SURVEY_TYPE,RECIPIENT) values (2,'Quarterly Year Survey','QUARTERLY', 1);
insert into SURVEY (SURVEY_ID,SURVEY_NAME,SURVEY_TYPE,RECIPIENT) values (3,'Mid Year Survey','GENERAL', 3);
insert into SURVEY (SURVEY_ID,SURVEY_NAME,SURVEY_TYPE,RECIPIENT) values (4,'End Year Survey','GENERAL', 2);

/*insert into survey_questions*/
delete from SURVEY_QUESTIONS;
insert into SURVEY_QUESTIONS (SURVEY_ID, QUESTION_ID) values (1, 6);
insert into SURVEY_QUESTIONS (SURVEY_ID, QUESTION_ID) values (1, 7);
insert into SURVEY_QUESTIONS (SURVEY_ID, QUESTION_ID) values (1, 8);
insert into SURVEY_QUESTIONS (SURVEY_ID, QUESTION_ID) values (1, 9);
insert into SURVEY_QUESTIONS (SURVEY_ID, QUESTION_ID) values (1, 1);
insert into SURVEY_QUESTIONS (SURVEY_ID, QUESTION_ID) values (2, 1);
insert into SURVEY_QUESTIONS (SURVEY_ID, QUESTION_ID) values (2, 2);
insert into SURVEY_QUESTIONS (SURVEY_ID, QUESTION_ID) values (2, 3);

/*insert into user_feedback*/

delete from FEEDBACK;
insert into FEEDBACK (FEEDBACK_ID, FEEDBACK_DATE,IS_ANONYMOUS, FEEDBACK_SCORE) values (1, to_date('01-15-2017', 'MM-DD-YYYY'), 1, 8);
insert into FEEDBACK (FEEDBACK_ID, FEEDBACK_DATE,IS_ANONYMOUS, FEEDBACK_SCORE) values (2, to_date('01-17-2017', 'MM-DD-YYYY'), 0, 7);
insert into FEEDBACK (FEEDBACK_ID, FEEDBACK_DATE,IS_ANONYMOUS, FEEDBACK_SCORE) values (3, to_date('01-19-2017', 'MM-DD-YYYY'), 1, 10);
insert into FEEDBACK (FEEDBACK_ID, FEEDBACK_DATE,IS_ANONYMOUS, FEEDBACK_SCORE) values (4, to_date('01-23-2017', 'MM-DD-YYYY'), 0, 4);
insert into FEEDBACK (FEEDBACK_ID, FEEDBACK_DATE,IS_ANONYMOUS, FEEDBACK_SCORE) values (5, to_date('01-25-2017', 'MM-DD-YYYY'), 0, 9);

/*insert into user_feedback*/
insert into USER_FEEDBACK (FEEDBACK_ID, SUBMITTER) values (1, 1);
insert into USER_FEEDBACK (FEEDBACK_ID, SUBMITTER) values (2, 2);
insert into USER_FEEDBACK (FEEDBACK_ID, SUBMITTER) values (3, 4);
insert into USER_FEEDBACK (FEEDBACK_ID, SUBMITTER) values (4, 5);
insert into USER_FEEDBACK (FEEDBACK_ID, SUBMITTER) values (5, 6);

/*insert into survey_feedback*/

insert into SURVEY_FEEDBACK (SURVEY_ID, FEEDBACK_ID) values (1, 1);
insert into SURVEY_FEEDBACK (SURVEY_ID, FEEDBACK_ID) values (1, 2);
insert into SURVEY_FEEDBACK (SURVEY_ID, FEEDBACK_ID) values (1, 3);
insert into SURVEY_FEEDBACK (SURVEY_ID, FEEDBACK_ID) values (1, 4);
insert into SURVEY_FEEDBACK (SURVEY_ID, FEEDBACK_ID) values (1, 5);

/*insert into feedback_responses*/

insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (1, 6, 6);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (1, 7, 10);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (1, 8, 8);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (1, 9, 9);

insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (2, 6, 8);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (2, 7, 7);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (2, 8, 4);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (2, 9, 10);

insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (3, 6, 5);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (3, 7, 5);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (3, 8, 8);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (3, 9, 8);

insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (4, 6, 6);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (4, 7, 6);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (4, 8, 7);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (4, 9, 9);

insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (5, 6, 8);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (5, 7, 9);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (5, 8, 10);
insert into FEEDBACK_RESPONSES (FEEDBACK_ID, QUESTION_ID, RESPONSE) values (5, 9, 3);

