# Rittman Analytics Assessment

A technical assessment using **dbt** to model **Stack Overflow data** from **Google BigQuery**, identifying **trending topics**, **unanswered questions**, and **engagement trends**.

## Project Overview

This project processes **Stack Overflow discussions** using a **star schema** data model.  
The **`raw_trending_topics`** table serves as the **fact table**, enriched with **tags, engagement metrics, and answer status** to uncover key insights.

### Key Features
- **Trending Topics** – Identifies high-engagement tags.
- **Unanswered Questions** – Highlights knowledge gaps in popular discussions.
- **Dimensional Modeling** – Uses **surrogate keys, fact tables, and conformed dimensions** for scalable analytics.

## Data Sources
- **Stack Overflow**: Posts, Comments, Votes, Tags, and Answers
- **dbt**: Cleans and models data for structured analysis.

## Deliverables
- **dbt Models**: Structured datasets for analytics.
- **Google Looker Studio Dashboard**: Insights on engagement & unanswered questions.  
  [View Dashboard](https://lookerstudio.google.com/reporting/f841b356-553a-4b48-b1cc-66b9a5ffd567)
- **Google Docs**: Data Modeling notes, lineage, and documentation.  
  [View Documentation](https://docs.google.com/document/d/1Sq3Sea9C6uxAapKrbQXwnp50U-_iUMEFwZxm_DjHaho/edit?usp=sharing)

---

This project lays the foundation for **deeper analysis of Stack Overflow discussions**, helping identify areas where **expert contributions** are needed.
