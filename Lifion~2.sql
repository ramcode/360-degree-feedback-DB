/* survey id = 1*/

select u.USER_NAME, q.question, fr.response, f.IS_ANONYMOUS, f.FEEDBACK_DATE from QUESTIONS q ,"USER" u, USER_FEEDBACK uf, FEEDBACK_RESPONSES fr, FEEDBACK f
where q.QUESTION_ID = fr.QUESTION_ID and u.USER_ID = uf.SUBMITTER and uf.FEEDBACK_ID = fr.FEEDBACK_ID and f.FEEDBACK_ID = uf.FEEDBACK_ID and fr.FEEDBACK_ID in (
select SF.FEEDBACK_ID from SURVEY_FEEDBACK SF where SF.SURVEY_ID = 1);

select * from "USER" u JOIN USER_FEEDBACK uf ON U.USER_ID = uf.submitter and uf.FEEDBACK_ID in
