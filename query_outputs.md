# Query Outputs and Validation Notes

# Query 1

Purpose:
List all active students with batch details.

Expected Output:
Displays student information along with associated batch names.

Validation:
LEFT JOIN ensures students without assigned batches are also visible.

---

# Query 2

Purpose:
Identify missing or invalid email records.

Expected Output:
Shows students with NULL or malformed email addresses.

Validation:
Helps identify data quality issues.

---

# Query 3

Purpose:
Retrieve easy and medium difficulty problems.

Expected Output:
Only problems with difficulty values:
- easy
- medium

Validation:
Filters difficulty correctly using IN clause.

---

# Query 4

Purpose:
Retrieve latest submissions.

Expected Output:
Shows 20 most recent submissions ordered by timestamp.

Validation:
ORDER BY DESC ensures newest records appear first.

---

# Query 5

Purpose:
Identify unsuccessful submissions.

Expected Output:
Displays failed or non-success submission records.

Validation:
Useful for debugging and performance tracking.

---

# Query 6

Purpose:
Combine submission, student, and problem details.

Expected Output:
Displays submission metadata with readable names.

Validation:
JOIN operations correctly connect related entities.

---

# Query 7

Purpose:
Display all students and enrollments.

Expected Output:
Students without enrollments still appear.

Validation:
LEFT JOIN prevents loss of unmatched students.

---

# Query 8

Purpose:
Count enrolled students per course.

Expected Output:
Displays enrollment counts for each course.

Validation:
GROUP BY correctly aggregates enrollments.

---

# Query 9

Purpose:
Display test-case execution results.

Expected Output:
Shows pass/fail information with problem and student details.

Validation:
Multi-table JOIN retrieves linked execution data.

---

# Query 10

Purpose:
Find enrolled students with no submissions.

Expected Output:
Students appearing in enrollments but absent from submissions.

Validation:
NULL filtering confirms missing submissions.

---

# Query 11

Purpose:
Count submissions grouped by status.

Expected Output:
Displays totals for:
- success
- failed
- pending
etc.

Validation:
GROUP BY correctly summarizes records.

---

# Query 12

Purpose:
Calculate average score per problem.

Expected Output:
Displays average performance for each coding problem.

Validation:
AVG aggregation calculates score trends.

---

# Query 13

Purpose:
Find highly active students.

Expected Output:
Students with more than 5 submissions.

Validation:
HAVING filters aggregated counts correctly.

---

# Query 14

Purpose:
Identify difficult problems.

Expected Output:
Problems with success rate below 40%.

Validation:
CASE statement correctly calculates success ratio.

---

# Query 15

Purpose:
Find most attempted problems.

Expected Output:
Top 10 problems with highest submission counts.

Validation:
ORDER BY DESC sorts attempts correctly.

---

# Query 16

Purpose:
Find above-average students.

Expected Output:
Students whose average score exceeds overall average.

Validation:
Subquery correctly compares aggregate values.

---

# Query 17

Purpose:
Find unattempted problems.

Expected Output:
Problems with no submissions.

Validation:
LEFT JOIN with NULL detection identifies unused problems.

---

# Query 18

Purpose:
Find enrolled but inactive students.

Expected Output:
Students enrolled but without submissions.

Validation:
Useful for identifying disengaged students.

---

# Query 19

Purpose:
Find multilingual coders.

Expected Output:
Students who submitted in both Python and Java.

Validation:
Conditional aggregation correctly verifies both languages.

---

# Query 20

Purpose:
Find second-highest score.

Expected Output:
Displays second-largest score value for a problem.

Validation:
OFFSET logic correctly skips highest value.
