# rittman-analytics-assessment
Technical Assessment based on the GitHub Repo


This project uses dbt to model Stack Overflow data from Google BigQuery, identifying trending topics based on questions, views, votes, and comments. The data is structured using a star schema, with raw_trending_topics as the fact table, enriched with tags, engagement metrics, and answer status.

Key Features
	•	Trending Topics: Identifies high-engagement tags.
	•	Unanswered Questions: Highlights knowledge gaps in popular discussions.
	•	Dimensional Modeling: Uses surrogate keys, fact tables, and conformed dimensions for scalable analysis.

Data Sources
	•	Stack Overflow Posts, Comments, Votes, Tags, and Answers
	•	Processed with dbt for structured analytics

Deliverables
	•	dbt Models: Cleaned and aggregated datasets inside the model
	•	Google Looker Studio Dashboard: Insights on engagement trends and unanswered topics
     - https://lookerstudio.google.com/reporting/f841b356-553a-4b48-b1cc-66b9a5ffd567
  • Google Docs: Data Modelling notes, lineage and comments
    - https://docs.google.com/document/d/1Sq3Sea9C6uxAapKrbQXwnp50U-_iUMEFwZxm_DjHaho/edit?usp=sharing

This project provides a foundation for deeper analysis of Stack Overflow discussions, helping identify areas where expert contributions are needed.
