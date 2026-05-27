# SQL Reasoning Explanations

# 1. LEFT JOIN vs INNER JOIN

Query Used:
- Query 7

Reason:

LEFT JOIN was more appropriate because the requirement was to display all students, including students who are not enrolled in any course.

If INNER JOIN had been used:
- students without enrollment records would be excluded.

LEFT JOIN ensures:
- unmatched students still appear with NULL enrollment values.

---

# 2. HAVING vs WHERE

Query Used:
- Query 13

Reason:

HAVING is required because filtering occurs after aggregation.

Example:

```sql
HAVING COUNT(s.submission_id) > 5
```

WHERE cannot directly filter aggregate values such as:
- COUNT()
- AVG()
- SUM()

HAVING is specifically designed for grouped conditions.

---

# 3. Subquery Usage

Query Used:
- Query 16

Reason:

A subquery was required to calculate the overall average score.

Example:

```sql
SELECT AVG(score)
FROM submissions
```

The outer query compares each student’s average against the global average.

This allows dynamic comparison instead of hardcoding values.

---

# 4. Duplicate Record Risk

Example:
- Query 6

Potential Issue:

If duplicate submission records exist:
- JOIN results may produce repeated rows.

Impact:
- inflated counts
- misleading analytics
- incorrect aggregation

Prevention Methods:
- PRIMARY KEY constraints
- UNIQUE constraints
- DISTINCT keyword where necessary

---

# 5. Edge Case Considered

Example:
- Query 17

Edge Case:

Some problems may never receive submissions.

If INNER JOIN were used:
- such problems would disappear from results.

Solution:
- LEFT JOIN with NULL filtering

Example:

```sql
WHERE s.submission_id IS NULL
```

This correctly identifies unattempted problems.

---

# Additional SQL Design Decisions

## Aggregation

GROUP BY was used whenever summary-level information was required.

Examples:
- counting submissions
- calculating averages
- measuring success rates

---

## Conditional Logic

CASE statements were used for:
- success-rate calculations
- language detection

This improves readability and logical clarity.

---

## Sorting and Ranking

ORDER BY and LIMIT were used for:
- latest submissions
- top attempted problems
- second-highest score retrieval

---

# Final Conclusion

The SQL queries were designed using relational database principles while prioritizing:

- correctness
- readability
- logical validation
- proper JOIN selection
- appropriate aggregation
- accurate filtering
- scalable query structure

The final query set demonstrates practical SQL querying ability across retrieval, joins, aggregation, subqueries, and validation scenarios.
