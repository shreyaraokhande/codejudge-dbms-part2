-- Query 1
-- List all active students with student ID, name, email, batch, and admission date

SELECT
    s.student_id,
    s.student_name,
    s.email,
    b.batch_name,
    s.created_at
FROM students s
LEFT JOIN batches b
ON s.batch_id = b.batch_id;

--------------------------------------------------

-- Query 2
-- Find students whose email is missing or invalid

SELECT
    student_id,
    student_name,
    email
FROM students
WHERE email IS NULL
   OR email NOT LIKE '%@%';

--------------------------------------------------

-- Query 3
-- List all problems with difficulty Easy or Medium

SELECT
    problem_id,
    problem_title,
    difficulty
FROM problems
WHERE difficulty IN ('easy','medium');

--------------------------------------------------

-- Query 4
-- Display latest 20 submissions

SELECT
    submission_id,
    student_id,
    problem_id,
    submitted_at
FROM submissions
ORDER BY submitted_at DESC
LIMIT 20;

--------------------------------------------------

-- Query 5
-- Find unsuccessful submissions

SELECT
    submission_id,
    student_id,
    status,
    score
FROM submissions
WHERE status != 'success';

--------------------------------------------------

-- Query 6
-- Display submissions with student and problem details

SELECT
    s.submission_id,
    st.student_name,
    p.problem_title,
    s.language_used,
    s.status,
    s.score,
    s.submitted_at
FROM submissions s
JOIN students st
ON s.student_id = st.student_id
JOIN problems p
ON s.problem_id = p.problem_id;

--------------------------------------------------

-- Query 7
-- Display all students and their enrollments

SELECT
    st.student_name,
    c.course_name,
    e.enrollment_status
FROM students st
LEFT JOIN enrollments e
ON st.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id;

--------------------------------------------------

-- Query 8
-- Display all courses with enrollment counts

SELECT
    c.course_name,
    COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_name;

--------------------------------------------------

-- Query 9
-- Display test-case results for submissions

SELECT
    tr.result_id,
    st.student_name,
    p.problem_title,
    tr.passed,
    tr.execution_time
FROM test_results tr
JOIN submissions s
ON tr.submission_id = s.submission_id
JOIN students st
ON s.student_id = st.student_id
JOIN problems p
ON s.problem_id = p.problem_id;

--------------------------------------------------

-- Query 10
-- Students enrolled but without submissions

SELECT DISTINCT
    st.student_name
FROM students st
JOIN enrollments e
ON st.student_id = e.student_id
LEFT JOIN submissions s
ON st.student_id = s.student_id
WHERE s.submission_id IS NULL;

--------------------------------------------------

-- Query 11
-- Count submissions by status

SELECT
    status,
    COUNT(*) AS total_submissions
FROM submissions
GROUP BY status;

--------------------------------------------------

-- Query 12
-- Average score per problem

SELECT
    p.problem_title,
    AVG(s.score) AS average_score
FROM submissions s
JOIN problems p
ON s.problem_id = p.problem_id
GROUP BY p.problem_title;

--------------------------------------------------

-- Query 13
-- Students with more than 5 submissions

SELECT
    st.student_name,
    COUNT(s.submission_id) AS total_submissions
FROM students st
JOIN submissions s
ON st.student_id = s.student_id
GROUP BY st.student_name
HAVING COUNT(s.submission_id) > 5;

--------------------------------------------------

-- Query 14
-- Problems with success rate below 40%

SELECT
    p.problem_title,
    AVG(
        CASE
            WHEN s.status = 'success' THEN 1
            ELSE 0
        END
    ) * 100 AS success_rate
FROM submissions s
JOIN problems p
ON s.problem_id = p.problem_id
GROUP BY p.problem_title
HAVING success_rate < 40;

--------------------------------------------------

-- Query 15
-- Top 10 most attempted problems

SELECT
    p.problem_title,
    COUNT(s.submission_id) AS attempts
FROM problems p
JOIN submissions s
ON p.problem_id = s.problem_id
GROUP BY p.problem_title
ORDER BY attempts DESC
LIMIT 10;

--------------------------------------------------

-- Query 16
-- Students scoring above average

SELECT
    student_id,
    AVG(score) AS avg_score
FROM submissions
GROUP BY student_id
HAVING AVG(score) >
(
    SELECT AVG(score)
    FROM submissions
);

--------------------------------------------------

-- Query 17
-- Problems never attempted

SELECT
    p.problem_title
FROM problems p
LEFT JOIN submissions s
ON p.problem_id = s.problem_id
WHERE s.submission_id IS NULL;

--------------------------------------------------

-- Query 18
-- Students enrolled but never submitted

SELECT DISTINCT
    st.student_name
FROM students st
JOIN enrollments e
ON st.student_id = e.student_id
LEFT JOIN submissions s
ON st.student_id = s.student_id
WHERE s.submission_id IS NULL;

--------------------------------------------------

-- Query 19
-- Students using both Python and Java

SELECT
    st.student_name
FROM students st
JOIN submissions s
ON st.student_id = s.student_id
GROUP BY st.student_name
HAVING
    SUM(CASE WHEN s.language_used = 'Python' THEN 1 ELSE 0 END) > 0
AND
    SUM(CASE WHEN s.language_used = 'Java' THEN 1 ELSE 0 END) > 0;

--------------------------------------------------

-- Query 20
-- Second highest score for a problem

SELECT DISTINCT score
FROM submissions
WHERE problem_id = 1
ORDER BY score DESC
LIMIT 1 OFFSET 1;
